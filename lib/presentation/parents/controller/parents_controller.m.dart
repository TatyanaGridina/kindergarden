part of 'parents_controller.dart';

class ParentsGetxController extends GetxController {
  final ParentsViewState state;
  final ParentsUsecases usecases;

  ParentsGetxController(
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
