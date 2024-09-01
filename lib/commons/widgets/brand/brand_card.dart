import 'package:flutter/material.dart';

import '../../../utils/constants/enums.dart';
import '../../../utils/constants/sizes.dart';
import '../containers/custom_Container.dart';
import '../icon/Circular_BrandImage.dart';
import '../texts/brandTitleText_withVerifiedIcon.dart';

class YBrandCard extends StatelessWidget {
  const YBrandCard({
    super.key,
    this.showBorder = true,
    this.padding = const EdgeInsets.all(YSizes.sm),
    required this.imageUrl,
    required this.brandTitle,
    required this.brandProducts,
    this.brandTextSize = TextSizes.large,
    this.onTap,
  });

  final bool showBorder;
  final EdgeInsets padding;
  final String imageUrl, brandTitle, brandProducts;
  final TextSizes brandTextSize;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: YCircularContainer(
        padding: padding,
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            Flexible(
              child: YCircularImage(
                imageUrl: imageUrl,
              ),
            ),
            const SizedBox(
              height: YSizes.spaceBetween / 2,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  YBrandTitleWithVerifiedIcon(
                    title: brandTitle,
                    brandTextSize: brandTextSize,
                  ),
                  Text(
                    "$brandProducts Products",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
