import 'package:flutter/material.dart';
import 'package:kindergarden/features/app/presentation/ui/styles.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(
            child: Text(
              'DASHBOARD SCREEN',
              style: MyTextStyles.largePrimaryBold,
            ),
          ),
        ],
      ),
    );
  }
}
