import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kindergarden/presentation/groups/state/groups_view_state.dart';
import 'package:kindergarden/presentation/groups/usecases/groups_usecases.dart';

part 'groups_controller.m.dart';

class GroupsController extends GroupsGetxController {
  GroupsController(super.state, super.usecases);

  final titleTextController = TextEditingController();

  @override
  onClose() {
    titleTextController.dispose();
    super.onClose();
  }
}
