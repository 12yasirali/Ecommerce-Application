import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_path.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helperFunction.dart';
import '../containers/custom_Container.dart';
import 'brand_card.dart';

class YBrandShowCase extends StatelessWidget {
  const YBrandShowCase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    final isDark = YHelperFunctions.isDarkMode(context);
    return YCircularContainer(
      showBorder: true,
      borderColor: YColors.darkerGrey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(YSizes.md),
      margin: const EdgeInsets.only(bottom: YSizes.spaceBetween),
      child: Column(
        children: [
          const YBrandCard(
              showBorder: false,
              imageUrl: YImagePath.cloths,
              brandTitle: 'Nike',
              brandProducts: "200"),
          Row(
              children: images
                  .map(
                    (imageString) =>
                        brandTopProductImageWidget(imageString, isDark),
                  )
                  .toList())
        ],
      ),
    );
  }

  Expanded brandTopProductImageWidget(String image, bool isDark) {
    return Expanded(
      child: YCircularContainer(
        height: 70,
        backgroundColor: isDark ? YColors.black : YColors.white,
        padding: const EdgeInsets.all(YSizes.md),
        margin: const EdgeInsets.only(right: YSizes.sm),
        child: Image(
          fit: BoxFit.contain,
          image: AssetImage(image),
        ),
      ),
    );
  }
}
