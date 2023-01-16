import 'package:kindergarden/features/app/models/_models.dart';
import 'package:kindergarden/features/_state/state/_state.dart';

abstract class ISaveStateLocalRepository {
  Future<Result<bool>> call(State state);
}
