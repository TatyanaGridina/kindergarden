import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarden/presentation/app/ui/styles.dart';
import 'package:kindergarden/presentation/parents/controller/go_to_new_parent.dart';
import 'package:kindergarden/presentation/parents/controller/parents_controller.dart';

import '../../app/ui/widgets/my_floating_action_button.dart';
import '../../router/ui/drawer.dart';

class ParentsScreen extends GetView<ParentsController> {
  const ParentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        title: const Text('БАТЬКИ'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration:
              const BoxDecoration(color: MyColors.primaryColor),
        ),
      ),
      floatingActionButton: MyFloatingActionButton(icon: Icons.add, onPressed: controller.goToNewParent),
      body: Container(),
    );
  }
}
