import 'package:get/get.dart';
import 'package:kindergarden/features/usecase.dart';
import 'package:kindergarden/features/state/usecases/set_state_usecase.dart';
import 'package:kindergarden/state/state.dart';

class ImageUsecase extends Usecase {
  ImageUsecase(
    Rx<State> state,
    SetStateUsecase setStateUsecase,
  ) : super(state, setStateUsecase);

  call(String name, dynamic value) async {
    try {
      onStartUsecaseHandler(runtimeType);
    } catch (e) {
      onErrorUsecaseHandler(e);
    } finally {
      onEndUsecaseHandler();
    }
  }

  saveTitleToState(String value) async {
  }
}
