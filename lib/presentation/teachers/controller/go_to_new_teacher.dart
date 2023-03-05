import 'package:kindergarden/presentation/router/ui/routes.dart';
import 'package:kindergarden/presentation/teachers/controller/teachers_controller.dart';

extension GoToNewTeacher on TeachersController {
  goToNewTeacher() {
    usecases.goTo(route: newTeacherRoute);
  }
}
