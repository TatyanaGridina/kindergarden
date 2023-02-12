import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarden/entities/user.dart';
import 'package:kindergarden/features/login/presentation/actions/login_view_actions.dart';
import 'package:kindergarden/features/login/presentation/state/login_view_state.dart';
import 'package:kindergarden/features/router/presentation/ui/routes.dart';

import '../../../app/presentation/ui/ widgets/snackbar.dart';

part 'login_controller.m.dart';

class LoginController extends LoginGetxController {
  LoginController(super.state, super.actions);

  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final gardenTextController = TextEditingController();

  final Rx<LoginStages> loginStage = LoginStages.inputEmail.obs;
  final Rx<LoginStages> loginStageStack = LoginStages.inputEmail.obs;
  final Rx<UserRole> userRole = UserRole.parent.obs;

  @override
  onClose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    gardenTextController.dispose();
    super.onClose();
  }

  inputEmailButtonPressed() {
    if (emailNotValid()) return;

    const response = 'not-registered';

    if (userRole.value == UserRole.chef && response == 'not-registered') {
      showError('E-MAIL НЕ ЗНАЙДЕНО. ЗАРЕЄСТРУЙТЕ ВАШ САДОЧОК.');

      loginStage.value = LoginStages.inputGarden;
    } else if (response == 'not-registered') {
      loginStage.value = LoginStages.inputPassword;
    }
  }

  emailNotValid() {
    final email = emailTextController.text;

    if (email.isEmpty) {
      showError('ВВЕДІТЬ E-MAIL.');
      return true;
    }
    if (!(email.contains('@') && email.contains('.'))) {
      showError('НЕ ВІРНИЙ ФОРМАТ E-MAIL.');
      return true;
    }
    return false;
  }

  inputGardenButtonPressed() {
    if (gardenNotValid()) return;

    loginStage.value = LoginStages.inputPassword;
  }

  gardenNotValid() {
    final gardenName = gardenTextController.text;

    if (gardenName.isEmpty) {
      showError('ВВЕДІТЬ НАЗВУ САДОЧКУ.');
      return true;
    }
    return false;
  }

  inputPasswordButtonPressed() {
    if (passwordNotValid()) return;

    actions.goOffAction(route: chefboardRoute);
  }

  passwordNotValid() {
    final password = passwordTextController.text;

    if (password.isEmpty) {
      showError('ВВЕДІТЬ ПАРОЛЬ.');
      return true;
    }

    if (password.length != 4 || !password.isNum) {
      showError('НЕ ВІРНИЙ ФОРМАТ. ПАРОЛЬ МІСТИТЬ 4 ЦИФРИ.');
      return true;
    }

    return false;
  }

  rebuildStack() {
    loginStageStack.value = loginStage.value;
  }

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

showError(String text) {
  if (Get.isSnackbarOpen) {
    Get.closeCurrentSnackbar();
  }
  Get.showSnackbar(ErrorSnackBar(message: text));
}

enum LoginStages { inputEmail, inputGarden, inputPassword }

