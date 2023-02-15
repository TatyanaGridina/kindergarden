import 'package:kindergarden/entities/user.dart';
import 'package:kindergarden/presentation/app/utils/snackbar.dart';
import 'package:kindergarden/presentation/login/controller/login_controller.dart';

extension OnInputEmail on LoginController {
  onInputEmail() {
    final valid = validateEmail(emailTextController.text);
    if (valid.isErr) {
      showError(valid.toString());
      return;
    }

    const response = 'not-registered';

    if (userRole.value == UserRole.chef && response == 'not-registered') {
      showError('E-MAIL НЕ ЗНАЙДЕНО. ЗАРЕЄСТРУЙТЕ ВАШ САДОЧОК.');

      loginStage.value = LoginStages.inputGarden;
    } else if (response == 'not-registered') {
      loginStage.value = LoginStages.inputPassword;
    }
  }
}
