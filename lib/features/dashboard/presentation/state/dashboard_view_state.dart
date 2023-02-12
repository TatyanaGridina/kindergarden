import 'package:get/get.dart';
import 'package:kindergarden/features/app/models/_models.dart';
import 'package:kindergarden/state/state/state.dart';

part 'dashboard_view_state.m.dart';

abstract class DashboardViewStateAbstract {
  final Rx<State> _state;

  final Rx<Error?> _error;
  final RxString _gardenName;

  DashboardViewStateAbstract(
    this._state,
    this._error,
    this._gardenName,
  );
}
