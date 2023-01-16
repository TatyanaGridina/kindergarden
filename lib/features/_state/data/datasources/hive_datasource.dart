import 'package:kindergarden/features/_state/data/models/auth_state_local.dart';
import 'package:kindergarden/features/_state/data/models/state_local.dart';
import 'package:kindergarden/features/app/models/_models.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveDatasource {
  final _db = Hive;
  static const stateBox = 'state';

  init() async {
    final directory = await getApplicationDocumentsDirectory();
    _db
          ..init(directory.path)
          ..registerAdapter(StateLocalAdapter()) // 0
          ..registerAdapter(AuthStateLocalAdapter()) // 1
        ;

    await _db.deleteBoxFromDisk(stateBox);

    await _db.openBox(stateBox);
  }

  Result<StateLocal?> getState() {
    final box = _db.box(stateBox);
    final state = box.get(stateBox);

    return Ok(state);
  }

  Future<Result<bool>> saveState(StateLocal state) async {
    final box = _db.box(stateBox);
    await box.put(stateBox, state);

    return const Ok(true);
  }
}
