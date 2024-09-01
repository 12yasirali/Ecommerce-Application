import 'package:ecommerceapplication/commons/widgets/appbar/appBar.dart';
import 'package:ecommerceapplication/features/shop/screens/product_reviews/widgets/product_overall_reviews.dart';
import 'package:ecommerceapplication/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:ecommerceapplication/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../commons/widgets/products/ratings/rating-bar_indicator.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const YAppBar(
        title: Text("Reviews and Ratings"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            YSizes.defaultSpace,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Rating and reviews are verified and from the people who use the same type of device that you use",
              ),
              const SizedBox(
                height: YSizes.spaceBetween,
              ),
              const YOverallProductRatings(
                text: '4.8',
              ),
              const YRatingBarIndicator(
                rating: 3.5,
              ),
              Text(
                "12,611",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: YSizes.spaceBetweenSections,
              ),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
