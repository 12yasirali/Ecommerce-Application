import 'package:ecommerceapplication/features/authentication/screens/login/login_Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  void updatePageIndicator(index) => currentPageIndex.value = index;

  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  void nextPage() {
    if (currentPageIndex.value == 2) {
      final storage = GetStorage();
      storage.write("IsFirstTime", false);
      Get.offAll(const Login_Page());
    } else {
      currentPageIndex.value += 1;
      pageController.animateToPage(
        currentPageIndex.value,
        duration:
            const Duration(milliseconds: 300), // Adjust duration as needed
        curve: Curves.ease, // Adjust curve as needed
      );
    }
  }

  void skipPage() {
    int page = currentPageIndex.value + 2;
    pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }
}
