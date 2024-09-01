import 'package:ecommerceapplication/commons/widgets/banners/banner_image.dart';
import 'package:ecommerceapplication/features/shop/screens/product_details/product_details.dart';
import 'package:ecommerceapplication/utils/constants/image_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helperFunction.dart';
import '../../../styles/shadows.dart';
import '../../containers/custom_Container.dart';
import '../../icon/CircularHeartIcon.dart';
import '../../texts/brandTitleText_withVerifiedIcon.dart';
import '../../texts/product_PriceText.dart';
import '../../texts/product_datilText.dart';

class ProductVerticalCart extends StatelessWidget {
  const ProductVerticalCart({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = YHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () {
        Get.to(() => const ProductDetail_Page());
      },
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [
            YShadowStyle.verticalProductShadow,
          ],
          borderRadius: BorderRadius.circular(
            YSizes.productImageRadius,
          ),
          color: isDark ? YColors.darkerGrey : YColors.grey.withOpacity(0.1),
        ),
        child: Column(
          children: [
            YCircularContainer(
              height: 150,
              padding: const EdgeInsets.all(YSizes.sm),
              backgroundColor:
                  isDark ? YColors.darkerGrey : YColors.white.withOpacity(0.1),
              child: Stack(
                children: [
                  SizedBox(
                    child: YRoundedImageContainer(
                      imageUrl: YImagePath.nikeBoots,
                      applyImageRadius: true,
                      height: 200,
                      backgroundColor: isDark
                          ? Colors.black
                          : YColors.white.withOpacity(0.1),
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    top: 6,
                    child: YCircularContainer(
                      radius: YSizes.sm,
                      backgroundColor: YColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: YSizes.sm,
                        vertical: YSizes.xs,
                      ),
                      child: Center(
                        child: Text(
                          "25%",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.apply(color: YColors.black),
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: YCircularIcon(
                      icon: Iconsax.heart5,
                      iconColor: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: YSizes.spaceBetween / 2,
            ),
            const Padding(
              padding: EdgeInsets.only(
                  left: YSizes.sm, bottom: YSizes.sm, right: YSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductDetailText(
                    title: "Orange Nike Shoes",
                    smallSize: true,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: YSizes.spaceBetween / 2,
                  ),
                  YBrandTitleWithVerifiedIcon(
                    title: "Nike",
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const YProductPriceText(
                  price: '35.53',
                ),
                Container(
                  decoration: BoxDecoration(
                    color: isDark ? YColors.white : YColors.black,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(YSizes.cardRadiusMd),
                        bottomRight:
                            Radius.circular(YSizes.productImageRadius)),
                  ),
                  child: SizedBox(
                    height: YSizes.IconLg * 1.2,
                    width: YSizes.IconLg * 1.2,
                    child: Icon(
                      Icons.add,
                      color: isDark ? Colors.black : YColors.white,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
