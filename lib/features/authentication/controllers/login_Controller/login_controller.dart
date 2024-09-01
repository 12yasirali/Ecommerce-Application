import 'package:ecommerceapplication/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerceapplication/features/authentication/controllers/network_Controller/network_controller.dart';
import 'package:ecommerceapplication/features/authentication/controllers/userController/user_controller.dart';
import 'package:ecommerceapplication/utils/constants/image_path.dart';
import 'package:ecommerceapplication/utils/popups/fullscreen_loader.dart';
import 'package:ecommerceapplication/utils/popups/loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();

  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    email.text = localStorage.read("Remember_Me_Email") ?? "";
    password.text = localStorage.read("Remember_Me_Password") ?? "";
    super.onInit();
  }

  Future<void> emailAndPasswordLogin() async {
    try {
      YFullScreenLoader.openLoadingDialog(
          "Logging you in...", YImagePath.loadingAnimationJson);

      final isConnected = await NetworkHelper.instance.isConnected();
      if (!isConnected) {
        YFullScreenLoader.stopLoader();
        return;
      }
      if (!loginFormKey.currentState!.validate()) {
        YFullScreenLoader.stopLoader();
        return;
      }

      if (rememberMe.value) {
        localStorage.write("Remember_Me_Email", email.text.trim());
        localStorage.write("Remember_Me_Password", password.text.trim());
      }

      await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      YFullScreenLoader.stopLoader();

      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      YFullScreenLoader.stopLoader();
      YLoaders.errorSnackBar(title: "Oh no..", message: e.toString());
    }
  }

  Future<void> googleSignIn() async {
    try {
      YFullScreenLoader.openLoadingDialog(
          "Logging in you..", YImagePath.loadingAnimationJson);

      final isConnected = await NetworkHelper.instance.isConnected();
      if (!isConnected) {
        YFullScreenLoader.stopLoader();
        return;
      }
      final userCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();
      await userController.saveUserRecord(userCredentials);

      YFullScreenLoader.stopLoader();

      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      YFullScreenLoader.stopLoader();
      YLoaders.errorSnackBar(title: "Oh no!", message: e.toString());
    }
  }
}
