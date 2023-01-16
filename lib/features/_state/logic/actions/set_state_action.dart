import 'package:flutter/foundation.dart';
import 'package:kindergarden/features/_state/logic/repositories/save_state_local_repository.dart';
import 'package:kindergarden/features/app/models/result.dart';
import 'package:kindergarden/features/_state/state/_state.dart';
import 'package:get/get.dart';

class SetStateAction {
  final Rx<State> _state;
  final ISaveStateLocalRepository _saveStateLocalRepository;

  SetStateAction(this._state, this._saveStateLocalRepository);

  call({required State newState, required Type action}) {
    _state.value = newState;
    _saveStateLocal(newState).then((_) {});
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
