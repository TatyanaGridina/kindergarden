import 'package:get/get.dart';
import 'package:kindergarden/state/action.dart';
import 'package:kindergarden/state/logic/actions/set_state_action.dart';
import 'package:kindergarden/state/state/state.dart';

class GoToAction extends Action {
  GoToAction(Rx<State> state, SetStateAction setAppStateAction) : super(state, setAppStateAction);

  void call({required GetPage route}) {
    try {
      onStartActionHandler(runtimeType);
      Get.toNamed(route.name);
    } catch (e) {
      onErrorActionHandler(e);
    } finally {
      onEndActionHandler();
    }
  }
}
