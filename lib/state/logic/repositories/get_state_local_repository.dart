import 'package:kindergarden/features/app/models/_models.dart';
import 'package:kindergarden/state/state/state.dart';

abstract class IGetStateLocalRepository {
  Result<State?> call();
}
