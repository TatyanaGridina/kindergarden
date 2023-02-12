import 'package:kindergarden/features/login/logic/actions/set_auth_state_action.dart';
import 'package:kindergarden/features/router/logic/actions/go_off_action.dart';

class LoginViewActions {
  final SetUserStateAction setAuthStateAction;
  final GoOffAction goOffAction;

  LoginViewActions(
    this.setAuthStateAction,
      this.goOffAction,
  );
}
