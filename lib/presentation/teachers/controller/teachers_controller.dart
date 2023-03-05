import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kindergarden/presentation/teachers/state/teachers_view_state.dart';
import 'package:kindergarden/presentation/teachers/usecases/teachers_usecases.dart';

part 'teachers_controller.m.dart';

class TeachersController extends TeachersGetxController {
  TeachersController(super.state, super.usecases);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final nameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final numberTextController = TextEditingController();
  final dateController = TextEditingController();
  final noteController = TextEditingController();

  Worker? birthdayWorker;

  final Rx<DateTime?> birthday = Rx<DateTime?>(null);

  @override
  onReady() {
    super.onReady();

    birthdayWorker = ever(birthday, (DateTime? value) {
      String formattedDate = value == null ? '' : DateFormat('dd MMMM yyyy', 'uk').format(value!);
      dateController.text = formattedDate;
    });
  }

  @override
  onClose() {
    nameTextController.dispose();
    emailTextController.dispose();
    numberTextController.dispose();
    dateController.dispose();
    birthdayWorker?.dispose();
    noteController.dispose();
    super.onClose();
  }
}
