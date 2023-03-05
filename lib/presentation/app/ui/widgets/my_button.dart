import 'package:flutter/material.dart';
import '../styles.dart';

class MyButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const MyButton({required this.text, this.onPressed, super.key});

@override
Widget build(BuildContext context) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.accentColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)),
          padding: const EdgeInsets.symmetric(
              vertical: MyPaddings.medium)),
      child: Text(text,
          style: MyTextStyles.largeSecondary),
    ),
  );
}
}