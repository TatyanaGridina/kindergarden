import 'package:get/get.dart';
import 'package:kindergarden/state/action.dart';
import 'package:kindergarden/state/logic/actions/set_state_action.dart';
import 'package:kindergarden/state/state/state.dart';

class GoOffAction extends Action {
  GoOffAction(Rx<State> state, SetStateAction setAppStateAction) : super(state, setAppStateAction);

  void call({required GetPage route}) {
    try {
      onStartActionHandler(runtimeType);
      Get.offNamed(route.name);
    } catch (e) {
      onErrorActionHandler(e);
    } finally {
      onEndActionHandler();
    }
  }
}
