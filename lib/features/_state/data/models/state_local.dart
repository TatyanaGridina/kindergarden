import 'package:hive/hive.dart';
import 'package:kindergarden/features/_state/data/models/auth_state_local.dart';
import 'package:kindergarden/features/_state/state/_state.dart';

part 'state_local.g.dart';

@HiveType(typeId: 0)
class StateLocal extends HiveObject {
  @HiveField(0)
  final AuthStateLocal login;

  StateLocal({required this.login});

  factory StateLocal.fromState(State state) => StateLocal(
        login: AuthStateLocal.fromAuthState(state.auth),
      );

  toState() {
    final state = State(
      action: runtimeType,
      router: RouterState(),
      auth: login.toLoginState(),
      error: null,
    );

    return state;
  }
}
