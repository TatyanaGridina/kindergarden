import 'package:kindergarden/presentation/teachers/controller/teachers_controller.dart';

extension EmailValidator on TeachersController {
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Не залишайте поле пустим';
    }
    return null;
  }
}
