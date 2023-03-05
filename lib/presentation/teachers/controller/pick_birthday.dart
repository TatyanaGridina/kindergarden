import 'package:flutter/material.dart';
import 'package:kindergarden/presentation/teachers/controller/teachers_controller.dart';

extension PickBirthday on TeachersController {
  pickBirthday(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        locale: const Locale('uk'),
        initialDate: DateTime.now(), //get today's date
        firstDate:DateTime(1974), //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2101),
    );

    birthday.value = pickedDate;
  }
}
