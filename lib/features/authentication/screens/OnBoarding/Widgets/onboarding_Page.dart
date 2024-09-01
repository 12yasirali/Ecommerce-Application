import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helperFunction.dart';

class OnBoardingPage extends StatelessWidget {
  final String onBoardingPageImagePath;
  final String onBoardingPageTitle;
  final String onBoardingPageSubtitle;
  const OnBoardingPage({
    super.key,
    required this.onBoardingPageImagePath,
    required this.onBoardingPageTitle,
    required this.onBoardingPageSubtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(YSizes.defaultSpace),
      child: Column(
        children: [
          Image(
              width: YHelperFunctions.screenWidth() * 0.8,
              height: YHelperFunctions.screenHeight() * 0.6,
              image: AssetImage(onBoardingPageImagePath)),
          Text(
            onBoardingPageTitle,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: YSizes.spaceBetween,
          ),
          Text(
            onBoardingPageSubtitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
