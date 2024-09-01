import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../../../utils/helpers/helperFunction.dart';
import '../../../controllers/controller_onboard/controller_onboarding.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final isDark = YHelperFunctions.isDarkMode(context);
    return Positioned(
        bottom: YDeviceUtility.getBottomNavigationBarHeight() + 25,
        left: YSizes.defaultSpace,
        child: SmoothPageIndicator(
          controller: controller.pageController,
          onDotClicked: (index) {
            controller.dotNavigationClick(index);
          },
          count: 3,
          effect: ExpandingDotsEffect(
              activeDotColor: isDark ? YColors.light : YColors.dark,
              dotHeight: 6),
        ));
  }
}
