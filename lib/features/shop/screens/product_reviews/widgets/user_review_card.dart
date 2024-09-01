import 'package:ecommerceapplication/commons/widgets/containers/custom_Container.dart';
import 'package:ecommerceapplication/commons/widgets/products/ratings/rating-bar_indicator.dart';
import 'package:ecommerceapplication/utils/constants/colors.dart';
import 'package:ecommerceapplication/utils/constants/image_path.dart';
import 'package:ecommerceapplication/utils/constants/sizes.dart';
import 'package:ecommerceapplication/utils/helpers/helperFunction.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = YHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: YColors.grey,
                  backgroundImage: AssetImage(YImagePath.ratingUser1),
                ),
                const SizedBox(
                  width: YSizes.spaceBetween,
                ),
                Text(
                  "John Kumar",
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: YSizes.spaceBetween,
        ),
        Row(
          children: [
            const YRatingBarIndicator(rating: 4),
            const SizedBox(
              width: YSizes.spaceBetween,
            ),
            Text(
              "01 Nov, 2023",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(
          height: YSizes.spaceBetween,
        ),
        const ReadMoreText(
          "The user interface of the app is quit intutive, I was able to navigate and make purchases seamlessly, Great job! ",
          trimLines: 1,
          trimExpandedText: "Show less",
          trimCollapsedText: "Show more",
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: YColors.primary),
          lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: YColors.primary),
          trimMode: TrimMode.Line,
        ),
        const SizedBox(
          height: YSizes.spaceBetween,
        ),
        YCircularContainer(
          backgroundColor: isDark ? YColors.darkerGrey : YColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(
              YSizes.md,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Y's Store",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      "1 Dec, 2023",
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ],
                ),
                const SizedBox(
                  height: YSizes.spaceBetween,
                ),
                const ReadMoreText(
                  "The user interface of the app is quit intutive, I was able to navigate and make purchases seamlessly, Great job! ",
                  trimLines: 1,
                  trimExpandedText: "Show less",
                  trimCollapsedText: "Show more",
                  moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: YColors.primary),
                  lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: YColors.primary),
                  trimMode: TrimMode.Line,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: YSizes.spaceBetweenSections,
        )
      ],
    );
  }
}
