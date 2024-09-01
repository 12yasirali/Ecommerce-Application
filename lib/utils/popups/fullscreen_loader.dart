import 'package:ecommerceapplication/utils/constants/colors.dart';
import 'package:ecommerceapplication/utils/helpers/helperFunction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commons/widgets/loaders/animation_loader.dart';

class YFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: YHelperFunctions.isDarkMode(Get.context!)
              ? YColors.dark
              : YColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(
                height: 250,
              ),
              YAnimationLoaderWidget(
                text: text,
                animation: animation,
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Stop Loader

  static stopLoader() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
