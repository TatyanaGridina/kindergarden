import 'dart:convert';
import 'package:kindergarden/data/providers/dio_provider.dart';
import 'package:kindergarden/entities/backend_settings.dart';
import 'package:kindergarden/features/app/models/_models.dart';
import 'package:dio/dio.dart';
import 'package:kindergarden/features/dashboard/data/models/dashboard_response.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

part 'dashboard_datasource.g.dart';

class DashboardDatasource {
  final DioProvider _dioProvider;

  DashboardDatasource(this._dioProvider);

  Future<Result<DashboardResponse>> call({required BackendSettings settings}) async {
    try {
      final baseUrl = settings.url;
      final auth = 'Basic ${base64Encode(utf8.encode('${settings.login}:${settings.password}'))}';
      final HttpResponse<DashboardResponse> response =
          await DashboardDao(_dioProvider.dio, baseUrl: baseUrl).invoke(auth: auth);

      Result<DashboardResponse> result = response.toResult<DashboardResponse>();
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
abstract class DashboardDao {
  factory DashboardDao(Dio dio, {String baseUrl}) = _DashboardDao;

  @POST("/getActiveUsers")
  Future<HttpResponse<DashboardResponse>> invoke({
    @Header('Authorization') required String auth,
  });
}
