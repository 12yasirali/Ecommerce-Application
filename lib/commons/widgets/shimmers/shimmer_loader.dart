import 'package:ecommerceapplication/utils/constants/colors.dart';
import 'package:ecommerceapplication/utils/helpers/helperFunction.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class YShimmerEffect extends StatelessWidget {
  const YShimmerEffect(
      {super.key,
      required this.width,
      required this.height,
      this.color,
      this.radius = 15});

  final double width;
  final double height;
  final Color? color;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final isDark = YHelperFunctions.isDarkMode(context);
    return Shimmer.fromColors(
        baseColor: isDark ? Colors.grey[850]! : Colors.grey[500]!,
        highlightColor: isDark ? Colors.grey[700]! : Colors.grey[100]!,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: color ?? (isDark ? YColors.darkerGrey : YColors.white),
              borderRadius: BorderRadius.circular(radius)),
        ));
  }
}
