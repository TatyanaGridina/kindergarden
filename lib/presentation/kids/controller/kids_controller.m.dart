part of 'kids_controller.dart';

class KidsGetxController extends GetxController {
  final KidsViewState state;
  final KidsUsecases usecases;

  KidsGetxController(
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
