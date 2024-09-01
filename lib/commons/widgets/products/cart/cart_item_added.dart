import 'package:flutter/material.dart';

import '../../../../utils/constants/image_path.dart';
import '../../../../utils/constants/sizes.dart';
import '../../icon/Circular_BrandImage.dart';
import '../../texts/brandTitleText_withVerifiedIcon.dart';
import '../../texts/product_datilText.dart';

class YCartItemAdded extends StatelessWidget {
  const YCartItemAdded({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const YCircularImage(
          fit: BoxFit.contain,
          width: 60,
          height: 60,
          padding: EdgeInsets.all(YSizes.sm),
          showImageColor: true,
          imageUrl: YImagePath.nikeBoots,
        ),
        const SizedBox(
          height: YSizes.spaceBetween,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const YBrandTitleWithVerifiedIcon(title: "Nike"),
              const Flexible(
                child: ProductDetailText(
                  title: "Orange Sports Shoes",
                  maxLines: 1,
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Color ",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: "Green ",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TextSpan(
                      text: "Size ",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: "EU-34",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
