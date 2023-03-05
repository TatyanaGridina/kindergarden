import 'package:kindergarden/presentation/app/utils/snackbar.dart';
import 'package:kindergarden/presentation/login/controller/login_controller.dart';

extension OnInputGarden on LoginController {
  onInputGarden() async {
    final validGarden = validateGarden(gardenTextController.text);
    final validChefName = validateChefName(chefNameTextController.text);

    if (validChefName.isErr) {
      showError(validChefName.toString());
      return;
    }

    if (validGarden.isErr) {
      showError(validGarden.toString());
      return;
    }

    final userEmail = emailTextController.text;
    final chefName = chefNameTextController.text;
    final gardenName = gardenTextController.text;
    final result = await usecases.signup(userEmail: userEmail, chefName: chefName, gardenName: gardenName);

    if (result.isOk) {
      loginStage.value = LoginStages.inputPassword;
    }
  }
}
