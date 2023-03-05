import 'package:get/get.dart';
import 'package:kindergarden/entities/result.dart';
import 'package:kindergarden/state/state.dart';

part 'reports_view_state.m.dart';

abstract class ReportsViewStateAbstract {
  final Rx<State> _state;

  final Rx<Error?> _error;
  final RxString _gardenName;

  ReportsViewStateAbstract(
    this._state,
    this._error,
    this._gardenName,
  );
}
