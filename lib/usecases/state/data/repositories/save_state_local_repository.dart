import 'package:kindergarden/entities/result.dart';
import 'package:kindergarden/usecases/state/data/datasources/hive_datasource.dart';
import 'package:kindergarden/usecases/state/data/models/state_local.dart';
import 'package:kindergarden/state/state.dart';
import 'package:kindergarden/usecases/state/state_interface.dart';

class SaveStateLocalRepository extends ISaveStateLocalRepository {
  final HiveDatasource _datasource;
  SaveStateLocalRepository(this._datasource);

  @override
  Future<Result<bool>> call(State state) {
    final stateLocal = StateLocal.fromState(state);
    return _datasource.saveState(stateLocal);
  }
}
