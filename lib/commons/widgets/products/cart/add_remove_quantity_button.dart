import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helperFunction.dart';
import '../../icon/CircularHeartIcon.dart';

class YProductQuantityWithAddAndRemove extends StatelessWidget {
  const YProductQuantityWithAddAndRemove({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = YHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        YCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: YSizes.md,
          iconColor: isDark ? YColors.white : YColors.black,
          backgroundColor: isDark ? YColors.darkerGrey : YColors.light,
        ),
        const SizedBox(
          width: YSizes.spaceBetween,
        ),
        Text(
          "2",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(
          width: YSizes.spaceBetween,
        ),
        const YCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: YSizes.md,
          iconColor: YColors.white,
          backgroundColor: YColors.primary,
        ),
      ],
    );
  }
}
