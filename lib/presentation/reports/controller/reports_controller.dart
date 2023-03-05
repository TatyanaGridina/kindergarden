import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kindergarden/presentation/reports/state/reports_view_state.dart';
import 'package:kindergarden/presentation/reports/usecases/reports_usecases.dart';

part 'reports_controller.m.dart';

class ReportsController extends ReportsGetxController {
  ReportsController(super.state, super.usecases);

  final titleTextController = TextEditingController();

  @override
  onClose() {
    titleTextController.dispose();
    super.onClose();
  }
}
