import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kindergarden/presentation/kids/state/kids_view_state.dart';
import 'package:kindergarden/presentation/kids/usecases/kids_usecases.dart';

part 'kids_controller.m.dart';

class KidsController extends KidsGetxController {
  KidsController(super.state, super.usecases);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final nameTextController = TextEditingController();
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
    noteController.dispose();
    dateController.dispose();
    birthdayWorker?.dispose();
    super.onClose();
  }
}
