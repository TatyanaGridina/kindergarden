part of 'teachers_controller.dart';

class TeachersGetxController extends GetxController {
  final TeachersViewState state;
  final TeachersUsecases usecases;

  TeachersGetxController(
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
