import 'package:ecommerceapplication/commons/widgets/appbar/appBar.dart';
import 'package:ecommerceapplication/commons/widgets/appbar/tabbar.dart';
import 'package:ecommerceapplication/commons/widgets/containers/search_container.dart';
import 'package:ecommerceapplication/commons/widgets/layouts/grid_layout.dart';
import 'package:ecommerceapplication/commons/widgets/products/cart/cart_menu_icon.dart';
import 'package:ecommerceapplication/commons/widgets/texts/section_heading.dart';
import 'package:ecommerceapplication/features/shop/screens/brands/all_brands.dart';
import 'package:ecommerceapplication/features/shop/screens/store/Widget/catagory_tab.dart';
import 'package:ecommerceapplication/utils/constants/colors.dart';
import 'package:ecommerceapplication/utils/constants/image_path.dart';
import 'package:ecommerceapplication/utils/constants/sizes.dart';
import 'package:ecommerceapplication/utils/helpers/helperFunction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../commons/widgets/brand/brand_card.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = YHelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: YAppBar(
          title: const Text("Store"),
          backgroundColor: isDark ? Colors.black : Colors.white,
          actions: [
            YCartContainerIcon(
              onPressed: () {},
            ),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: isDark ? Colors.black : Colors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(YSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: false,
                    children: [
                      const SizedBox(
                        height: YSizes.spaceBetween,
                      ),
                      const YSearchBar(
                        text: 'Search your Products',
                        showBorder: true,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(height: YSizes.spaceBetweenSections),
                      YSectionHeading(
                        sectionTitle: "Featured Brands",
                        textColor: isDark ? YColors.white : Colors.black,
                        onPressed: () {
                          Get.to(() => const AllBrandsScreen());
                        },
                      ),
                      const SizedBox(
                        height: YSizes.spaceBetween / 1.5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: YSizes.md),
                        child: YGrid_Layout(
                          itemCount: 8,
                          mainAxisExtent: 75,
                          itemBuilder: (_, index) {
                            return const YBrandCard(
                              imageUrl: YImagePath.cloths,
                              brandTitle: "Nike",
                              brandProducts: "100",
                              showBorder: false,
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
                bottom: const YTabBar(
                  tabs: [
                    Tab(
                      child: Text("Sports"),
                    ),
                    Tab(
                      child: Text("Furniture"),
                    ),
                    Tab(
                      child: Text("Electronics"),
                    ),
                    Tab(
                      child: Text("Clothes"),
                    ),
                    Tab(
                      child: Text("Cosmetics"),
                    ),
                  ],
                ),
              ),
            ];
          },
          body: const TabBarView(
            children: [
              YCategoryTabs(),
              YCategoryTabs(),
              YCategoryTabs(),
              YCategoryTabs(),
              YCategoryTabs(),
            ],
          ),
        ),
      ),
    );
  }
}
