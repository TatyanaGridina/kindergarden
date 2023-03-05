import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarden/presentation/app/ui/styles.dart';
import 'package:kindergarden/presentation/reports/controller/reports_controller.dart';

import '../../router/ui/drawer.dart';

class ReportsScreen extends GetView<ReportsController> {
  const ReportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        title: Obx(() => Text(controller.state.gardenName.toUpperCase())),
        centerTitle: true,
        flexibleSpace: Container(
          decoration:
              const BoxDecoration(color: MyColors.primaryColor),
        ),
      ),
      body: Container(),
    );
  }
}
