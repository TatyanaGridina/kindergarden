part of 'login_view_state.dart';

class LoginViewState extends LoginViewStateAbstract {
  Rx<State> get state => super._state;
  Error? get error => super._error.value;

  LoginViewState(Rx<State> state)
      : super(
          state,
          Rx<Error?>(state.value.error),
        );

  onChangeState(_) {
    _error.value = _state.value.error;
  }
}
