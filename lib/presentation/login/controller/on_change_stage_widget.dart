import 'package:kindergarden/presentation/login/controller/login_controller.dart';

extension OnChangeStageWidget on LoginController {
  onChangeStageWidget() {
    loginStageStack.value = loginStage.value;
  }
}
