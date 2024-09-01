import 'package:ecommerceapplication/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:flutter/material.dart';

class YOverallProductRatings extends StatelessWidget {
  const YOverallProductRatings({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            text,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              YRatingProgressIndicator(
                text: '5',
                value: 1.0,
              ),
              YRatingProgressIndicator(
                text: '4',
                value: 0.8,
              ),
              YRatingProgressIndicator(
                text: '3',
                value: 0.6,
              ),
              YRatingProgressIndicator(
                text: '2',
                value: 0.4,
              ),
              YRatingProgressIndicator(
                text: '1',
                value: 0.2,
              ),
            ],
          ),
        )
      ],
    );
  }
}
