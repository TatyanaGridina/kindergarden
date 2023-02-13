import 'package:get/get.dart';
import 'package:kindergarden/usecases/usecase.dart';
import 'package:kindergarden/usecases/state/set_state_usecase.dart';
import 'package:kindergarden/presentation/router/ui/routes.dart';
import 'package:kindergarden/entities/result.dart';
import 'package:kindergarden/state/state.dart';

class SetRouterStateUsecase extends Usecase {
  SetRouterStateUsecase(
    Rx<State> state,
    SetStateUsecase setStateUsecase,
  ) : super(state, setStateUsecase);

  call({
    String? path,
  }) async {
    try {
      onStartUsecaseHandler(runtimeType);
      _saveCurrentRouteToState(path);
    } catch (e) {
      onErrorUsecaseHandler(e);
    } finally {
      onEndUsecaseHandler();
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
        usecase: runtimeType,
        router: state.router.copyWith(currentRoute: currentRoute, currentRouteIndex: currentRouteIndex),
      ),
    );
  }

}
