import 'package:get/get.dart';
import 'package:kindergarden/entities/user.dart';
import 'package:kindergarden/features/usecase.dart';
import 'package:kindergarden/features/state/usecases/set_state_usecase.dart';
import 'package:kindergarden/state/state.dart';
import 'package:kindergarden/state/user_state.dart';

class SetUserStateUsecase extends Usecase {
  SetUserStateUsecase(
    Rx<State> state,
    SetStateUsecase setStateUsecase,
  ) : super(state, setStateUsecase);

  call({
    String? email,
    String? name,
    UserRole? role,
    String? token,
  }) async {
    try {
      onStartUsecaseHandler(runtimeType);
      saveToState(email: email, name: name, role: role, token: token);
    } catch (e) {
      onErrorUsecaseHandler(e);
    } finally {
      onEndUsecaseHandler();
    }
  }

  saveToState({
    String? email,
    String? name,
    UserRole? role,
    String? token,
  }) async {
    final value = UserState(
      email: email ?? state.user.email,
      name: name ?? state.user.name,
      role: role ?? state.user.role,
      token: token ?? state.user.token,
    );
    await setState(
      state.copyWith(
        usecase: runtimeType,
        user: value,
      ),
    );
  }
}
