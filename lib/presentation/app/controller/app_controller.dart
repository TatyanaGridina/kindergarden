import 'package:get/get.dart';
import 'package:kindergarden/presentation/app/state/app_view_state.dart';
import 'package:kindergarden/presentation/app/usecases/app_usecases.dart';
import 'package:kindergarden/presentation/router/ui/routes.dart';

part 'app_controller.m.dart';

class AppController extends AppGetxController {
  AppController(super.state, super.usecases);

  @override
  onReady() {
    super.onReady();
    usecases.getState();
    usecases.goOff(route: loginRoute);
  }
}
