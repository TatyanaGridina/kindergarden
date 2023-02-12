import 'package:get/get.dart';
import 'package:kindergarden/entities/user.dart';
import 'package:kindergarden/features/usecase.dart';
import 'package:kindergarden/features/state/usecases/set_state_usecase.dart';
import 'package:kindergarden/state/state.dart';

class LoginUsecase extends Usecase {
  LoginUsecase(
    Rx<State> state,
    SetStateUsecase setStateUsecase,
  ) : super(state, setStateUsecase);

  call(User value) async {
    try {
      onStartUsecaseHandler(runtimeType);
      saveUserToState(value);
    } catch (e) {
      onErrorUsecaseHandler(e);
    } finally {
      onEndUsecaseHandler();
    }
  }

  saveUserToState(User value) async {
    if (state.user == value) return;

    await setState(
      state.copyWith(
        usecase: runtimeType,
        user: state.user.copyWith(email: value.email, name: value.name, role: value.role, token: value.token),
      ),
    );
  }
}
