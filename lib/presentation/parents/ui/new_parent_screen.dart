import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarden/presentation/app/ui/styles.dart';
import 'package:kindergarden/presentation/parents/controller/name_validator.dart';
import 'package:kindergarden/presentation/parents/controller/save_new_parent.dart';

import '../../app/ui/widgets/my_floating_action_button.dart';
import '../../app/ui/widgets/my_text_form_field.dart';
import '../controller/parents_controller.dart';

class NewParentScreen extends GetView<ParentsController> {
  const NewParentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('БАТЬКИ'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(color: MyColors.primaryColor),
        ),
      ),
      floatingActionButton: MyFloatingActionButton(icon: Icons.done, onPressed: controller.saveNewParent),
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
                  labelText: 'ПІБ',
                  controller: controller.nameTextController,
                  validator: controller.validateName,
                ),
                const SizedBox(height: MyPaddings.medium),
                MyTextFormField(
                  prefixIcon: const Icon(Icons.email_outlined,
                      color: MyColors.accentColor),
                  labelText: 'E-mail',
                  controller: controller.emailTextController,
                  validator: controller.validateName,
                ),
                const SizedBox(height: MyPaddings.medium),
                MyTextFormField(
                  prefixIcon: const Icon(Icons.phone_iphone,
                      color: MyColors.accentColor),
                  labelText: 'Контактний номер',
                  controller: controller.numberTextController,
                ),
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
