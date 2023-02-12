import 'package:hive/hive.dart';
import 'package:kindergarden/state/data/models/garden_state_local.dart';
import 'package:kindergarden/state/data/models/user_state_local.dart';
import 'package:kindergarden/state/state/state.dart';

part 'state_local.g.dart';

@HiveType(typeId: 0)
class StateLocal extends HiveObject {
  @HiveField(0)
  final UserStateLocal user;
  @HiveField(1)
  final GardenStateLocal garden;

  StateLocal({
    required this.user,
    required this.garden,
  });

  factory StateLocal.fromState(State state) => StateLocal(
        user: UserStateLocal.fromUserState(state.user),
        garden: GardenStateLocal.fromGardenState(state.garden),
      );

  toState() {
    final state = State(
      action: runtimeType,
      router: RouterState(),
      user: user.toUserState(),
      garden: garden.toGardenState(),
      error: null,
    );

    return state;
  }
}
