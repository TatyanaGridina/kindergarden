import 'package:flutter/material.dart';

import '../styles.dart';

class MyTextField extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final Icon prefixIcon;
  final String hintText;

  const MyTextField({super.key,required this.controller,
  required this.prefixIcon, required this.hintText, this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      style: MyTextStyles.largePrimary,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        prefixIcon: prefixIcon,
        hintText: hintText,
        contentPadding:
        const EdgeInsets.symmetric(horizontal: MyPaddings.small),
      ),
    );
  }

}
