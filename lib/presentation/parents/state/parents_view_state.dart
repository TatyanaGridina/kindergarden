import 'package:get/get.dart';
import 'package:kindergarden/entities/result.dart';
import 'package:kindergarden/state/state.dart';

part 'parents_view_state.m.dart';

abstract class ParentsViewStateAbstract {
  final Rx<State> _state;

  final Rx<Error?> _error;
  final RxString _gardenName;

  ParentsViewStateAbstract(
    this._state,
    this._error,
    this._gardenName,
  );
}
