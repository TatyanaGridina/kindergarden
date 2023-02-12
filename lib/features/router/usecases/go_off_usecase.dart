import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:kindergarden/features/state/usecases/set_state_usecase.dart';
import 'package:kindergarden/features/usecase.dart';
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
