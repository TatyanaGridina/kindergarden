import 'package:get/get.dart';
import 'package:kindergarden/features/_state/state/_state.dart';

part 'router_view_state.m.dart';

abstract class RouterViewStateAbstract {
  final Rx<State> _state;

  final Rx<GetPage> _currentRoute;
  final Rx<int> _currentRouteIndex;

  RouterViewStateAbstract(
    this._state,
    this._currentRoute,
    this._currentRouteIndex,
  );
}
