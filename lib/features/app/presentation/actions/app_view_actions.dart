import 'package:kindergarden/state/logic/actions/get_state_action.dart';
import 'package:kindergarden/features/router/logic/actions/go_off_action.dart';

class AppViewActions {
  final GetStateAction getStateAction;
  final GoOffAction goOffAction;

  AppViewActions(
    this.getStateAction,
    this.goOffAction,
  );
}
