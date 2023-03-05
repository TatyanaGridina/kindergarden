import 'kids_controller.dart';

extension NameValidator on KidsController {
  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Не залишайте поле пустим';
    }
    return null;
  }
}
