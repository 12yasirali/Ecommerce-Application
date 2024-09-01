import 'package:ecommerceapplication/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class YCircularContainer extends StatelessWidget {
  const YCircularContainer({
    super.key,
    this.width,
    this.height,
    this.radius = YSizes.cardRadiusLg,
    this.padding,
    this.child,
    this.backgroundColor = YColors.white,
    this.margin,
    this.showCircleColor = true,
    this.showBorder = false,
    this.borderColor = YColors.borderPrimary,
  });

  final double? width;
  final double? height;
  final double radius;
  final bool showBorder;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Widget? child;
  final Color? backgroundColor;
  final Color borderColor;
  final bool showCircleColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        border: showBorder ? Border.all(color: borderColor) : null,
        borderRadius: BorderRadius.circular(radius),
        color: showCircleColor ? backgroundColor : Colors.transparent,
      ),
      child: child,
    );
  }
}
