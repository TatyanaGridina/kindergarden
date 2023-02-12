import 'package:kindergarden/entities/result.dart';
import 'package:hive/hive.dart';
import 'package:kindergarden/features/state/data/models/garden_state_local.dart';
import 'package:kindergarden/features/state/data/models/state_local.dart';
import 'package:kindergarden/features/state/data/models/user_role_local.dart';
import 'package:kindergarden/features/state/data/models/user_state_local.dart';
import 'package:path_provider/path_provider.dart';

class HiveDatasource {
  final _db = Hive;
  static const stateBox = 'state';

  init() async {
    final directory = await getApplicationDocumentsDirectory();
    _db
          ..init(directory.path)
          ..registerAdapter(StateLocalAdapter()) // 0
          ..registerAdapter(UserStateLocalAdapter()) // 1
          ..registerAdapter(GardenStateLocalAdapter()) // 2
          ..registerAdapter(UserRoleLocalAdapter()) // 3
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
