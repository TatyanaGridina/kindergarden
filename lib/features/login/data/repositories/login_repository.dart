import 'package:kindergarden/entities/backend_settings.dart';
import 'package:kindergarden/features/login/data/datasources/login_datasource.dart';
import 'package:kindergarden/features/login/data/models/backend_response.dart';
import 'package:kindergarden/features/login/interfaces/login_repository.dart';

class LoginRepository extends ILoginRepository {
  final LoginDatasource _loginDatasource;

  LoginRepository(this._loginDatasource);

  @override
  Future<Map<String, List<String>>> call({required BackendSettings settings}) async {
    final result = await _loginDatasource(settings: settings);
    if (result.isErr) throw result.error ?? 'Cannot login';

    final Map<String, List<String>> map = _mapResponse(result.data!);

    return map;
  }

  _mapResponse(BackendResponse response) {
    Map<String, List<String>> map = {};
    for (var e in (response.data ?? {}).entries) {
      List<String> users = (e.value as List<dynamic>).map((user) => user.toString().trim()).toList();
      map[e.key] = users;
    }
    return map;
  }
}
