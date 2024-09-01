import 'package:ecommerceapplication/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerceapplication/data/repositories/user/user_model.dart';
import 'package:ecommerceapplication/data/repositories/user/user_repository.dart';
import 'package:ecommerceapplication/features/authentication/screens/signUp/verify_Email.dart';
import 'package:ecommerceapplication/utils/constants/image_path.dart';
import 'package:ecommerceapplication/utils/popups/fullscreen_loader.dart';
import 'package:ecommerceapplication/utils/popups/loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../network_Controller/network_controller.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //Variables
  final hidePassword = true.obs;
  final checkTermsAndCondition = false.obs;
  final email = TextEditingController();
  final userName = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  Future<void> signUp() async {
    try {
      // Start loader when the data is taking time to be store
      YFullScreenLoader.openLoadingDialog(
          "We are Processing your Information...",
          YImagePath.loadingAnimationJson);

      //Check if internet is connected
      final isConnected = await NetworkHelper.instance.isConnected();
      if (!isConnected) return;

      //Validation of the given data
      if (!signUpFormKey.currentState!.validate()) {
        YFullScreenLoader.stopLoader();
        return;
      }
      //Check that terms and conditions is checked
      if (!checkTermsAndCondition.value) {
        YFullScreenLoader.stopLoader();
        YLoaders.warningSnackBar(
            title: "Accept Privacy Policy",
            message:
                "In Order to create your account, you must have read Privacy Policy and Terms and Conditions");
        return;
      }
      //Calling that the user is to be registered
      final userCredentials = await AuthenticationRepository.instance
          .registerUsingEmailAndPassword(
              email.text.trim(), password.text.trim());

      final newUser = UserModel(
        id: userCredentials.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        userName: userName.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: " ",
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveRecords(newUser);

      YLoaders.successSnackBar(
          title: "Congratulations!",
          message:
              "Your account is successfully created. Verify your Email to continue.");

      Get.to(() => Verify_Email(email: email.text.trim()));
    } catch (e) {
      YFullScreenLoader.stopLoader();
      YLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }
}
