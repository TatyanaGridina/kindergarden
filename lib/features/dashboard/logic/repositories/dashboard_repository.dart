import 'package:kindergarden/features/app/models/BackendSettings.dart';

abstract class IDashboardRepository {
  Future<Map<String, List<String>>> call({required BackendSettings settings});
}
