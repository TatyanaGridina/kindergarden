import 'package:get/get.dart';
import 'package:kindergarden/features/app/models/_models.dart';
import 'package:kindergarden/features/_state/state/_state.dart';

part 'dashboard_view_state.m.dart';

abstract class DashboardViewStateAbstract {
  final Rx<State> _state;

  final Rx<Error?> _error;
  final RxString _title;

  DashboardViewStateAbstract(
    this._state,
    this._error,
    this._title,
  );
}
