part of 'app_controller.dart';

class AppGetxController extends GetxController {

  final AppViewState state;
  final AppViewActions actions;

  AppGetxController(
      this.state,
      this.actions,
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

