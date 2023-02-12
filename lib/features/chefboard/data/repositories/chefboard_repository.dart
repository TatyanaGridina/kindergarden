import 'package:kindergarden/entities/backend_settings.dart';
import 'package:kindergarden/features/chefboard/data/datasources/chefboard_datasource.dart';
import 'package:kindergarden/features/chefboard/data/models/chefboard_response.dart';
import 'package:kindergarden/features/chefboard/logic/repositories/chefboard_repository.dart';

class ChefboardRepository extends IChefboardRepository {
  final ChefboardDatasource _dashboardDatasource;

  ChefboardRepository(this._dashboardDatasource);

  @override
  Future<Map<String, List<String>>> call({required BackendSettings settings}) async {
    final result = await _dashboardDatasource(settings: settings);
    if (result.isErr) throw result.error ?? 'Cannot chefboard';

    final Map<String, List<String>> map = _mapResponse(result.data!);

    return map;
  }

  _mapResponse(ChefboardResponse response) {
    Map<String, List<String>> map = {};
    for (var e in (response.data ?? {}).entries) {
      List<String> users = (e.value as List<dynamic>).map((user) => user.toString().trim()).toList();
      map[e.key] = users;
    }
    return map;
  }
}
