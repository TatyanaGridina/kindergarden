import 'package:get/get.dart';
import 'package:kindergarden/state/action.dart';
import 'package:kindergarden/state/logic/actions/set_state_action.dart';
import 'package:kindergarden/state/state/state.dart';

class SetChefboardStateAction extends Action {
  SetChefboardStateAction(
    Rx<State> state,
    SetStateAction setAppStateAction,
  ) : super(state, setAppStateAction);

  call(String name, dynamic value) async {
    try {
      onStartActionHandler(runtimeType);
      if (name == 'title') {
        saveTitleToState(value);
      }
    } catch (e) {
      onErrorActionHandler(e);
    } finally {
      onEndActionHandler();
    }
  }

  saveTitleToState(String value) async {
    // if (state.chefboard.title == value) return;
    //
    // await setState(
    //   state.copyWith(
    //     action: runtimeType,
    //     chefboard: state.chefboard.copyWith(title: value),
    //   ),
    // );
  }
}
