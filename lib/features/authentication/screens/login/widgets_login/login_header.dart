import 'package:flutter/material.dart';

import '../../../../../utils/constants/image_path.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_string.dart';
import '../../../../../utils/helpers/helperFunction.dart';

class YLoginHeader extends StatelessWidget {
  const YLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = YHelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 35.0),
          child: Image(
            height: 75,
            image: AssetImage(
              isDark ? YImagePath.whiteLogo : YImagePath.blackLogo,
            ),
          ),
        ),
        const SizedBox(
          height: YSizes.md,
        ),
        Text(
          YTextString.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: YSizes.sm,
        ),
        Text(
          YTextString.loginSubTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
