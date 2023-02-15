import 'package:get/get.dart';
import 'package:kindergarden/entities/result.dart';
import 'package:kindergarden/entities/user.dart';
import 'package:kindergarden/usecases/usecase.dart';
import 'package:kindergarden/usecases/state/set_state_usecase.dart';
import 'package:kindergarden/state/state.dart';

class SignupUsecase extends Usecase {
  SignupUsecase(
    Rx<State> state,
    SetStateUsecase setStateUsecase,
  ) : super(state, setStateUsecase);

  Future<Result<bool>> call({
    required String userName,
    required String userEmail,
    required String gardenName,
  }) async {
    try {
      onStartUsecaseHandler(runtimeType);
      setState.user(usecase: runtimeType, name: userName, email: userEmail, role: UserRole.chef, token: "12345");
      setState.garden(usecase: runtimeType, name: gardenName);
    } catch (e) {
      return Err(onErrorUsecaseHandler(e));
    } finally {
      onEndUsecaseHandler();
    }

    return const Ok(true);
  }
}
