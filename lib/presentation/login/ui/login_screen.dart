import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarden/presentation/app/ui/styles.dart';
import 'package:kindergarden/presentation/app/ui/widgets/my_button.dart';
import 'package:kindergarden/presentation/app/ui/widgets/my_text_form_field.dart';
import 'package:kindergarden/presentation/login/controller/on_change_stage_widget.dart';
import 'package:kindergarden/presentation/login/controller/on_change_user_role.dart';
import 'package:kindergarden/presentation/login/controller/on_input_email.dart';
import 'package:kindergarden/presentation/login/controller/on_input_garden.dart';
import 'package:kindergarden/presentation/login/controller/on_input_password.dart';
import '../controller/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('УВІЙТИ'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration:
              const BoxDecoration(color: MyColors.primaryColor),
        ),
      ),
      body: _BodyWidget(),
    );
  }
}

class _BodyWidget extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    final tabHeight = MediaQuery.of(context).size.width / 3 + 3;
    final bodyHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.all(MyPaddings.large),
      height: bodyHeight,
      child: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            DefaultTabController(
              length: 3,
              child: TabBar(
                onTap: controller.onChangeUserRole,
                tabs: [
                  Tab(
                    height: tabHeight,
                    icon: const Image(
                      image: AssetImage(
                          'lib/presentation/app/ui/assets/parent.png'),
                    ),
                    text: 'Батьки',
                  ),
                  Tab(
                    height: tabHeight,
                    icon: const Image(
                      image: AssetImage(
                          'lib/presentation/app/ui/assets/teacher.png'),
                    ),
                    text: 'Вихователь',
                  ),
                  Tab(
                    height: tabHeight,
                    icon: const Image(
                      image:
                          AssetImage('lib/presentation/app/ui/assets/chef.png'),
                    ),
                    text: 'Директор',
                  ),
                ],
              ),
            ),
            const SizedBox(child: StagesWidget()),
          ],
        ),
      ),
    );
  }
}

class EmailWidget extends GetView<LoginController> {
  const EmailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedOpacity(
        opacity: controller.loginStage.value == LoginStages.inputEmail ? 1 : 0,
        duration: const Duration(milliseconds: 500),
        onEnd: controller.onChangeStageWidget,
        child: Column(
          children: [
            MyTextFormField(
              controller: controller.emailTextController,
              prefixIcon:
                  const Icon(Icons.email_outlined, color: MyColors.accentColor),
              labelText: 'Ваш e-mail',
            ),
            const SizedBox(height: MyPaddings.medium),
            MyButton(
                text: 'ОТРИМАТИ ПАРОЛЬ', onPressed: controller.onInputEmail)
          ],
        ),
      ),
    );
  }
}

class PasswordWidget extends GetView<LoginController> {
  const PasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedOpacity(
        opacity:
            controller.loginStage.value == LoginStages.inputPassword ? 1 : 0,
        duration: const Duration(milliseconds: 500),
        onEnd: controller.onChangeStageWidget,
        child: Column(
          children: [
            MyTextFormField(
                controller: controller.passwordTextController,
                prefixIcon: const Icon(Icons.lock, color: MyColors.accentColor),
                labelText: 'Введіть пароль'),
            const SizedBox(height: MyPaddings.medium),
            MyButton(text: 'УВІЙТИ', onPressed: controller.onInputPassword)
          ],
        ),
      ),
    );
  }
}

class GardenWidget extends GetView<LoginController> {
  const GardenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedOpacity(
        opacity: controller.loginStage.value == LoginStages.inputGarden ? 1 : 0,
        duration: const Duration(milliseconds: 500),
        onEnd: controller.onChangeStageWidget,
        child: Column(
          children: [
            MyTextFormField(
                controller: controller.chefNameTextController,
                prefixIcon: const Icon(Icons.face, color: MyColors.accentColor),
                labelText: 'Введіть Ваші ПІБ'),
            const SizedBox(height: MyPaddings.medium),
            MyTextFormField(
                controller: controller.gardenTextController,
                prefixIcon: const Icon(Icons.house, color: MyColors.accentColor),
                labelText: 'Введіть назву садочку'),
            const SizedBox(height: MyPaddings.medium),
            MyButton(text: 'ЗАРЕЄСТРУВАТИ', onPressed: controller.onInputGarden)
          ],
        ),
      ),
    );
  }
}

class StagesWidget extends GetView<LoginController> {
  const StagesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: MyPaddings.xlarge),
      child: Obx(() {
        List<Widget> stack = [];
        const emailWidget = EmailWidget();
        const gardenWidget = GardenWidget();
        const passwordWidget = PasswordWidget();

        if (controller.loginStageStack.value == LoginStages.inputEmail) {
          stack = [passwordWidget, gardenWidget, emailWidget];
        } else if (controller.loginStageStack.value ==
            LoginStages.inputGarden) {
          stack = [passwordWidget, emailWidget, gardenWidget];
        } else if (controller.loginStageStack.value ==
            LoginStages.inputPassword) {
          stack = [emailWidget, gardenWidget, passwordWidget];
        }

        return Stack(children: stack);
      }),
    );
  }
}
