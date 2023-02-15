import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarden/entities/result.dart';
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

  Result<bool> validateEmail(String text) {
    if (text.isEmpty) {
      return Err.message('ВВЕДІТЬ E-MAIL.');
    }
    if (!(text.contains('@') && text.contains('.'))) {
      return Err.message('НЕ ВІРНИЙ ФОРМАТ E-MAIL.');
    }
    return const Ok(true);
  }

  Result<bool> validateGarden(String text) {
    if (text.isEmpty) {
      return Err.message('ВВЕДІТЬ НАЗВУ САДОЧКУ.');
    }
    return const Ok(true);
  }

  Result<bool> validatePassword(String text) {
    if (text.isEmpty) {
      return Err.message('ВВЕДІТЬ ПАРОЛЬ.');
    }

    if (text.length != 4 || !text.isNum) {
      return Err.message('НЕ ВІРНИЙ ФОРМАТ. ПАРОЛЬ МІСТИТЬ 4 ЦИФРИ.');
    }
    return const Ok(true);
  }
}

enum LoginStages { inputEmail, inputGarden, inputPassword }

