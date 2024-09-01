import 'package:ecommerceapplication/commons/widgets/shimmers/shimmer_loader.dart';
import 'package:ecommerceapplication/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class YCategoryShimmer extends StatelessWidget {
  const YCategoryShimmer({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => SizedBox(
          width: YSizes.spaceBetween,
        ),
        itemBuilder: (_, __) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              YShimmerEffect(
                width: 55,
                height: 55,
                radius: 55,
              ),
              SizedBox(
                height: YSizes.spaceBetween / 2,
              ),
              YShimmerEffect(
                width: 55,
                height: 8,
              ),
            ],
          );
        },
      ),
    );
  }
}
