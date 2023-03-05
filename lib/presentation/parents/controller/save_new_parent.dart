import 'package:kindergarden/presentation/parents/controller/parents_controller.dart';

extension SaveNewParent on ParentsController {
  saveNewParent() {
    usecases.goBack();
  }
}