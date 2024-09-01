import 'package:ecommerceapplication/utils/helpers/helperFunction.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class YCircularIcon extends StatelessWidget {
  const YCircularIcon({
    super.key,
    this.width,
    this.height,
    this.size = YSizes.lg,
    required this.icon,
    this.iconColor,
    this.onPressed,
    this.backgroundColor,
  });

  final double? width, height, size;
  final Color? backgroundColor;
  final IconData icon;
  final Color? iconColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final isDark = YHelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: backgroundColor ?? (isDark ? YColors.black : YColors.white)),
      child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: iconColor,
            size: size,
          )),
    );
  }
}
