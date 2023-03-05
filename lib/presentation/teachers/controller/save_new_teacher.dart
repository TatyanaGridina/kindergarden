import 'package:kindergarden/presentation/teachers/controller/teachers_controller.dart';

extension SaveNewTeacher on TeachersController {
  saveNewTeacher() {
    usecases.goBack();
  }
}