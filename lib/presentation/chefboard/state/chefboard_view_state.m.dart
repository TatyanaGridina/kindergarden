part of 'chefboard_view_state.dart';

class ChefboardViewState extends ChefboardViewStateAbstract {
  Rx<State> get state => super._state;
  Error? get error => super._error.value;
  String get gardenName => super._gardenName.value;

  ChefboardViewState(Rx<State> state)
      : super(
          state,
          Rx<Error?>(state.value.error),
          RxString(state.value.garden.name),
        );

  onChangeState(_) {
    _error.value = _state.value.error;
    _gardenName.value = _state.value.garden.name;
  }
}
