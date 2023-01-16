import 'package:flutter/foundation.dart';
import 'package:kindergarden/features/_state/logic/actions/set_state_action.dart';
import 'package:kindergarden/features/app/models/_models.dart';
import 'package:kindergarden/features/_state/state/_state.dart';
import 'package:get/get.dart';

abstract class Action {
  final Rx<State> _state;
  Type _action = Action;
  int _startActionTimestamp = 0;
  final SetStateAction _setAppStateAction;
  Action(this._state, this._setAppStateAction);
  State get state => _state.value;

  onStartActionHandler(Type action) {
    _startActionTimestamp = DateTime.now().millisecondsSinceEpoch;
    _action = action;
    if (kDebugMode) {
      print('[START] $action');
    }
  }

  onEndActionHandler() {
    final duration = DateTime.now().millisecondsSinceEpoch - _startActionTimestamp;
    if (kDebugMode) {
      print('[END] $_action $duration ms');
    }
  }

  onErrorActionHandler(e) {
    Error error;
    if (e is Error) {
      error = e;
    } else if (e is Err) {
        error = e.error!;
    } else {
      error = Error(message: e.toString());
    }
    if (kDebugMode) {
      print('[ERROR] $_action ${error.message}');
    }
    setState(_state.value.copyWith(action: _action, error: error));
  }

  setState(State newState) {
    // print('[CHANGE]  ${newState.action}');
    _setAppStateAction(newState: newState, action: _action);
  }
}
