import 'package:flutter/foundation.dart';
import 'package:kindergarden/entities/result.dart';
import 'package:get/get.dart';
import 'package:kindergarden/features/usecase.dart';
import 'package:kindergarden/features/state/usecases/set_state_usecase.dart';
import 'package:kindergarden/features/state/interfaces/save_state_local_repository.dart';
import 'package:kindergarden/state/state.dart';

class SaveStateUsecase extends Usecase {
  final ISaveStateLocalRepository _saveStateLocalRepository;

  SaveStateUsecase(Rx<State> state, SetStateUsecase setStateUsecase, this._saveStateLocalRepository)
      : super(state, setStateUsecase);

  call(State newState) {
    try {
      _saveStateLocal(newState).then((_) {});
    } catch (e) {
      onErrorUsecaseHandler(e);
    } finally {
      // onEndActionHandler();
    }
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
