import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../commons/widgets/appbar/appBar.dart';
import '../../../../../commons/widgets/curved_edges/custom_Curved_widget.dart';
import '../../../../../commons/widgets/icon/CircularHeartIcon.dart';
import '../../../../../commons/widgets/icon/Circular_BrandImage.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_path.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helperFunction.dart';

class YImageShowCaseSlider extends StatelessWidget {
  const YImageShowCaseSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = YHelperFunctions.isDarkMode(context);
    return YCurvedEdgeWidget(
      child: Container(
        color: isDark ? YColors.black : YColors.white,
        child: Stack(
          children: [
            const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(YSizes.productImageRadius),
                child: Center(
                  child: Image(
                    image: AssetImage(
                      YImagePath.nikeBoots,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              left: YSizes.defaultSpace,
              right: YSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: 4,
                  separatorBuilder: (_, __) => const SizedBox(
                    width: YSizes.spaceBetween,
                  ),
                  itemBuilder: (_, index) {
                    return YCircularImage(
                      width: 80,
                      showImageColor: true,
                      imageUrl: YImagePath.nikeBoots2,
                      border: Border.all(color: YColors.primary),
                      fit: BoxFit.contain,
                      padding: const EdgeInsets.all(0),
                    );
                  },
                ),
              ),
            ),
            const YAppBar(
              showBackArrow: true,
              actions: [
                YCircularIcon(
                  icon: Iconsax.heart5,
                  iconColor: Colors.red,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
