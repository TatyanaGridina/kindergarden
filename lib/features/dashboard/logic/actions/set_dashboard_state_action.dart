import 'package:kindergarden/features/_state/logic/actions/set_state_action.dart';
import 'package:kindergarden/features/_state/action.dart';
import 'package:kindergarden/features/_state/state/_state.dart';
import 'package:get/get.dart';

class SetDashboardStateAction extends Action {
  SetDashboardStateAction(
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
    if (state.dashboard.title == value) return;

    await setState(
      state.copyWith(
        action: runtimeType,
        dashboard: state.dashboard.copyWith(title: value),
      ),
    );
  }
}
