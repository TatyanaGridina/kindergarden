import 'package:get/get.dart';
import 'package:kindergarden/entities/result.dart';
import 'package:kindergarden/state/state.dart';

part 'login_view_state.m.dart';

abstract class LoginViewStateAbstract {
  final Rx<State> _state;

  final Rx<Error?> _error;

  LoginViewStateAbstract(
    this._state,
    this._error,
  );
}
