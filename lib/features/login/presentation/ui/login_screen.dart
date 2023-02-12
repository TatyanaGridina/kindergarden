import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarden/features/app/presentation/ui/%20widgets/my_text_field.dart';

import '../../../app/presentation/ui/ widgets/my_button.dart';
import '../../../app/presentation/ui/styles.dart';
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
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[
                  MyColors.backgroundAppBarStartColor,
                  MyColors.backgroundAppBarEndColor
                ]),
          ),
        ),
      ),
      body: _BodyWidget(),
    );
  }
}

class _BodyWidget extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    const appBarHeight = 80.0;
    const imageHeight = 300.0;
    final tabHeight = MediaQuery.of(context).size.width / 3;
    const stageHeight = 160.0;
    const bottomHeight = 120.0;
    final bodyHeight = max(MediaQuery.of(context).size.height - imageHeight - appBarHeight, tabHeight + stageHeight + bottomHeight + 5);
    return ListView(

      padding: const EdgeInsets.only(
          left: MyPaddings.large,
          right: MyPaddings.large,
          top: MyPaddings.large,
          bottom: MyPaddings.small),
        // itemExtent: itemHeight,
        children: [
          const SizedBox(
            height: imageHeight,
              child: MainImage()),
          SizedBox(
            height: bodyHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              'lib/features/app/presentation/ui/assets/parent.png'),
                        ),
                        text: 'Батьки',
                      ),
                      Tab(
                        height: tabHeight,
                        icon: const Image(
                          image: AssetImage(
                              'lib/features/app/presentation/ui/assets/teacher.png'),
                        ),
                        text: 'Вихователь',
                      ),
                      Tab(
                        height: tabHeight,
                        icon: const Image(
                          image: AssetImage(
                              'lib/features/app/presentation/ui/assets/chef.png'),
                        ),
                        text: 'Директор',
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                    height: stageHeight,
                    child: StagesWidget()),
                const SizedBox(height: bottomHeight),
              ],
            ),
          ),
        ],
    );
  }
}

class MainImage extends StatelessWidget {
  const MainImage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Image(
      image:
          AssetImage('lib/features/app/presentation/ui/assets/mainImage.png'),
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
        onEnd: controller.rebuildStack,
        child: Column(
          children: [
            MyTextField(
              controller: controller.emailTextController,
              prefixIcon:
                  const Icon(Icons.email_outlined, color: MyColors.iconColor),
              hintText: 'Ваш e-mail',
            ),
            const SizedBox(height: MyPaddings.medium),
            MyButton(
                text: 'ОТРИМАТИ ПАРОЛЬ',
                onPressed: controller.inputEmailButtonPressed)
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
        onEnd: controller.rebuildStack,
        child: Column(
          children: [
            MyTextField(
                controller: controller.passwordTextController,
                prefixIcon: const Icon(Icons.lock, color: MyColors.iconColor),
                hintText: 'Введіть пароль'),
            const SizedBox(height: MyPaddings.medium),
            MyButton(
                text: 'УВІЙТИ',
                onPressed: controller.inputPasswordButtonPressed)
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
        onEnd: controller.rebuildStack,
        child: Column(
          children: [
            MyTextField(
                controller: controller.gardenTextController,
                prefixIcon: const Icon(Icons.house, color: MyColors.iconColor),
                hintText: 'Введіть назву садочку'),
            const SizedBox(height: MyPaddings.medium),
            MyButton(
                text: 'ЗАРЕЄСТРУВАТИ',
                onPressed: controller.inputGardenButtonPressed)
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
        } else if (controller.loginStageStack.value == LoginStages.inputGarden) {
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
