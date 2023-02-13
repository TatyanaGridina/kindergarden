import 'package:get/get.dart';
import 'package:kindergarden/usecases/usecase.dart';
import 'package:kindergarden/usecases/state/set_state_usecase.dart';
import 'package:kindergarden/state/state.dart';

class SendEmailUsecase extends Usecase {
  SendEmailUsecase(
    Rx<State> state,
    SetStateUsecase setStateUsecase,
  ) : super(state, setStateUsecase);

  call({ required String email }) async {
    try {
      onStartUsecaseHandler(runtimeType);
    } catch (e) {
      onErrorUsecaseHandler(e);
    } finally {
      onEndUsecaseHandler();
    }
  }
}
