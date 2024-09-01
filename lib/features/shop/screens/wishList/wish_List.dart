import 'package:ecommerceapplication/commons/widgets/appbar/appBar.dart';
import 'package:ecommerceapplication/commons/widgets/icon/CircularHeartIcon.dart';
import 'package:ecommerceapplication/commons/widgets/layouts/grid_layout.dart';
import 'package:ecommerceapplication/commons/widgets/products/product_cards/product_cart_vertical.dart';
import 'package:ecommerceapplication/home_menu.dart';
import 'package:ecommerceapplication/utils/constants/colors.dart';
import 'package:ecommerceapplication/utils/constants/sizes.dart';
import 'package:ecommerceapplication/utils/helpers/helperFunction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FavoriteItem_Page extends StatelessWidget {
  const FavoriteItem_Page({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    final isDark = YHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: YAppBar(
        title: Text(
          "Wishlist",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: [
          YCircularIcon(
            icon: Iconsax.add,
            iconColor: isDark ? YColors.white : YColors.black,
            onPressed: () {
              controller.selectedIndex.value = 0;
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(YSizes.defaultSpace),
          child: Column(
            children: [
              YGrid_Layout(
                itemCount: 4,
                itemBuilder: (_, index) {
                  return const ProductVerticalCart();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
