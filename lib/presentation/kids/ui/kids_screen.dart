import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarden/presentation/app/ui/styles.dart';
import 'package:kindergarden/presentation/kids/controller/go_to_new_kid.dart';
import 'package:kindergarden/presentation/kids/controller/kids_controller.dart';

import '../../app/ui/widgets/my_floating_action_button.dart';
import '../../router/ui/drawer.dart';

class KidsScreen extends GetView<KidsController> {
  const KidsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        title: const Text('ДІТИ'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration:
              const BoxDecoration(color: MyColors.primaryColor),
        ),
      ),
      floatingActionButton: MyFloatingActionButton(icon: Icons.add, onPressed: controller.goToNewKid),
      body: Container(),
    );
  }
}
