import 'package:get/get.dart';
import 'package:kindergarden/features/usecase.dart';
import 'package:kindergarden/features/state/usecases/set_state_usecase.dart';
import 'package:kindergarden/state/state.dart';

class GoToUsecase extends Usecase {
  GoToUsecase(Rx<State> state, SetStateUsecase setStateUsecase) : super(state, setStateUsecase);

  void call({required GetPage route}) {
    try {
      onStartUsecaseHandler(runtimeType);
      Get.toNamed(route.name);
    } catch (e) {
      onErrorUsecaseHandler(e);
    } finally {
      onEndUsecaseHandler();
    }
  }
}
