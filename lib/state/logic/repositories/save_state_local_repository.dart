import 'package:kindergarden/features/app/models/_models.dart';
import 'package:kindergarden/state/state/state.dart';

abstract class ISaveStateLocalRepository {
  Future<Result<bool>> call(State state);
}
