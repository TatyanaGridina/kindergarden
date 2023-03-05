import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarden/presentation/app/ui/styles.dart';
import 'package:kindergarden/presentation/teachers/controller/go_to_new_teacher.dart';
import 'package:kindergarden/presentation/teachers/controller/teachers_controller.dart';

import '../../app/ui/widgets/my_floating_action_button.dart';
import '../../router/ui/drawer.dart';

class TeachersScreen extends GetView<TeachersController> {
  const TeachersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        title: const Text('ВИХОВАТЕЛІ'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(color: MyColors.primaryColor),
        ),
      ),
      floatingActionButton: MyFloatingActionButton(icon: Icons.add, onPressed: controller.goToNewTeacher),
      body: SingleChildScrollView(
        child: Container(),
      ),
    );
  }
}
