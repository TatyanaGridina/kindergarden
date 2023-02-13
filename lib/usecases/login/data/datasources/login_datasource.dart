import 'dart:convert';
import 'package:kindergarden/usecases/app/data/providers/dio_provider.dart';
import 'package:kindergarden/entities/backend_settings.dart';
import 'package:kindergarden/entities/result.dart';
import 'package:dio/dio.dart';
import 'package:kindergarden/usecases/login/data/models/backend_response.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

part 'login_datasource.g.dart';

class LoginDatasource {
  final DioProvider _dioProvider;

  LoginDatasource(this._dioProvider);

  Future<Result<BackendResponse>> call({required BackendSettings settings}) async {
    try {
      final baseUrl = settings.url;
      final auth = 'Basic ${base64Encode(utf8.encode('${settings.login}:${settings.password}'))}';
      final HttpResponse<BackendResponse> response =
          await LoginDao(_dioProvider.dio, baseUrl: baseUrl).invoke(auth: auth);

      Result<BackendResponse> result = response.toResult<BackendResponse>();
      if (result is Ok) {
        return Ok(result.data!);
      } else {
        return Err(result.error);
      }
    } catch (e) {
      return e.toError();
    }
  }
}

@RestApi()
abstract class LoginDao {
  factory LoginDao(Dio dio, {String baseUrl}) = _LoginDao;

  @POST("/getActiveUsers")
  Future<HttpResponse<BackendResponse>> invoke({
    @Header('Authorization') required String auth,
  });
}
