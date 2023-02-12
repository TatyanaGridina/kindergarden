import 'package:kindergarden/presentation/app/utils/snackbar.dart';
import 'package:kindergarden/presentation/login/controller/login_controller.dart';

extension OnInputEmail on LoginController {
  onInputEmail() {
    final validated = validateEmail(emailTextController.text);
    if (!validated) {
      showError(validated);
    }

    loginStage.value = LoginStages.inputPassword;
  }
}
