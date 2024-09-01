import 'package:ecommerceapplication/commons/widgets/appbar/appBar.dart';
import 'package:ecommerceapplication/features/shop/screens/cart/widgets/cart_item.dart';
import 'package:ecommerceapplication/features/shop/screens/checkout/checkout.dart';
import 'package:ecommerceapplication/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: YAppBar(
        title: Text(
          "Cart",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(
            YSizes.defaultSpace,
          ),
          child: YCartItemsList(),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: YSizes.spaceBetween, vertical: YSizes.spaceBetween / 2),
        child: SizedBox(
          height: 45,
          child: ElevatedButton(
            onPressed: () {
              Get.to(() => const CheckoutScreen());
            },
            child: const Text("Checkout \$256"),
          ),
        ),
      ),
    );
  }
}
