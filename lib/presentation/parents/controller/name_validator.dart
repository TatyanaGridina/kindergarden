import 'package:kindergarden/presentation/parents/controller/parents_controller.dart';

extension NameValidator on ParentsController {
  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Не залишайте поле пустим';
    }
    return null;
  }
}
