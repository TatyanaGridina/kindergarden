import 'package:get/get.dart';
import 'package:kindergarden/usecases/usecase.dart';
import 'package:kindergarden/usecases/state/set_state_usecase.dart';
import 'package:kindergarden/state/state.dart';

class GoBackUsecase extends Usecase {
  GoBackUsecase(Rx<State> state, SetStateUsecase setStateUsecase) : super(state, setStateUsecase);

  void call() {
    try {
      onStartUsecaseHandler(runtimeType);
      Get.back();
    } catch (e) {
      onErrorUsecaseHandler(e);
    } finally {
      onEndUsecaseHandler();
    }
  }
}
