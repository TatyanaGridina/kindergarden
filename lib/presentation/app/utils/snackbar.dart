import 'package:get/get.dart';
import 'package:kindergarden/presentation/app/ui/widgets/snackbar.dart';

showError(String text) {
  if (Get.isSnackbarOpen) {
    Get.closeCurrentSnackbar();
  }
  Get.showSnackbar(ErrorSnackBar(message: text));
}

showMessage(String text) {
  if (Get.isSnackbarOpen) {
    Get.closeCurrentSnackbar();
  }
  Get.showSnackbar(MessageSnackBar(message: text));
}

