import 'package:kindergarden/features/router/logic/actions/go_off_action.dart';
import 'package:kindergarden/features/router/logic/actions/go_to_action.dart';
import 'package:kindergarden/features/router/logic/actions/set_current_route_action.dart';

class RouterViewActions {
  final GoToAction goToAction;
  final GoOffAction goOffAction;
  final SetCurrentRouteAction setCurrentRouteAction;

  RouterViewActions(
    this.goToAction,
    this.goOffAction,
    this.setCurrentRouteAction,
  );
}
