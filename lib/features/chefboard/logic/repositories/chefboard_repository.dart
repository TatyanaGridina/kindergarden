import 'package:kindergarden/entities/backend_settings.dart';

abstract class IChefboardRepository {
  Future<Map<String, List<String>>> call({required BackendSettings settings});
}
