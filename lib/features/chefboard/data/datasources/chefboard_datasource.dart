import 'dart:convert';
import 'package:kindergarden/data/providers/dio_provider.dart';
import 'package:kindergarden/entities/backend_settings.dart';
import 'package:kindergarden/features/app/models/_models.dart';
import 'package:dio/dio.dart';
import 'package:kindergarden/features/chefboard/data/models/chefboard_response.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

part 'chefboard_datasource.g.dart';

class ChefboardDatasource {
  final DioProvider _dioProvider;

  ChefboardDatasource(this._dioProvider);

  Future<Result<ChefboardResponse>> call({required BackendSettings settings}) async {
    try {
      final baseUrl = settings.url;
      final auth = 'Basic ${base64Encode(utf8.encode('${settings.login}:${settings.password}'))}';
      final HttpResponse<ChefboardResponse> response =
          await ChefboardDao(_dioProvider.dio, baseUrl: baseUrl).invoke(auth: auth);

      Result<ChefboardResponse> result = response.toResult<ChefboardResponse>();
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
abstract class ChefboardDao {
  factory ChefboardDao(Dio dio, {String baseUrl}) = _ChefboardDao;

  @POST("/getActiveUsers")
  Future<HttpResponse<ChefboardResponse>> invoke({
    @Header('Authorization') required String auth,
  });
}
