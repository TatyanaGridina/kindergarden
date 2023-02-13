import 'package:kindergarden/presentation/app/utils/snackbar.dart';
import 'package:kindergarden/presentation/login/controller/login_controller.dart';

extension OnInputGarden on LoginController {
  onInputGarden() {
    final validated = validatePassword(gardenTextController.text);
    if (!validated) {
      showError(validated);
      return;
    }


    loginStage.value = LoginStages.inputPassword;
  }
}
