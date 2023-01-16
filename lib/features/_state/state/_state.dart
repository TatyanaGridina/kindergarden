import 'package:kindergarden/features/_state/state/dashboard_state.dart';
import 'package:kindergarden/features/_state/state/auth_state.dart';
import 'package:kindergarden/features/app/models/_models.dart';

import 'router_state.dart';
export 'router_state.dart';

class State {
  final int timestamp;
  final Type action;
  final RouterState router;

  final AuthState auth;
  final DashboardState dashboard;
  final Error? error;

  State({
    Type? action,
    RouterState? router,
    AuthState? auth,
    DashboardState? dashboard,
    this.error,
  })  : action = action ?? State,
        timestamp = DateTime.now().microsecondsSinceEpoch,
        auth = auth ?? AuthState(),
        dashboard = dashboard ?? DashboardState(),
        router = router ?? RouterState();

  State copyWith({
    required Type action,
    RouterState? router,
    AuthState? auth,
    DashboardState? dashboard,
    Error? error,
  }) =>
      State(
        action: action,
        router: router ?? this.router,
        auth: auth ?? this.auth,
        dashboard: dashboard ?? this.dashboard,
        error: error ?? this.error,
      );
}
