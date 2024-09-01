import 'package:ecommerceapplication/utils/constants/colors.dart';
import 'package:ecommerceapplication/utils/helpers/helperFunction.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax/iconsax.dart';

class YLoaders {
  static successSnackBar({required title, message = " "}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: YHelperFunctions.isDarkMode(Get.context!)
          ? YColors.dark
          : YColors.white,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: YColors.primary,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon: const Icon(
        Iconsax.check,
        color: YColors.white,
      ),
    );
  }

  static warningSnackBar({required title, message = ""}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: YHelperFunctions.isDarkMode(Get.context!)
          ? YColors.dark
          : YColors.white,
      backgroundColor: Colors.orange,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon: const Icon(
        Iconsax.warning_2,
        color: YColors.white,
      ),
    );
  }

  static errorSnackBar({required title, message = ""}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: YHelperFunctions.isDarkMode(Get.context!)
          ? YColors.dark
          : YColors.white,
      backgroundColor: Colors.red.shade600,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon: const Icon(
        Iconsax.warning_2,
        color: YColors.white,
      ),
    );
  }
}
