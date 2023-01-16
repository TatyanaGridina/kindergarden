import 'package:get/get.dart';
import 'package:kindergarden/features/_state/state/_state.dart';
import 'package:kindergarden/features/app/models/_models.dart';

part 'app_view_state.m.dart';

abstract class AppViewStateAbstract {
  final Rx<State> _state;

  final Rx<Error?> _error;

  AppViewStateAbstract(
    this._state,
    this._error,
  );
}
