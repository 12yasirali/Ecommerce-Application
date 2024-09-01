import 'package:ecommerceapplication/utils/constants/colors.dart';
import 'package:ecommerceapplication/utils/helpers/helperFunction.dart';
import 'package:flutter/material.dart';

class ProductDetailText extends StatelessWidget {
  const ProductDetailText({
    super.key,
    required this.title,
    this.smallSize = false,
    this.maxLines = 2,
    this.textAlign,
  });

  final String title;
  final bool smallSize;
  final int maxLines;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    final isDark = YHelperFunctions.isDarkMode(context);
    return Text(
      title,
      style: smallSize
          ? Theme.of(context)
              .textTheme
              .labelLarge
              ?.apply(color: isDark ? YColors.white : YColors.black)
          : Theme.of(context)
              .textTheme
              .titleSmall
              ?.apply(color: isDark ? YColors.white : YColors.black),
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
