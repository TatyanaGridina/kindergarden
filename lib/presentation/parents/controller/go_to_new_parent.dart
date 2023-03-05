import 'package:kindergarden/presentation/parents/controller/parents_controller.dart';
import 'package:kindergarden/presentation/router/ui/routes.dart';

extension GoToNewParent on ParentsController{
  goToNewParent() {
    usecases.goTo(route: newParentRoute);
  }
}