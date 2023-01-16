import 'package:kindergarden/features/app/models/BackendSettings.dart';

abstract class ILoginRepository {
  Future<Map<String, List<String>>> call({required BackendSettings settings});
}
