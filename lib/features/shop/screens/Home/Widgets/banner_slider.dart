import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerceapplication/features/shop/controller/home_controller.dart';
import 'package:ecommerceapplication/utils/constants/colors.dart';
import 'package:ecommerceapplication/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../commons/widgets/banners/banner_image.dart';
import '../../../../../commons/widgets/containers/custom_Container.dart';

class YBannerSlider extends StatelessWidget {
  const YBannerSlider({
    super.key,
    required this.banner,
  });

  final List<String> banner;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeBannerController());
    return Column(
      children: [
        CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 1.0,
              onPageChanged: (index, _) {
                controller.updatePageIndicator(index);
              },
            ),
            items: banner
                .map(
                  (url) => YRoundedImageContainer(
                    imageUrl: url,
                    applyImageRadius: true,
                  ),
                )
                .toList()),
        const SizedBox(
          height: YSizes.spaceBetween,
        ),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < 5; i++)
                YCircularContainer(
                  width: 20,
                  height: 4,
                  margin: const EdgeInsets.only(right: 10),
                  backgroundColor: controller.carouselCurrentIndex.value == i
                      ? YColors.primary
                      : YColors.grey,
                ),
            ],
          ),
        )
      ],
    );
  }
}
