import 'package:kindergarden/entities/user.dart';
import 'package:kindergarden/presentation/app/utils/snackbar.dart';
import 'package:kindergarden/presentation/login/controller/login_controller.dart';
import 'package:kindergarden/presentation/router/ui/routes.dart';

extension OnChangeUserRole on LoginController {
  onChangeUserRole(int index) {
    loginStage.value = LoginStages.inputEmail;
    loginStageStack.value = LoginStages.inputEmail;

    if (index == 0) {
      userRole.value = UserRole.parent;
    } else if (index == 1) {
      userRole.value = UserRole.teacher;
    } else if (index == 2) {
      userRole.value = UserRole.chef;
    } else {
      throw Exception('User role not found for index $index');
    }
  }
}
