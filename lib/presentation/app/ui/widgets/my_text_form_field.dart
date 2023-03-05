import 'package:flutter/material.dart';

import '../styles.dart';

class MyTextFormField extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final Icon prefixIcon;
  final String labelText;
  final bool readOnly;
  final int? maxLines;
  void Function()? onTap;

  MyTextFormField({super.key,required this.controller,
  required this.prefixIcon, required this.labelText, this.validator, this.readOnly = false, this.onTap, this.maxLines});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      style: MyTextStyles.largePrimary,
      controller: controller,
        readOnly: readOnly,
        onTap: onTap,
        maxLines: maxLines,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        prefixIcon: prefixIcon,
        labelText: labelText,
        contentPadding:
        const EdgeInsets.all(MyPaddings.small),
      ),
    );
  }

}
