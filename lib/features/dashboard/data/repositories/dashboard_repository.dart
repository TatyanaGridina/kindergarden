import 'package:kindergarden/entities/backend_settings.dart';
import 'package:kindergarden/features/dashboard/data/datasources/dashboard_datasource.dart';
import 'package:kindergarden/features/dashboard/data/models/dashboard_response.dart';
import 'package:kindergarden/features/dashboard/logic/repositories/dashboard_repository.dart';

class DashboardRepository extends IDashboardRepository {
  final DashboardDatasource _dashboardDatasource;

  DashboardRepository(this._dashboardDatasource);

  @override
  Future<Map<String, List<String>>> call({required BackendSettings settings}) async {
    final result = await _dashboardDatasource(settings: settings);
    if (result.isErr) throw result.error ?? 'Cannot dashboard';

    final Map<String, List<String>> map = _mapResponse(result.data!);

    return map;
  }

  _mapResponse(DashboardResponse response) {
    Map<String, List<String>> map = {};
    for (var e in (response.data ?? {}).entries) {
      List<String> users = (e.value as List<dynamic>).map((user) => user.toString().trim()).toList();
      map[e.key] = users;
    }
    return map;
  }
}
