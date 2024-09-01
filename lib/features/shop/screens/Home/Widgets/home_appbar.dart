import 'package:ecommerceapplication/commons/widgets/shimmers/shimmer_loader.dart';
import 'package:ecommerceapplication/features/authentication/controllers/userController/user_controller.dart';
import 'package:ecommerceapplication/features/shop/screens/cart/cart.dart';
import 'package:ecommerceapplication/utils/helpers/helperFunction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../commons/widgets/appbar/appBar.dart';
import '../../../../../commons/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_string.dart';

class YHomeAppBar extends StatelessWidget {
  const YHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    final isDark = YHelperFunctions.isDarkMode(context);
    return YAppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                YTextString.homeAppbarTitle,
                style: Theme.of(context).textTheme.labelMedium?.apply(
                    color: isDark
                        ? YColors.white.withOpacity(0.6)
                        : YColors.black.withOpacity(0.6)),
              ),
              Obx(
                () {
                  if (controller.profileLoading.value == true) {
                    return const YShimmerEffect(width: 80, height: 15);
                  } else {
                    return Text(
                      controller.user.value.firstName +
                          " " +
                          controller.user.value.lastName,
                      style: Theme.of(context).textTheme.headlineSmall?.apply(
                          color: isDark ? YColors.white : YColors.black),
                    );
                  }
                },
              ),
            ],
          ),
        ],
      ),
      actions: [
        YCartContainerIcon(
          onPressed: () {
            Get.to(() => const CartScreen());
          },
        )
      ],
    );
  }
}
