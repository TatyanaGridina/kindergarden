import 'package:kindergarden/features/app/models/_models.dart';
import 'package:kindergarden/state/state/user_state.dart';

import 'garden_state.dart';
import 'router_state.dart';
export 'router_state.dart';

class State {
  final int timestamp;
  final Type action;
  final RouterState router;

  final UserState user;
  final GardenState garden;
  final Error? error;

  State({
    Type? action,
    RouterState? router,
    UserState? user,
    GardenState? garden,
    this.error,
  })  : action = action ?? State,
        timestamp = DateTime.now().microsecondsSinceEpoch,
        user = user ?? UserState(),
        garden = garden ?? GardenState(),
        router = router ?? RouterState();

  State copyWith({
    required Type action,
    RouterState? router,
    UserState? user,
    GardenState? garden,
    Error? error,
  }) =>
      State(
        action: action,
        router: router ?? this.router,
        user: user ?? this.user,
        garden: garden ?? this.garden,
        error: error ?? this.error,
      );
}
