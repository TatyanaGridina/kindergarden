import 'package:get/get.dart';
import 'package:kindergarden/features/app/models/_models.dart';
import 'package:kindergarden/state/state/state.dart';

part 'chefboard_view_state.m.dart';

abstract class ChefboardViewStateAbstract {
  final Rx<State> _state;

  final Rx<Error?> _error;
  final RxString _gardenName;

  ChefboardViewStateAbstract(
    this._state,
    this._error,
    this._gardenName,
  );
}
