import 'package:kindergarden/entities/result.dart';
import 'package:kindergarden/state/state.dart';

abstract class IGetStateLocalRepository {
  Result<State?> call();
}
