import 'package:ecommerceapplication/commons/widgets/containers/custom_Container.dart';
import 'package:ecommerceapplication/utils/constants/colors.dart';
import 'package:ecommerceapplication/utils/constants/sizes.dart';
import 'package:ecommerceapplication/utils/helpers/helperFunction.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class YOrderListItems extends StatelessWidget {
  const YOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = YHelperFunctions.isDarkMode(context);
    return ListView.separated(
        itemCount: 10,
        separatorBuilder: (_, __) => const SizedBox(
              height: YSizes.spaceBetween,
            ),
        itemBuilder: (_, index) {
          return YCircularContainer(
            showBorder: true,
            padding: const EdgeInsets.all(YSizes.md),
            backgroundColor: isDark ? YColors.black : YColors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    const Icon(Iconsax.ship),
                    const SizedBox(
                      width: YSizes.spaceBetween / 2,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Processing",
                            style: Theme.of(context).textTheme.bodyLarge?.apply(
                                color: YColors.primary, fontWeightDelta: 1),
                          ),
                          Text(
                            "07 Nov, 2022",
                            style: Theme.of(context).textTheme.headlineSmall,
                          )
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Iconsax.arrow_right_3,
                        size: YSizes.IconSm,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          const Icon(Iconsax.tag),
                          const SizedBox(
                            width: YSizes.spaceBetween / 2,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Order",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium),
                                Text(
                                  "[#256f2]",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          const Icon(Iconsax.calendar),
                          const SizedBox(
                            width: YSizes.spaceBetween / 2,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Shipping Date",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium),
                                Text(
                                  "08 Feb, 2023",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
