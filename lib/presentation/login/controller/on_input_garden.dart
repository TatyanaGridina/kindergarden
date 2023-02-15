import 'package:kindergarden/presentation/app/utils/snackbar.dart';
import 'package:kindergarden/presentation/login/controller/login_controller.dart';

extension OnInputGarden on LoginController {
  onInputGarden() async {
    final valid = validateGarden(gardenTextController.text);
    if (valid.isErr) {
      showError(valid.toString());
      return;
    }

    final userEmail = emailTextController.text;
    const userName = "UNDEFINED";
    final gardenName = gardenTextController.text;
    final result = await usecases.signup(userEmail: userEmail, userName: userName, gardenName: gardenName);

    if (result.isOk) {
      loginStage.value = LoginStages.inputPassword;
    }
  }
}
