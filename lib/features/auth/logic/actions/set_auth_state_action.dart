import 'package:kindergarden/data/entities/user.dart';
import 'package:kindergarden/features/_state/logic/actions/set_state_action.dart';
import 'package:kindergarden/features/_state/action.dart';
import 'package:kindergarden/features/_state/state/_state.dart';
import 'package:get/get.dart';

class SetAuthStateAction extends Action {
  SetAuthStateAction(
    Rx<State> state,
    SetStateAction setAppStateAction,
  ) : super(state, setAppStateAction);

  call(String name, dynamic value) async {
    try {
      onStartActionHandler(runtimeType);
      if (name == 'user') {
        saveUserToState(value);
      } else if (name == 'accessToken') {
        saveAccessTokenToState(value);
      }
    } catch (e) {
      onErrorActionHandler(e);
    } finally {
      onEndActionHandler();
    }
  }

  saveUserToState(User? value) async {
    if (state.auth.user == value) return;

    await setState(
      state.copyWith(
        action: runtimeType,
        auth: state.auth.copyWith(user: value),
      ),
    );
  }

  saveAccessTokenToState(String value) async {
    if (state.auth.accessToken == value) return;

    await setState(
      state.copyWith(
        action: runtimeType,
        auth: state.auth.copyWith(accessToken: value),
      ),
    );
  }
}
