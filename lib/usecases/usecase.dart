import 'package:flutter/foundation.dart';
import 'package:kindergarden/entities/result.dart';
import 'package:get/get.dart';
import 'package:kindergarden/state/state.dart';
import 'package:kindergarden/usecases/state/set_state_usecase.dart';

abstract class Usecase {
  final Rx<State> _state;
  Type _usecase = Usecase;
  int _startUsecaseTimestamp = 0;
  final SetStateUsecase setState;
  Usecase(this._state, this.setState);
  State get state => _state.value;

  onStartUsecaseHandler(Type usecase) {
    _startUsecaseTimestamp = DateTime.now().millisecondsSinceEpoch;
    _usecase = usecase;
    if (kDebugMode) {
      print('[START] $usecase');
    }
  }

  onEndUsecaseHandler() {
    final duration = DateTime.now().millisecondsSinceEpoch - _startUsecaseTimestamp;
    if (kDebugMode) {
      print('[END] $_usecase $duration ms');
    }
  }

  onErrorUsecaseHandler(e) {
    Error error;
    if (e is Error) {
      error = e;
    } else if (e is Err) {
        error = e.error!;
    } else {
      error = Error(message: e.toString());
    }
    if (kDebugMode) {
      print('[ERROR] $_usecase ${error.message}');
    }
    setState(_state.value.copyWith(usecase: _usecase, error: error));
  }
}
