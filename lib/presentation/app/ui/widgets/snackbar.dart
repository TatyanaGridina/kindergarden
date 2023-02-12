import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:kindergarden/presentation/app/ui/styles.dart';

class ErrorSnackBar extends GetSnackBar {
  ErrorSnackBar({super.key, required String message})
      : super(
          messageText: Text(message, style: MyTextStyles.mediumPrimaryBold.copyWith(color: MyColors.errorSnackBarColor),),
          icon: const Icon(Icons.cancel, color: MyColors.errorSnackBarColor, size: 36),
          duration: const Duration(seconds: 10),
          backgroundColor: MyColors.backgroundPrimary,
          snackPosition: SnackPosition.TOP,
        );
}

class MessageSnackBar extends GetSnackBar {
   MessageSnackBar({super.key, required String message})
      : super(
  messageText: Text(message, style: MyTextStyles.mediumPrimaryBold.copyWith(color: MyColors.messageSnackBarColor),),
  icon: const Icon(Icons.info, color: MyColors.messageSnackBarColor, size: 36),
  duration: const Duration(seconds: 10),
  backgroundColor: MyColors.backgroundPrimary,
  snackPosition: SnackPosition.TOP,
  );
}
