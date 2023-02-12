import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kindergarden/presentation/chefboard/state/chefboard_view_state.dart';
import 'package:kindergarden/presentation/chefboard/usecases/chefboard_usecases.dart';

part 'chefboard_controller.m.dart';

class ChefboardController extends ChefboardGetxController {
  ChefboardController(super.state, super.usecases);

  final titleTextController = TextEditingController();

  @override
  onClose() {
    titleTextController.dispose();
    super.onClose();
  }
}
