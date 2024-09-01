import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helperFunction.dart';

class YCategories extends StatelessWidget {
  const YCategories({
    super.key,
    required this.image,
    required this.imageTitle,
    this.backgroundColor = YColors.white,
    this.onTap,
  });

  final String image, imageTitle;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = YHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(YSizes.spaceBetween / 2),
        child: Column(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color:
                    backgroundColor ?? (isDark ? YColors.black : YColors.white),
                borderRadius: BorderRadius.circular(56.0),
              ),
              child: Center(
                child: Image(
                  width: 40,
                  height: 40,
                  image: AssetImage(
                    image,
                  ),
                  fit: BoxFit.cover,
                  color: isDark ? YColors.white : YColors.black,
                ),
              ),
            ),
            const SizedBox(
              height: YSizes.spaceBetween / 2,
            ),
            SizedBox(
              width: 55,
              child: Center(
                child: Text(
                  imageTitle,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.apply(color: isDark ? YColors.white : YColors.black),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
