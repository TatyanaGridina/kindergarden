import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kindergarden/features/chefboard/presentation/actions/chefboard_view_actions.dart';
import 'package:kindergarden/features/chefboard/presentation/state/chefboard_view_state.dart';

part 'chefboard_controller.m.dart';

class ChefboardController extends ChefboardGetxController {
  ChefboardController(super.state, super.actions);

  final titleTextController = TextEditingController();

  @override
  onReady() {
    super.onReady();
  }

  @override
  onClose() {
    titleTextController.dispose();
    super.onClose();
  }
}
