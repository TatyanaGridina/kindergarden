import 'package:kindergarden/presentation/app/utils/snackbar.dart';
import 'package:kindergarden/presentation/login/controller/login_controller.dart';
import 'package:kindergarden/presentation/router/ui/routes.dart';

extension OnInputPassword on LoginController {
  onInputPassword() {
    final valid = validatePassword(passwordTextController.text);
    if (valid.isErr) {
      showError(valid.toString());
      return;
    }

    usecases.goOff(route: chefboardRoute);
  }
}
