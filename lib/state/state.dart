import 'package:kindergarden/entities/result.dart';
import 'package:kindergarden/state/user_state.dart';

import 'garden_state.dart';
import 'router_state.dart';
export 'router_state.dart';

class State {
  final int timestamp;
  final Type usecase;
  final RouterState router;

  final UserState user;
  final GardenState garden;
  final Error? error;

  State({
    Type? usecase,
    RouterState? router,
    UserState? user,
    GardenState? garden,
    this.error,
  })  : usecase = usecase ?? State,
        timestamp = DateTime.now().microsecondsSinceEpoch,
        user = user ?? UserState(),
        garden = garden ?? GardenState(),
        router = router ?? RouterState();

  State copyWith({
    required Type usecase,
    RouterState? router,
    UserState? user,
    GardenState? garden,
    Error? error,
  }) =>
      State(
        usecase: usecase,
        router: router ?? this.router,
        user: user ?? this.user,
        garden: garden ?? this.garden,
        error: error ?? this.error,
      );
}
