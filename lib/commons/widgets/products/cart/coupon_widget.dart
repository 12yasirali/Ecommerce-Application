import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helperFunction.dart';
import '../../containers/custom_Container.dart';

class YCouponCode extends StatelessWidget {
  const YCouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = YHelperFunctions.isDarkMode(context);
    return YCircularContainer(
      showBorder: true,
      backgroundColor: isDark ? YColors.dark : YColors.white,
      padding: const EdgeInsets.only(
        top: YSizes.sm,
        left: YSizes.md,
        right: YSizes.sm,
        bottom: YSizes.sm,
      ),
      margin: const EdgeInsets.all(0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: "Have a promo code? Enter Here",
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  foregroundColor: isDark
                      ? YColors.white.withOpacity(0.5)
                      : YColors.black.withOpacity(0.5),
                  backgroundColor: YColors.grey.withOpacity(0.1),
                  side: BorderSide.none),
              child: const Text("Apply",
                  style: TextStyle(
                    fontSize: 12,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
