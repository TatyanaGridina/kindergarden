import 'package:get/get.dart';
import 'package:kindergarden/features/usecase.dart';
import 'package:kindergarden/features/state/usecases/set_state_usecase.dart';
import 'package:kindergarden/state/garden_state.dart';
import 'package:kindergarden/state/state.dart';

class SetGardenStateUsecase extends Usecase {
  SetGardenStateUsecase(
    Rx<State> state,
    SetStateUsecase setStateUsecase,
  ) : super(state, setStateUsecase);

  call({
    String? name,
  }) async {
    try {
      onStartUsecaseHandler(runtimeType);
      saveToState(name: name);
    } catch (e) {
      onErrorUsecaseHandler(e);
    } finally {
      onEndUsecaseHandler();
    }
  }

  saveToState({
    String? name,
  }) async {
    final value = GardenState(
      name: name ?? state.user.name,
    );
    await setState(
      state.copyWith(
        usecase: runtimeType,
        garden: value,
      ),
    );
  }
}
