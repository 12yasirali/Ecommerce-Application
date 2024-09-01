import 'package:ecommerceapplication/commons/widgets/layouts/grid_layout.dart';
import 'package:ecommerceapplication/commons/widgets/products/product_cards/product_cart_vertical.dart';
import 'package:ecommerceapplication/commons/widgets/texts/section_heading.dart';
import 'package:flutter/material.dart';

import '../../../../../commons/widgets/brand/brand_showCase.dart';
import '../../../../../utils/constants/image_path.dart';
import '../../../../../utils/constants/sizes.dart';

class YCategoryTabs extends StatelessWidget {
  const YCategoryTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(YSizes.defaultSpace),
          child: Column(
            children: [
              const YBrandShowCase(
                images: [
                  YImagePath.adiPant,
                  YImagePath.adiFootball,
                  YImagePath.adiPant2
                ],
              ),
              YSectionHeading(
                sectionTitle: "You might like",
                onPressed: () {},
              ),
              const SizedBox(
                height: YSizes.spaceBetween,
              ),
              YGrid_Layout(
                itemCount: 4,
                itemBuilder: (_, index) {
                  return const ProductVerticalCart();
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
