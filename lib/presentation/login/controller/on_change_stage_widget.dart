import 'package:kindergarden/presentation/app/utils/snackbar.dart';
import 'package:kindergarden/presentation/login/controller/login_controller.dart';
import 'package:kindergarden/presentation/router/ui/routes.dart';

extension OnChangeStageWidget on LoginController {
  onChangeStageWidget() {
    loginStageStack.value = loginStage.value;
  }
}
