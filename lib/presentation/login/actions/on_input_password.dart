import 'package:kindergarden/presentation/app/utils/snackbar.dart';
import 'package:kindergarden/presentation/login/controller/login_controller.dart';
import 'package:kindergarden/presentation/router/ui/routes.dart';

extension OnInputPassword on LoginController {
  onInputPassword() {
    final validated = validatePassword(passwordTextController.text);
    if (!validated) {
      showError(validated);
    }

    usecases.goOff(route: chefboardRoute);
  }
}
