import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/device/device_utility.dart';
import '../../../utils/helpers/helperFunction.dart';

class YSearchBar extends StatelessWidget {
  const YSearchBar({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: YSizes.defaultSpace),
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final isDark = YHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: YDeviceUtility.getScreenWidth(context),
          padding: const EdgeInsets.all(YSizes.md),
          decoration: BoxDecoration(
            color: showBackground
                ? isDark
                    ? YColors.dark
                    : YColors.light
                : Colors.transparent,
            border: showBorder ? Border.all(color: YColors.grey) : null,
            borderRadius: BorderRadius.circular(YSizes.cardRadiusLg),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: YColors.darkGrey,
              ),
              const SizedBox(
                width: YSizes.spaceBetween,
              ),
              Text(
                text,
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
        ),
      ),
    );
  }
}
