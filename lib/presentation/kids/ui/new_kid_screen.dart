import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarden/presentation/app/ui/styles.dart';
import 'package:kindergarden/presentation/kids/controller/name_validator.dart';
import 'package:kindergarden/presentation/kids/controller/pick_birthday.dart';
import 'package:kindergarden/presentation/kids/controller/save_new_kid.dart';

import '../../app/ui/widgets/my_floating_action_button.dart';
import '../../app/ui/widgets/my_text_form_field.dart';
import '../controller/kids_controller.dart';

class NewKidScreen extends GetView<KidsController> {
  const NewKidScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ДИТИНА'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(color: MyColors.primaryColor),
        ),
      ),
      floatingActionButton: MyFloatingActionButton(icon: Icons.done, onPressed: controller.saveNewKid),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(MyPaddings.large),
          padding: const EdgeInsets.all(MyPaddings.large),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: MyColors.backgroundSecondary,
          ),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                MyTextFormField(
                  prefixIcon:
                      const Icon(Icons.face, color: MyColors.accentColor),
                  labelText: 'Імʼя',
                  controller: controller.nameTextController,
                  validator: controller.validateName,
                ),
                const SizedBox(height: MyPaddings.medium),
                MyTextFormField(
                    prefixIcon: const Icon(Icons.calendar_today,
                        color: MyColors.accentColor),
                    labelText: "День народження",
                    controller: controller.dateController,
                    readOnly: true,
                    // when true user cannot edit text
                    onTap: () => controller.pickBirthday(context)),
                const SizedBox(height: MyPaddings.medium),
                MyTextFormField(
                    controller: controller.noteController,
                    prefixIcon: const Icon(Icons.speaker_notes,
                        color: MyColors.accentColor),
                    labelText: "Нотатки",
                    maxLines: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
