import 'package:get/get.dart';
import 'package:kindergarden/entities/user.dart';
import 'package:kindergarden/state/action.dart';
import 'package:kindergarden/state/logic/actions/set_state_action.dart';
import 'package:kindergarden/state/state/state.dart';

class SetUserStateAction extends Action {
  SetUserStateAction(
    Rx<State> state,
    SetStateAction setAppStateAction,
  ) : super(state, setAppStateAction);

  call(User value) async {
    try {
      onStartActionHandler(runtimeType);
      saveUserToState(value);
    } catch (e) {
      onErrorActionHandler(e);
    } finally {
      onEndActionHandler();
    }
  }

  saveUserToState(User value) async {
    if (state.user == value) return;

    await setState(
      state.copyWith(
        action: runtimeType,
        user: state.user.copyWith(email: value.email, name: value.name, role: value.role, token: value.token),
      ),
    );
  }
}
