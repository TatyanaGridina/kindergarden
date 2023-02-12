import 'package:flutter/foundation.dart';
import 'package:kindergarden/entities/result.dart';
import 'package:get/get.dart';
import 'package:kindergarden/features/state/interfaces/save_state_local_repository.dart';
import 'package:kindergarden/state/state.dart';

class SetStateUsecase {
  final Rx<State> _state;
  final ISaveStateLocalRepository _saveStateLocalRepository;

  SetStateUsecase(this._state, this._saveStateLocalRepository);

  call({required State newState, required Type usecase}) {
    _state.value = newState;
    _saveStateLocal(newState).then((_) {});
  }

  _saveStateLocal(State newState) async {
    final result = await _saveStateLocalRepository(newState);
    if (result is Ok) {
      // print('[SAVE] ${newState.usecase}');
    } else {
      if (kDebugMode) {
        print('ERROR: ${result.error}');
      }
      throw result.error!;
    }
  }
}
