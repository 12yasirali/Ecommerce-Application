import 'package:ecommerceapplication/commons/widgets/appbar/appBar.dart';
import 'package:ecommerceapplication/commons/widgets/banners/banner_image.dart';
import 'package:ecommerceapplication/commons/widgets/products/product_cards/product_cart_horezontal.dart';
import 'package:ecommerceapplication/commons/widgets/texts/section_heading.dart';
import 'package:ecommerceapplication/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/image_path.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const YAppBar(
        title: Text("Sport Shirts"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            YSizes.defaultSpace / 1.5,
          ),
          child: Column(
            children: [
              const YRoundedImageContainer(
                width: double.infinity,
                imageUrl: YImagePath.shoesBanner,
                applyImageRadius: true,
              ),
              const SizedBox(
                height: YSizes.spaceBetweenSections,
              ),
              Column(
                children: [
                  YSectionHeading(
                    sectionTitle: "Sport Shirts",
                    showButton: true,
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: YSizes.spaceBetween / 2,
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => const SizedBox(
                        width: YSizes.spaceBetween,
                      ),
                      itemBuilder: (context, index) {
                        return const ProductHorizontalCart();
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
