part of 'app_view_state.dart';

class AppViewState extends AppViewStateAbstract {
  Rx<State> get state => super._state;

  Error? get error => super._error.value;

  AppViewState(Rx<State> state)
      : super(
          state,
          Rx<Error?>(state.value.error),
        );

  onChangeState(_) {
    _error.value = _state.value.error;
  }
}
