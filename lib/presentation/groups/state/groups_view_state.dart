import 'package:get/get.dart';
import 'package:kindergarden/entities/result.dart';
import 'package:kindergarden/state/state.dart';

part 'groups_view_state.m.dart';

abstract class GroupsViewStateAbstract {
  final Rx<State> _state;

  final Rx<Error?> _error;
  final RxString _gardenName;

  GroupsViewStateAbstract(
    this._state,
    this._error,
    this._gardenName,
  );
}
