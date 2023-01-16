import 'package:kindergarden/features/_state/data/datasources/hive_datasource.dart';
import 'package:kindergarden/features/_state/data/models/state_local.dart';
import 'package:kindergarden/features/_state/logic/repositories/save_state_local_repository.dart';
import 'package:kindergarden/features/app/models/_models.dart';
import 'package:kindergarden/features/_state/state/_state.dart';

class SaveStateLocalRepository extends ISaveStateLocalRepository {
  final HiveDatasource _datasource;
  SaveStateLocalRepository(this._datasource);

  @override
  Future<Result<bool>> call(State state) {
    final stateLocal = StateLocal.fromState(state);
    return _datasource.saveState(stateLocal);
  }
}
