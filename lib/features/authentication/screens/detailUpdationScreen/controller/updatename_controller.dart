import 'package:ecommerceapplication/data/repositories/user/user_repository.dart';
import 'package:ecommerceapplication/features/authentication/controllers/network_Controller/network_controller.dart';
import 'package:ecommerceapplication/features/authentication/controllers/userController/user_controller.dart';
import 'package:ecommerceapplication/features/personalization/screens/profile/profile.dart';
import 'package:ecommerceapplication/utils/constants/image_path.dart';
import 'package:ecommerceapplication/utils/popups/fullscreen_loader.dart';
import 'package:ecommerceapplication/utils/popups/loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserNames() async {
    try {
      YFullScreenLoader.openLoadingDialog(
          "Please Wait, We are updating your Informations..",
          YImagePath.loadingAnimationJson);

      final isConnected = await NetworkHelper.instance.isConnected();
      if (!isConnected) {
        YFullScreenLoader.stopLoader();
        return;
      }
      if (!updateUserNameKey.currentState!.validate()) {
        YFullScreenLoader.stopLoader();
      }

      Map<String, dynamic> name = {
        "FirstName": firstName.text.trim(),
        "LastName": lastName.text.trim()
      };
      await userRepository.updateSingleField(name);

      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      YFullScreenLoader.stopLoader();

      YLoaders.successSnackBar(
          title: "Congratulations!", message: "Your name has been updated!");

      Get.off(() => ProfilePage());
    } catch (e) {
      YFullScreenLoader.stopLoader();
      YLoaders.errorSnackBar(title: "Oh no!", message: e.toString());
    }
  }
}
