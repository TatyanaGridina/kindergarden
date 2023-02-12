import 'package:kindergarden/entities/result.dart';
import 'package:kindergarden/state/state.dart';

abstract class ISaveStateLocalRepository {
  Future<Result<bool>> call(State state);
}
