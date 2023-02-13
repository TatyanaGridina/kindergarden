import 'package:kindergarden/entities/backend_settings.dart';

abstract class ILoginRepository {
  Future<Map<String, List<String>>> call({required BackendSettings settings});
}
