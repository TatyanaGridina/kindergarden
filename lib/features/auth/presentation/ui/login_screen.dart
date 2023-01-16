import 'package:flutter/material.dart';
import 'package:kindergarden/features/app/presentation/ui/styles.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(
            child: Text(
              'LOGIN SCREEN',
              style: MyTextStyles.largePrimaryBold,
            ),
          ),
        ],
      ),
    );
  }
}
