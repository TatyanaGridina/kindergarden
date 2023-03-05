import 'package:kindergarden/presentation/parents/controller/parents_controller.dart';

extension EmailValidator on ParentsController {
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Не залишайте поле пустим';
    }
    return null;
  }
}
