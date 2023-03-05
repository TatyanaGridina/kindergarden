import 'package:get/get.dart';
import 'package:kindergarden/entities/result.dart';
import 'package:kindergarden/state/state.dart';

part 'teachers_view_state.m.dart';

abstract class TeachersViewStateAbstract {
  final Rx<State> _state;

  final Rx<Error?> _error;
  final RxString _gardenName;

  TeachersViewStateAbstract(
    this._state,
    this._error,
    this._gardenName,
  );
}
