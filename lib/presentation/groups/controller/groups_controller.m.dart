part of 'groups_controller.dart';

class GroupsGetxController extends GetxController {
  final GroupsViewState state;
  final GroupsUsecases usecases;

  GroupsGetxController(
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
