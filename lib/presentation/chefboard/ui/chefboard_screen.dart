import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarden/presentation/app/ui/styles.dart';
import 'package:kindergarden/presentation/chefboard/controller/chefboard_controller.dart';

class ChefboardScreen extends GetView<ChefboardController> {
  const ChefboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.state.gardenName)),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(
            child: Text(
              'CHEFBOARD SCREEN',
              style: MyTextStyles.largePrimaryBold,
            ),
          ),
        ],
      ),
    );
  }
}
