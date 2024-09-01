import 'package:ecommerceapplication/commons/styles/shadows.dart';
import 'package:ecommerceapplication/commons/widgets/banners/banner_image.dart';
import 'package:ecommerceapplication/commons/widgets/containers/custom_Container.dart';
import 'package:ecommerceapplication/commons/widgets/icon/CircularHeartIcon.dart';
import 'package:ecommerceapplication/commons/widgets/texts/brandTitleText_withVerifiedIcon.dart';
import 'package:ecommerceapplication/commons/widgets/texts/product_PriceText.dart';
import 'package:ecommerceapplication/commons/widgets/texts/product_datilText.dart';
import 'package:ecommerceapplication/utils/constants/colors.dart';
import 'package:ecommerceapplication/utils/constants/image_path.dart';
import 'package:ecommerceapplication/utils/constants/sizes.dart';
import 'package:ecommerceapplication/utils/helpers/helperFunction.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductHorizontalCart extends StatelessWidget {
  const ProductHorizontalCart({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = YHelperFunctions.isDarkMode(context);
    return Container(
      width: 313,
      decoration: BoxDecoration(
        boxShadow: [
          YShadowStyle.verticalProductShadow,
        ],
        borderRadius: BorderRadius.circular(YSizes.productImageRadius),
        color: isDark ? YColors.darkerGrey : YColors.softGrey,
      ),
      child: Row(
        children: [
          YCircularContainer(
            height: 110,
            padding: const EdgeInsets.all(YSizes.md),
            backgroundColor: isDark ? YColors.darkerGrey : YColors.softGrey,
            child: Stack(
              children: [
                YRoundedImageContainer(
                  imageUrl: YImagePath.nikeBoots,
                  backgroundColor: isDark ? YColors.darkerGrey : YColors.white,
                ),
                Positioned(
                  top: 2,
                  child: YCircularContainer(
                    radius: YSizes.sm,
                    backgroundColor: YColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: YSizes.sm, vertical: YSizes.xs),
                    child: Text(
                      "25%",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.apply(color: YColors.black),
                    ),
                  ),
                ),
                const Positioned(
                  right: 0,
                  top: 2,
                  child: YCircularIcon(
                    icon: Iconsax.heart5,
                    iconColor: Colors.red,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 156,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: YSizes.sm, left: YSizes.sm),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductDetailText(
                        title: "Orange Nike Sports Shoes",
                        smallSize: true,
                      ),
                      SizedBox(
                        height: YSizes.spaceBetween / 2,
                      ),
                      YBrandTitleWithVerifiedIcon(
                        title: "Nike",
                      )
                    ],
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const YProductPriceText(
                      price: "256.0",
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
          )
        ],
      ),
    );
  }
}
