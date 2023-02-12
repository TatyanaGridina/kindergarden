import 'package:flutter/material.dart';
import 'package:kindergarden/presentation/app/ui/styles.dart';

class ChefboardScreen extends StatelessWidget {
  const ChefboardScreen({Key? key}) : super(key: key);

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
