import 'package:get/get.dart';
import 'package:kindergarden/entities/result.dart';
import 'package:kindergarden/state/state.dart';

part 'app_view_state.m.dart';

abstract class AppViewStateAbstract {
  final Rx<State> _state;

  final Rx<Error?> _error;

  AppViewStateAbstract(
    this._state,
    this._error,
  );
}
