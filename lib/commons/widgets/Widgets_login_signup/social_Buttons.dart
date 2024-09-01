import 'package:ecommerceapplication/features/authentication/controllers/login_Controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_path.dart';
import '../../../utils/constants/sizes.dart';

class YSocialButtons extends StatelessWidget {
  const YSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: YColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {
              controller.googleSignIn();
            },
            icon: const Image(
                width: YSizes.IconMd,
                height: YSizes.IconMd,
                image: AssetImage(YImagePath.googleLogo)),
          ),
        ),
        const SizedBox(
          width: YSizes.spaceBetween,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: YColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
                width: YSizes.IconMd,
                height: YSizes.IconMd,
                image: AssetImage(YImagePath.facebookLogo)),
          ),
        )
      ],
    );
  }
}
