import 'package:ecommerceapplication/utils/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/enums.dart';
import '../../../utils/constants/sizes.dart';
import 'brand_titleText.dart';

class YBrandTitleWithVerifiedIcon extends StatelessWidget {
  const YBrandTitleWithVerifiedIcon({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textColor,
    this.iconColor = YColors.primary,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        YBrandTitleText(
          title: title,
          maxLines: maxLines,
          color: textColor,
          textAlign: textAlign,
          brandTextSize: brandTextSize,
        ),
        const SizedBox(
          width: YSizes.xs,
        ),
        Icon(
          Icons.verified,
          color: iconColor,
          size: YSizes.md,
        ),
      ],
    );
  }
}
