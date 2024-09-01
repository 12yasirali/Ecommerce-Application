import 'package:ecommerceapplication/commons/widgets/icon/CircularHeartIcon.dart';
import 'package:ecommerceapplication/utils/constants/colors.dart';
import 'package:ecommerceapplication/utils/constants/sizes.dart';
import 'package:ecommerceapplication/utils/helpers/helperFunction.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class YBottomAddCart extends StatelessWidget {
  const YBottomAddCart({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = YHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: YSizes.defaultSpace, vertical: YSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: isDark ? YColors.darkerGrey.withOpacity(0.6) : YColors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(YSizes.cardRadiusLg),
          topRight: Radius.circular(
            YSizes.cardRadiusLg,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              YCircularIcon(
                icon: Iconsax.minus,
                size: YSizes.md,
                backgroundColor: YColors.darkerGrey.withOpacity(0.8),
                width: 40,
                height: 40,
                iconColor: YColors.white,
              ),
              const SizedBox(
                width: YSizes.spaceBetween,
              ),
              Text(
                "2",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.apply(color: isDark ? YColors.white : YColors.black),
              ),
              const SizedBox(
                width: YSizes.spaceBetween,
              ),
              const YCircularIcon(
                icon: Iconsax.add,
                size: YSizes.md,
                backgroundColor: YColors.black,
                width: 40,
                height: 40,
                iconColor: YColors.white,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(YSizes.md),
              side: BorderSide.none,
              backgroundColor: YColors.black,
            ),
            child: const Text("Add to Cart"),
          ),
        ],
      ),
    );
  }
}
