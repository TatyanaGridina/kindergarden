import 'package:kindergarden/entities/result.dart';
import 'package:kindergarden/state/state.dart';

abstract class IGetStateLocalRepository {
  Result<State?> call();
}

abstract class ISaveStateLocalRepository {
  Future<Result<bool>> call(State state);
}
