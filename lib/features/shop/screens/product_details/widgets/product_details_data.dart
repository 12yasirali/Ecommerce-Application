import 'package:ecommerceapplication/commons/widgets/containers/custom_Container.dart';
import 'package:ecommerceapplication/commons/widgets/icon/Circular_BrandImage.dart';
import 'package:ecommerceapplication/commons/widgets/texts/brandTitleText_withVerifiedIcon.dart';
import 'package:ecommerceapplication/commons/widgets/texts/product_PriceText.dart';
import 'package:ecommerceapplication/commons/widgets/texts/product_datilText.dart';
import 'package:ecommerceapplication/utils/constants/image_path.dart';
import 'package:ecommerceapplication/utils/constants/sizes.dart';
import 'package:ecommerceapplication/utils/helpers/helperFunction.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/enums.dart';

class ProductDetailsData extends StatelessWidget {
  const ProductDetailsData({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = YHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            YCircularContainer(
              radius: YSizes.sm,
              backgroundColor: YColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: YSizes.sm, vertical: YSizes.xs),
              child: Text(
                "25%",
                style: Theme.of(context).textTheme.labelLarge?.apply(
                      color: YColors.black,
                    ),
              ),
            ),
            const SizedBox(
              width: YSizes.spaceBetween,
            ),
            Text(
              "\$250",
              style: Theme.of(context).textTheme.titleSmall?.apply(
                  color: isDark ? YColors.white : YColors.black,
                  decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(
              width: YSizes.spaceBetween,
            ),
            const YProductPriceText(price: "175"),
          ],
        ),
        const SizedBox(
          height: YSizes.spaceBetween / 1.5,
        ),
        const ProductDetailText(title: "Orange Nice Sports Shoes"),
        const SizedBox(
          height: YSizes.spaceBetween / 1.5,
        ),
        Row(
          children: [
            const ProductDetailText(title: "Status"),
            const SizedBox(
              width: YSizes.spaceBetween,
            ),
            Text(
              "In Stock",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(
          height: YSizes.spaceBetween / 1.5,
        ),
        const Row(
          children: [
            YCircularImage(
              width: 32,
              height: 32,
              imageUrl: YImagePath.cosmetics,
            ),
            YBrandTitleWithVerifiedIcon(
              title: "Nike",
              brandTextSize: TextSizes.medium,
            ),
          ],
        )
      ],
    );
  }
}
