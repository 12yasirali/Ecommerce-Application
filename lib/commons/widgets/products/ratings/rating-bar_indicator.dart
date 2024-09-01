import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';

class YRatingBarIndicator extends StatelessWidget {
  const YRatingBarIndicator({
    super.key,
    required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: 3.5,
      itemSize: 20,
      unratedColor: YColors.grey,
      itemBuilder: (_, __) {
        return const Icon(
          Iconsax.star1,
          color: YColors.primary,
        );
      },
    );
  }
}
