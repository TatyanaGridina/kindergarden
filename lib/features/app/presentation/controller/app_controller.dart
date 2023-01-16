import 'package:get/get.dart';
import 'package:kindergarden/features/app/presentation/actions/app_view_actions.dart';
import 'package:kindergarden/features/app/presentation/state/app_view_state.dart';
import 'package:kindergarden/features/router/presentation/ui/routes.dart';

part 'app_controller.m.dart';

class AppController extends AppGetxController {
  AppController(super.state, super.actions);

  @override
  onReady() {
    super.onReady();
    actions.getStateAction();
    actions.goOffAction(route: loginRoute);
  }
}
