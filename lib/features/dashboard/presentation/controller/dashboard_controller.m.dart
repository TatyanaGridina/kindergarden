part of 'dashboard_controller.dart';

class DashboardGetxController extends GetxController {
  final DashboardViewState state;
  final DashboardViewActions actions;

  DashboardGetxController(
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
