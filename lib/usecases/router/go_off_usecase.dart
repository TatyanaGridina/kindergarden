import 'package:get/get.dart';
import 'package:kindergarden/usecases/state/set_state_usecase.dart';
import 'package:kindergarden/usecases/usecase.dart';
import 'package:kindergarden/state/state.dart';

class GoOffUsecase extends Usecase {
  GoOffUsecase(Rx<State> state, SetStateUsecase setStateUsecase) : super(state, setStateUsecase);

  void call({required GetPage route}) {
    try {
      onStartUsecaseHandler(runtimeType);
      Get.offNamed(route.name);
    } catch (e) {
      onErrorUsecaseHandler(e);
    } finally {
      onEndUsecaseHandler();
    }
  }
}
