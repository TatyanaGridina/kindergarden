import 'package:kindergarden/features/_state/logic/actions/set_state_action.dart';
import 'package:kindergarden/features/_state/action.dart';
import 'package:kindergarden/features/_state/state/_state.dart';
import 'package:kindergarden/features/router/presentation/ui/routes.dart';
import 'package:kindergarden/features/app/models/_models.dart';
import 'package:get/get.dart';

class SetCurrentRouteAction extends Action {
  SetCurrentRouteAction(Rx<State> state, SetStateAction setAppStateAction) : super(state, setAppStateAction);

  call({String? path}) async {
    try {
      onStartActionHandler(runtimeType);
      _saveCurrentRouteToState(path);
    } catch (e) {
      onErrorActionHandler(e);
    } finally {
      onEndActionHandler();
    }
  }

  _saveCurrentRouteToState(String? path) {
    final index = routes.indexWhere((element) => element.name == path);
    if (index < 0 || index >= routes.length) {
      throw Error(message: 'Path "$path" is undefined');
    }

    final currentRouteIndex = routes.indexWhere((element) => element.name == path);
    final currentRoute = routes[currentRouteIndex];

    setState(
      state.copyWith(
        action: runtimeType,
        router: state.router.copyWith(currentRoute: currentRoute, currentRouteIndex: currentRouteIndex),
      ),
    );
  }
}
