import 'package:ecommerceapplication/commons/widgets/products/product_cards/product_cart_vertical.dart';
import 'package:ecommerceapplication/features/shop/screens/all_Products/all_products.dart';
import 'package:ecommerceapplication/utils/constants/image_path.dart';
import 'package:ecommerceapplication/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../commons/widgets/containers/primary_HeaderContainer.dart';
import '../../../../commons/widgets/containers/search_container.dart';
import '../../../../commons/widgets/layouts/grid_layout.dart';
import '../../../../commons/widgets/texts/section_heading.dart';
import 'Widgets/banner_slider.dart';
import 'Widgets/home_appbar.dart';
import 'Widgets/home_categories.dart';

class Home_Page extends StatelessWidget {
  const Home_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const YPrimaryHeaderContainer(
              childHomeWidgets: Column(
                children: [
                  YHomeAppBar(),
                  SizedBox(
                    height: YSizes.spaceBetween / 2,
                  ),
                  YSearchBar(
                    text: 'Search in Shop',
                  ),
                  SizedBox(
                    height: YSizes.spaceBetween / 2,
                  ),
                  Padding(
                    padding: EdgeInsets.all(YSizes.defaultSpace),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        YSectionHeading(
                          sectionTitle: 'Popular Categories',
                          showButton: false,
                        ),
                        SizedBox(
                          height: YSizes.spaceBetween,
                        ),
                        YHomeCategories(),
                        SizedBox(
                          height: YSizes.spaceBetween,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(YSizes.defaultSpace),
              child: Column(
                children: [
                  const YBannerSlider(
                    banner: [
                      YImagePath.cosmeticBanner,
                      YImagePath.headPhoneBanner,
                      YImagePath.lipStickBanner,
                      YImagePath.shoesBanner,
                      YImagePath.menDressBanner
                    ],
                  ),
                  const SizedBox(
                    height: YSizes.spaceBetweenSections,
                  ),
                  YSectionHeading(
                    sectionTitle: "Popular Products",
                    onPressed: () {
                      Get.to(() => const AllProducts());
                    },
                  ),
                  const SizedBox(
                    height: YSizes.spaceBetweenSections,
                  ),
                  YGrid_Layout(
                    itemCount: 6,
                    itemBuilder: (_, index) {
                      return const ProductVerticalCart();
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
