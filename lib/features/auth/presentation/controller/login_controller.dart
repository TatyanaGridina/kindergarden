import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kindergarden/features/auth/presentation/actions/login_view_actions.dart';
import 'package:kindergarden/features/auth/presentation/state/login_view_state.dart';

part 'login_controller.m.dart';

class LoginController extends LoginGetxController {
  LoginController(super.state, super.actions);

  final phoneTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  @override
  onReady() {
    super.onReady();
  }

  @override
  onClose() {
    phoneTextController.dispose();
    passwordTextController.dispose();
    super.onClose();
  }
}
