import 'package:kindergarden/entities/result.dart';
import 'package:kindergarden/features/state/data/datasources/hive_datasource.dart';
import 'package:kindergarden/features/state/data/models/state_local.dart';
import 'package:kindergarden/features/state/interfaces/save_state_local_repository.dart';
import 'package:kindergarden/state/state.dart';

class SaveStateLocalRepository extends ISaveStateLocalRepository {
  final HiveDatasource _datasource;
  SaveStateLocalRepository(this._datasource);

  @override
  Future<Result<bool>> call(State state) {
    final stateLocal = StateLocal.fromState(state);
    return _datasource.saveState(stateLocal);
  }
}
