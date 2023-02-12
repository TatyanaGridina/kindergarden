import 'package:get/get.dart';
import 'package:kindergarden/features/app/models/_models.dart';
import 'package:kindergarden/state/state/state.dart';

part 'login_view_state.m.dart';

abstract class LoginViewStateAbstract {
  final Rx<State> _state;

  final Rx<Error?> _error;

  LoginViewStateAbstract(
    this._state,
    this._error,
  );
}
