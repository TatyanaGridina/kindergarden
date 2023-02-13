import 'package:get/get.dart';
import 'package:kindergarden/usecases/usecase.dart';
import 'package:kindergarden/usecases/state/set_state_usecase.dart';
import 'package:kindergarden/state/state.dart';

class LoginUsecase extends Usecase {
  LoginUsecase(
    Rx<State> state,
    SetStateUsecase setStateUsecase,
  ) : super(state, setStateUsecase);

  call({ required String email, required String password }) async {
    try {
      onStartUsecaseHandler(runtimeType);
    } catch (e) {
      onErrorUsecaseHandler(e);
    } finally {
      onEndUsecaseHandler();
    }
  }
}
