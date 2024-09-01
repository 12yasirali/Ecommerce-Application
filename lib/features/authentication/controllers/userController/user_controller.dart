import 'package:ecommerceapplication/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerceapplication/data/repositories/user/user_repository.dart';
import 'package:ecommerceapplication/features/authentication/controllers/network_Controller/network_controller.dart';
import 'package:ecommerceapplication/features/authentication/screens/deleteUserAccount/reAuth_UserLogin_form.dart';
import 'package:ecommerceapplication/features/authentication/screens/login/login_Page.dart';
import 'package:ecommerceapplication/utils/constants/sizes.dart';
import 'package:ecommerceapplication/utils/popups/fullscreen_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../data/repositories/user/user_model.dart';
import '../../../../utils/constants/image_path.dart';
import '../../../../utils/popups/loader.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());
  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final hidePassword = true.obs;
  final isImageUploading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecords();
  }

  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      await fetchUserRecords();
      if (user.value.id.isNotEmpty) {
        if (userCredential != null) {
          final user = UserModel(
              id: userCredential.user!.uid,
              firstName: userCredential.user!.displayName!.split(" ")[0],
              lastName: userCredential.user!.displayName!.split(" ")[1],
              userName: userCredential.user!.displayName!,
              email: userCredential.user?.email ?? " ",
              phoneNumber: userCredential.user?.phoneNumber ?? " ",
              profilePicture: userCredential.user?.photoURL ?? " ");
          await userRepository.saveRecords(user);
        }
      }
    } catch (e) {
      YLoaders.warningSnackBar(
          title: "Data not saved",
          message:
              "Something went wrong while saving your information. You can re-save your data in your profile");
    }
  }

  Future<void> fetchUserRecords() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
      profileLoading.value = false;
    } catch (e) {
      print("you have no permission to get your name");
    } finally {
      profileLoading.value = false;
    }
  }

  void deleteUserAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: EdgeInsets.all(YSizes.md),
        title: "Delete Account",
        middleText:
            "Are you sure you want to delete your account permanently? This Action is not reversible and all of your data will be removed Permanently.",
        confirm: ElevatedButton(
          onPressed: () {
            deleteUserAccount();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            side: BorderSide(color: Colors.red),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: YSizes.lg),
            child: Text("Delete"),
          ),
        ),
        cancel: OutlinedButton(
            onPressed: () {
              Navigator.of(Get.overlayContext!).pop();
            },
            child: Text("Cancel")));
  }

  Future<void> deleteUserAccount() async {
    try {
      YFullScreenLoader.openLoadingDialog(
          "Processing...", YImagePath.loadingAnimationJson);

      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser?.providerData.map((e) => e.providerId).first;
      if (provider!.isNotEmpty) {
        if (provider == "google.com") {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          YFullScreenLoader.stopLoader();
          Get.offAll(() => Login_Page());
        } else if (provider == "password") {
          YFullScreenLoader.stopLoader();
          Get.to(() => ReAuthLoginForm());
        }
      }
    } catch (e) {
      YFullScreenLoader.stopLoader();
      YLoaders.warningSnackBar(title: "Oh no", message: e.toString());
    }
  }

  Future<void> reAuthenticateUserEmailAndPassword() async {
    try {
      YFullScreenLoader.openLoadingDialog(
          "Processing...", YImagePath.loadingAnimationJson);

      final isConnected = await NetworkHelper.instance.isConnected();

      if (!isConnected) {
        YFullScreenLoader.stopLoader();
        return;
      }

      if (!reAuthFormKey.currentState!.validate()) {
        YFullScreenLoader.stopLoader();
        return;
      }
      await AuthenticationRepository.instance
          .reAuthenticateUserWithEmailAndPassword(
              verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      YFullScreenLoader.stopLoader();
      Get.offAll(() => Login_Page());
    } catch (e) {
      YFullScreenLoader.stopLoader();
      YLoaders.warningSnackBar(title: "Oh no", message: e.toString());
    }
  }

  Future<void> uploadUserProFilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);
      if (image != null) {
        isImageUploading.value = true;
        final imageUrl =
            await userRepository.uploadImage("Users/Images/Profile/", image);

        Map<String, dynamic> json = {"ProfilePicture": imageUrl};
        await userRepository.updateSingleField(json);
        user.refresh();

        user.value.profilePicture = imageUrl;
        YLoaders.successSnackBar(
            title: "Congratulation!",
            message: "Your Profile Image has been changed");
      }
    } catch (e) {
      YLoaders.errorSnackBar(title: "Oh no!", message: e.toString());
    } finally {
      isImageUploading.value = false;
    }
  }
}
