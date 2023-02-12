part of 'router_view_state.dart';

class RouterViewState extends RouterViewStateAbstract {
  Rx<State> get state => super._state;

  GetPage get currentRoute => super._currentRoute.value;

  int get currentRouteIndex => super._currentRouteIndex.value;

  RouterViewState(Rx<State> state)
      : super(
          state,
          Rx(state.value.router.currentRoute),
          Rx(state.value.router.currentRouteIndex),
        );

  onChangeState(_) {
    _currentRoute.value = _state.value.router.currentRoute;
  }
}
