import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../../../utils/helpers/helperFunction.dart';
import '../../../controllers/controller_onboard/controller_onboarding.dart';

class Onboarding_NavigationButton extends StatelessWidget {
  const Onboarding_NavigationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = YHelperFunctions.isDarkMode(context);

    return Positioned(
        bottom: YDeviceUtility.getBottomNavigationBarHeight(),
        right: YSizes.defaultSpace,
        child: ElevatedButton(
            onPressed: () => OnBoardingController.instance.nextPage(),
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(56.0, 56.0),
                elevation: 10,
                side: BorderSide.none,
                shape: const CircleBorder(),
                backgroundColor: isDark ? YColors.white : YColors.black),
            child: Icon(
              Iconsax.arrow_right_3,
              color: isDark ? YColors.black : YColors.white,
            )));
  }
}
