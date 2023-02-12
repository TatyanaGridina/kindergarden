import 'dart:convert';
import 'package:kindergarden/features/app/data/providers/dio_provider.dart';
import 'package:kindergarden/entities/backend_settings.dart';
import 'package:kindergarden/entities/result.dart';
import 'package:dio/dio.dart';
import 'package:kindergarden/features/image/data/models/image_response.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

part 'image_datasource.g.dart';

class ImageDatasource {
  final DioProvider _dioProvider;

  ImageDatasource(this._dioProvider);

  Future<Result<ImageResponse>> call({required BackendSettings settings}) async {
    try {
      final baseUrl = settings.url;
      final auth = 'Basic ${base64Encode(utf8.encode('${settings.login}:${settings.password}'))}';
      final HttpResponse<ImageResponse> response =
          await ImageDao(_dioProvider.dio, baseUrl: baseUrl).invoke(auth: auth);

      Result<ImageResponse> result = response.toResult<ImageResponse>();
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
abstract class ImageDao {
  factory ImageDao(Dio dio, {String baseUrl}) = _ImageDao;

  @POST("/getActiveUsers")
  Future<HttpResponse<ImageResponse>> invoke({
    @Header('Authorization') required String auth,
  });
}
