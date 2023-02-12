import 'package:kindergarden/entities/result.dart';
import 'package:get/get.dart';
import 'package:kindergarden/features/usecase.dart';
import 'package:kindergarden/features/state/usecases/set_state_usecase.dart';
import 'package:kindergarden/features/state/interfaces/get_state_local_repository.dart';
import 'package:kindergarden/state/state.dart';

class GetStateUsecase extends Usecase {
  final IGetStateLocalRepository _getStateLocalRepository;

  GetStateUsecase(Rx<State> state, SetStateUsecase setStateUsecase, this._getStateLocalRepository)
      : super(state, setStateUsecase);

  call() async {
    try {
      onStartUsecaseHandler(runtimeType);
      await _restoreState();
    } catch (e) {
      onErrorUsecaseHandler(e);
    } finally {
      onEndUsecaseHandler();
    }
  }

  _restoreState() async {
    final result = _getStateLocalRepository();

    if (result is Ok && result.data != null) {
      final newState = result.data!;
      await setState(newState.copyWith(
        usecase: runtimeType,
      ));
    } else if (result is Err) {
      throw result.error!;
    }
  }
}
