import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarden/entities/user.dart';
import 'package:kindergarden/presentation/login/state/login_view_state.dart';
import 'package:kindergarden/presentation/login/usecases/login_usecases.dart';

part 'login_controller.m.dart';

class LoginController extends LoginGetxController {
  LoginController(super.state, super.uscases);

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

  validateEmail(String text) {
    if (text.isEmpty) {
      return 'ВВЕДІТЬ E-MAIL.';
    }
    if (!(text.contains('@') && text.contains('.'))) {
      return 'НЕ ВІРНИЙ ФОРМАТ E-MAIL.';
    }
    return true;
  }

  validateGarden(String text) {
    if (text.isEmpty) {
      return 'ВВЕДІТЬ НАЗВУ САДОЧКУ.';
    }
    return true;
  }

  validatePassword(String text) {
    if (text.isEmpty) {
      return 'ВВЕДІТЬ ПАРОЛЬ.';
    }

    if (text.length != 4 || !text.isNum) {
      return 'НЕ ВІРНИЙ ФОРМАТ. ПАРОЛЬ МІСТИТЬ 4 ЦИФРИ.';
    }

    return true;
  }
}

enum LoginStages { inputEmail, inputGarden, inputPassword }

