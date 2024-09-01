import 'package:ecommerceapplication/commons/success_Screen/success_ScreenPage.dart';
import 'package:ecommerceapplication/commons/widgets/appbar/appBar.dart';
import 'package:ecommerceapplication/commons/widgets/containers/custom_Container.dart';
import 'package:ecommerceapplication/features/shop/screens/cart/widgets/cart_item.dart';
import 'package:ecommerceapplication/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:ecommerceapplication/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:ecommerceapplication/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:ecommerceapplication/home_menu.dart';
import 'package:ecommerceapplication/utils/constants/colors.dart';
import 'package:ecommerceapplication/utils/constants/image_path.dart';
import 'package:ecommerceapplication/utils/constants/sizes.dart';
import 'package:ecommerceapplication/utils/helpers/helperFunction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../commons/widgets/products/cart/coupon_widget.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = YHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: YAppBar(
        showBackArrow: true,
        title: Text(
          "Order Review",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(YSizes.defaultSpace),
          child: Column(
            children: [
              const YCartItemsList(
                showAddRemoveButton: false,
              ),
              const SizedBox(
                height: YSizes.spaceBetweenSections,
              ),
              const YCouponCode(),
              const SizedBox(
                height: YSizes.spaceBetweenSections,
              ),
              YCircularContainer(
                showBorder: false,
                padding: const EdgeInsets.all(YSizes.spaceBetween / 2),
                backgroundColor: isDark ? YColors.black : YColors.white,
                child: const Column(
                  children: [
                    YBillingAmountSection(),
                    SizedBox(
                      height: YSizes.spaceBetween,
                    ),
                    Divider(),
                    SizedBox(
                      height: YSizes.spaceBetween,
                    ),
                    YBillingPaymentSection(),
                    SizedBox(
                      height: YSizes.spaceBetween,
                    ),
                    YBillingAddressSection(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: YSizes.spaceBetween, vertical: YSizes.spaceBetween / 2),
        child: SizedBox(
          height: 45,
          child: ElevatedButton(
            onPressed: () {
              Get.to(() => Success_Screen(
                  image: YImagePath.successFull,
                  title: "Payment success!",
                  subTitle: 'Your Items will be shipped soon!',
                  onPressed: () {
                    Get.offAll(() => const Home_Menu());
                  }));
            },
            child: const Text("Checkout \$256"),
          ),
        ),
      ),
    );
  }
}
