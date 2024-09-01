import 'dart:async';

import 'package:ecommerceapplication/commons/success_Screen/success_ScreenPage.dart';
import 'package:ecommerceapplication/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerceapplication/utils/constants/image_path.dart';
import 'package:ecommerceapplication/utils/constants/text_string.dart';
import 'package:ecommerceapplication/utils/popups/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class Verify_Email_Controller extends GetxController {
  static Verify_Email_Controller get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      YLoaders.successSnackBar(
          title: "Email Sent",
          message: "Please check your inbox and verify your email.");
    } catch (e) {
      YLoaders.errorSnackBar(title: "Oh Noo!", message: e.toString());
    }
  }

  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(
          () => Success_Screen(
            image: YImagePath.successFull,
            title: YTextString.accountCreatedTitle,
            subTitle: YTextString.accountCreatedSubTitle,
            onPressed: () {
              AuthenticationRepository.instance.screenRedirect();
            },
          ),
        );
      }
    });
  }

  checkEmailVerificationStatus() {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(
        () => Success_Screen(
          image: YImagePath.success,
          title: YTextString.accountCreatedTitle,
          subTitle: YTextString.accountCreatedSubTitle,
          onPressed: () {
            AuthenticationRepository.instance.screenRedirect();
          },
        ),
      );
    }
  }
}
