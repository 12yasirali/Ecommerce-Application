import 'package:ecommerceapplication/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerceapplication/features/authentication/controllers/network_Controller/network_controller.dart';
import 'package:ecommerceapplication/features/authentication/screens/forgetPassword_configuretaion/resetPassword_Screen.dart';
import 'package:ecommerceapplication/utils/constants/image_path.dart';
import 'package:ecommerceapplication/utils/popups/fullscreen_loader.dart';
import 'package:ecommerceapplication/utils/popups/loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  sendPasswordResetEmail() async {
    try {
      YFullScreenLoader.openLoadingDialog(
          "Processing Your Request..", YImagePath.loadingAnimationJson);
      final isConnected = await NetworkHelper.instance.isConnected();
      if (!isConnected) {
        YFullScreenLoader.stopLoader();
        return;
      }
      if (!forgetPasswordFormKey.currentState!.validate()) {
        YFullScreenLoader.stopLoader();
        return;
      }
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());
      YLoaders.successSnackBar(
          title: "Email sent",
          message: "Email link is sent to reset your Password");

      Get.to(() => Reset_Password(email: email.text.trim()));
    } catch (e) {
      YFullScreenLoader.stopLoader();
      YLoaders.errorSnackBar(title: "Oh No..", message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      YFullScreenLoader.openLoadingDialog(
          "Processing Your Request..", YImagePath.loadingAnimationJson);
      final isConnected = await NetworkHelper.instance.isConnected();
      if (!isConnected) {
        YFullScreenLoader.stopLoader();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email);
      YLoaders.successSnackBar(
          title: "Email sent",
          message: "Email link is sent to reset your Password");
    } catch (e) {
      YFullScreenLoader.stopLoader();
      YLoaders.errorSnackBar(title: "Oh No..", message: e.toString());
    }
  }
}
