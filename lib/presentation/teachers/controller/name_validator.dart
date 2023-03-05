import 'package:kindergarden/presentation/teachers/controller/teachers_controller.dart';

extension NameValidator on TeachersController {
  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Не залишайте поле пустим';
    }
    return null;
  }
}
