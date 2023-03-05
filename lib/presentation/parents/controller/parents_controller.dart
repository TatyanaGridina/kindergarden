import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kindergarden/presentation/parents/state/parents_view_state.dart';
import 'package:kindergarden/presentation/parents/usecases/parents_usecases.dart';

part 'parents_controller.m.dart';

class ParentsController extends ParentsGetxController {
  ParentsController(super.state, super.usecases);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final nameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final numberTextController = TextEditingController();
  final noteController = TextEditingController();

  @override
  onClose() {
    nameTextController.dispose();
    emailTextController.dispose();
    numberTextController.dispose();
    noteController.dispose();
    super.onClose();
  }
}
