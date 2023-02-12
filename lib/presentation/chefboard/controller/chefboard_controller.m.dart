part of 'chefboard_controller.dart';

class ChefboardGetxController extends GetxController {
  final ChefboardViewState state;
  final ChefboardUsecases usecases;

  ChefboardGetxController(
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
