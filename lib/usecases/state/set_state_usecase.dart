import 'package:flutter/foundation.dart';
import 'package:kindergarden/entities/result.dart';
import 'package:get/get.dart';
import 'package:kindergarden/entities/user.dart';
import 'package:kindergarden/state/garden_state.dart';
import 'package:kindergarden/state/state.dart';
import 'package:kindergarden/state/user_state.dart';
import 'package:kindergarden/usecases/state/state_interface.dart';

class SetStateUsecase {
  final Rx<State> _state;
  final ISaveStateLocalRepository _saveStateLocalRepository;

  SetStateUsecase(this._state, this._saveStateLocalRepository);

  call(State newState) {
    _state.value = newState;
    _saveStateLocal(newState).then((_) {});
  }

  user({
    required Type usecase,
    String? email,
    String? name,
    UserRole? role,
    String? token,
  }) {
    final value = UserState(
      email: email ?? _state.value.user.email,
      name: name ?? _state.value.user.name,
      role: role ?? _state.value.user.role,
      token: token ?? _state.value.user.token,
    );
    call(_state.value.copyWith(usecase: usecase, user: value));
  }

  garden({
    required Type usecase,
    String? name,
  }) {
    final value = GardenState(
      name: name ?? _state.value.garden.name,
    );
    call(_state.value.copyWith(usecase: usecase, garden: value));
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
