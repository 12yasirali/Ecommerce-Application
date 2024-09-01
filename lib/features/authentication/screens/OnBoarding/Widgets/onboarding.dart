import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/image_path.dart';
import '../../../../../utils/constants/text_string.dart';
import '../../../controllers/controller_onboard/controller_onboarding.dart';
import 'onboarding_NavigationButton.dart';
import 'onboarding_Page.dart';
import 'onboarding_Skip.dart';
import 'onboarding_dotNavigation.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: (index) {
              controller.updatePageIndicator(index);
            },
            children: const [
              OnBoardingPage(
                onBoardingPageImagePath: YImagePath.onBoardingImage1,
                onBoardingPageTitle: YTextString.onBoardingTitle1,
                onBoardingPageSubtitle: YTextString.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                  onBoardingPageImagePath: YImagePath.onBoardingImage2,
                  onBoardingPageTitle: YTextString.onBoardingTitle2,
                  onBoardingPageSubtitle: YTextString.onBoardingSubTitle2),
              OnBoardingPage(
                  onBoardingPageImagePath: YImagePath.onBoardingImage3,
                  onBoardingPageTitle: YTextString.onBoardingTitle3,
                  onBoardingPageSubtitle: YTextString.onBoardingSubTitle3)
            ],
          ),
          const OnboardingSkip(),
          const OnBoardingDotNavigation(),
          const Onboarding_NavigationButton()
        ],
      ),
    );
  }
}
