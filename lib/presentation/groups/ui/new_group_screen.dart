import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:kindergarden/presentation/groups/controller/save_new_group.dart';
import '../../app/ui/styles.dart';
import '../../app/ui/widgets/my_floating_action_button.dart';
import '../../app/ui/widgets/my_text_form_field.dart';
import '../../router/ui/drawer.dart';
import '../controller/groups_controller.dart';

class NewGroupScreen extends GetView<GroupsController> {
  const NewGroupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ГРУПА'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(color: MyColors.primaryColor),
        ),
      ),
      floatingActionButton: MyFloatingActionButton(icon: Icons.done, onPressed: controller.saveNewGroup,),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(MyPaddings.large),
          padding: const EdgeInsets.all(MyPaddings.large),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: MyColors.backgroundSecondary,
          ),
        ),
      ),
    );
  }
}
