import 'package:flutter/foundation.dart';
import 'package:kindergarden/features/_state/logic/actions/set_state_action.dart';
import 'package:kindergarden/features/_state/action.dart';
import 'package:kindergarden/features/_state/logic/repositories/save_state_local_repository.dart';
import 'package:kindergarden/features/app/models/_models.dart';
import 'package:kindergarden/features/_state/state/_state.dart';
import 'package:get/get.dart';

class SaveStateAction extends Action {
  final ISaveStateLocalRepository _saveStateLocalRepository;

  SaveStateAction(Rx<State> state, SetStateAction setAppStateAction, this._saveStateLocalRepository)
      : super(state, setAppStateAction);

  call(State newState) {
    try {
      _saveStateLocal(newState).then((_) {});
    } catch (e) {
      onErrorActionHandler(e);
    } finally {
      // onEndActionHandler();
    }
  }

  _saveStateLocal(State newState) async {
    final result = await _saveStateLocalRepository(newState);
    if (result is Ok) {
      // print('[SAVE] ${newState.action}');
    } else {
      if (kDebugMode) {
        print('ERROR: ${result.error}');
      }
      throw result.error!;
    }
  }
}
