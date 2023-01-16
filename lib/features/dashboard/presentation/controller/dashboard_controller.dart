import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kindergarden/features/dashboard/presentation/actions/dashboard_view_actions.dart';
import 'package:kindergarden/features/dashboard/presentation/state/dashboard_view_state.dart';

part 'dashboard_controller.m.dart';

class DashboardController extends DashboardGetxController {
  DashboardController(super.state, super.actions);

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
