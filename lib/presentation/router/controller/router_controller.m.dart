part of 'router_controller.dart';

class RouterGetxController extends GetxController {

  final RouterViewState state;
  final RouterUsecases usecases;

  RouterGetxController(
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

