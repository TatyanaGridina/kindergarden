import '../../router/ui/routes.dart';
import 'groups_controller.dart';

extension GoToNewGroup on GroupsController {
  goToNewGroup() {
    usecases.goTo(route: newGroupScreen);
  }
}