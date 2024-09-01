import 'package:ecommerceapplication/commons/widgets/texts/section_heading.dart';
import 'package:ecommerceapplication/features/shop/screens/product_details/widgets/bottom_Add_Cart.dart';
import 'package:ecommerceapplication/features/shop/screens/product_details/widgets/productShowCase_Slider.dart';
import 'package:ecommerceapplication/features/shop/screens/product_details/widgets/product_attribute.dart';
import 'package:ecommerceapplication/features/shop/screens/product_details/widgets/product_details_data.dart';
import 'package:ecommerceapplication/features/shop/screens/product_details/widgets/rating_And_Share.dart';
import 'package:ecommerceapplication/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:ecommerceapplication/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetail_Page extends StatelessWidget {
  const ProductDetail_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const YBottomAddCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const YImageShowCaseSlider(),
            Padding(
              padding: const EdgeInsets.only(
                right: YSizes.defaultSpace,
                left: YSizes.defaultSpace,
                bottom: YSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  const YRattingAndShare(),
                  const ProductDetailsData(),
                  const ProductAttribute(),
                  const SizedBox(
                    height: YSizes.spaceBetweenSections,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Checkout"),
                    ),
                  ),
                  const SizedBox(
                    height: YSizes.spaceBetweenSections,
                  ),
                  const YSectionHeading(
                    sectionTitle: "Description",
                    showButton: false,
                  ),
                  const SizedBox(height: YSizes.spaceBetween),
                  const ReadMoreText(
                    "Elevate your style with these Nike Shoes, offering premium comfort and timeless design. Perfect for any occasion, they're a must-have addition to your wardrobe. ",
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: "Show more",
                    trimExpandedText: "Show less",
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                  const Divider(),
                  const SizedBox(
                    height: YSizes.spaceBetween,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const YSectionHeading(
                        sectionTitle: "Reviews (199)",
                        showButton: false,
                      ),
                      IconButton(
                        onPressed: () {
                          Get.to(() => const ProductReviewsScreen());
                        },
                        icon: const Icon(
                          Iconsax.arrow_right_3,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: YSizes.spaceBetweenSections,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
