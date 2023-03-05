import 'package:flutter/material.dart';

import '../styles.dart';

class MyFloatingActionButton extends StatelessWidget {

  final IconData icon;
  final Function() onPressed;
  const MyFloatingActionButton({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 2.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
        color: MyColors.primaryColor,
        shape: BoxShape.circle,
      ),
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: Colors.transparent,
        elevation: 0,
        hoverColor: MyColors.accentColor,
        child: Icon(
          icon,
          color: MyColors.textSecondary,
        ),
      ),
    );
  }
}