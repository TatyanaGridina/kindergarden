part of 'app_controller.dart';

class AppGetxController extends GetxController {

  final AppViewState state;
  final AppUsecases usecases;

  AppGetxController(
      this.state,
      this.usecases,
      );

  Worker? onChangeStateWorker;

  @override
  onReady() {
    onChangeStateWorker = ever(state.state, state.onChangeState);
    state.onChangeState(null);

    super.onReady();
  }

  @override
  onClose() {
    onChangeStateWorker?.dispose();
    super.onClose();
  }
}

