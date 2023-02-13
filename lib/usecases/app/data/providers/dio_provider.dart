import 'package:flutter/foundation.dart';
import 'package:kindergarden/entities/result.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';

class DioProvider {
  final Dio _dio;

  Dio get dio => _dio;

  DioProvider()
      : _dio = Dio(BaseOptions(
          connectTimeout: 5000,
          receiveTimeout: 300000,
        )) {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        if (kDebugMode) {
          print('[DIO REQUEST] ${options.path}');
        }
        return handler.next(options);
        //continue
      },
      onResponse: (Response response, handler) {
        if (kDebugMode) {
          print('[DIO RESPONSE] ${response.requestOptions.path} '
              '${response.data.toString().length > 100 ? "${response.data.toString().substring(0, 100)}..." : response.data.toString()}');
        }

        return handler.next(response); //continue
      },
      onError: (DioError e, handler) {
        if (kDebugMode) {
          print('[DIO ERROR] ${e.requestOptions.path} $e ${e.response?.data ?? ''}');
        }
        return handler.next(e); //continue
      },
    ));
  }
}

extension FromHttpResponse on HttpResponse {
  Result<T> toResult<T>() {
    if (response.statusCode == 200) {
      return Ok(data);
    }

    if (kDebugMode) {
      print('FromHttpResponse');
    }

    return Err(Error(
      message: response.statusMessage,
      debugMessage: response.toString(),
      source: response,
    ));
  }
}

extension FromDioError on DioError {
  Err<T> toError<T>() {
    String message = 'Unknown error';
    if (type == DioErrorType.connectTimeout) message = 'Request error: connection timeout';
    if (type == DioErrorType.receiveTimeout) message = 'Request error: response timeout';
    if (type == DioErrorType.other) message = 'Request error: other error';
    if (type == DioErrorType.response) message = 'Request error: response error';
    return Err(Error(
      message: message,
      debugMessage: toString(),
      source: this,
    ));
  }
}

extension FromObject on Object {
  Err<T> toError<T>() {
    if (this is DioError) {
      final e = this as DioError;
      String message = 'Unknown error';
      if (e.type == DioErrorType.connectTimeout) message = 'Dio error: connection timeout';
      if (e.type == DioErrorType.receiveTimeout) message = 'Dio error: response timeout';
      if (e.type == DioErrorType.other) message = 'Dio error: other error';
      if (e.type == DioErrorType.response) {
        message = 'Dio error: ${e.response?.statusCode ?? ''} ${e.response?.statusMessage ?? ''}';
        try {
          if (e.response?.data.runtimeType == String) {
            message += ' ${e.response?.data}';
          } else {
            message += ' ${e.response?.data['description']}';
          }

          // ignore: empty_catches
        } catch (e) {}
      }
      return Err(Error(
        message: message,
        debugMessage: toString(),
        source: this,
      ));
    }
    return Err(Error(
      message: toString(),
      source: this,
    ));
  }
}
