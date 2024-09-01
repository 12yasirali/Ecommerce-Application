import 'package:ecommerceapplication/commons/widgets/containers/custom_Container.dart';
import 'package:ecommerceapplication/commons/widgets/texts/product_PriceText.dart';
import 'package:ecommerceapplication/commons/widgets/texts/product_datilText.dart';
import 'package:ecommerceapplication/commons/widgets/texts/section_heading.dart';
import 'package:ecommerceapplication/utils/constants/colors.dart';
import 'package:ecommerceapplication/utils/constants/sizes.dart';
import 'package:ecommerceapplication/utils/helpers/helperFunction.dart';
import 'package:flutter/material.dart';

import '../../../../../commons/widgets/choiceChip/ProductChoice_Chip.dart';

class ProductAttribute extends StatelessWidget {
  const ProductAttribute({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = YHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        YCircularContainer(
          padding: const EdgeInsets.all(YSizes.md),
          backgroundColor: isDark ? YColors.darkerGrey : YColors.grey,
          child: Column(
            children: [
              Row(
                children: [
                  const YSectionHeading(
                    sectionTitle: "Variation",
                    showButton: false,
                  ),
                  const SizedBox(
                    width: YSizes.spaceBetween,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const ProductDetailText(
                            title: "Price",
                            smallSize: true,
                          ),
                          const SizedBox(
                            width: YSizes.spaceBetween / 2,
                          ),
                          Text(
                            "\$25",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.apply(
                                  color: isDark ? YColors.white : YColors.black,
                                  decoration: TextDecoration.lineThrough,
                                ),
                          ),
                          const YProductPriceText(price: "20")
                        ],
                      ),
                      Row(
                        children: [
                          const ProductDetailText(
                            title: "Status",
                            smallSize: true,
                          ),
                          const SizedBox(
                            width: YSizes.spaceBetween,
                          ),
                          Text(
                            "In Stock",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              const ProductDetailText(
                title:
                    "This is the Discription of the Product and it can go upto max 4 lines",
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: YSizes.spaceBetween,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const YSectionHeading(
              sectionTitle: "Colors",
              showButton: false,
            ),
            const SizedBox(
              height: YSizes.spaceBetween / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                YChoiceChip(
                  text: "Green",
                  isSelected: true,
                  onSelected: (value) {},
                ),
                YChoiceChip(
                  text: "Red",
                  isSelected: false,
                  onSelected: (value) {},
                ),
                YChoiceChip(
                  text: "Blue",
                  isSelected: false,
                  onSelected: (value) {},
                ),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const YSectionHeading(
              sectionTitle: "Sizes",
              showButton: false,
            ),
            const SizedBox(
              height: YSizes.spaceBetween / 2,
            ),
            Wrap(
              spacing: 8,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: [
                YChoiceChip(
                  text: "EU 34",
                  isSelected: true,
                  onSelected: (value) {},
                ),
                YChoiceChip(
                  text: "EU 36",
                  isSelected: false,
                  onSelected: (value) {},
                ),
                YChoiceChip(
                  text: "EU 38",
                  isSelected: false,
                  onSelected: (value) {},
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
