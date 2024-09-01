import 'package:ecommerceapplication/features/authentication/controllers/signup_Controller/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_string.dart';
import '../../../../../utils/helpers/helperFunction.dart';

class YTermsAndCondition extends StatelessWidget {
  const YTermsAndCondition({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignUpController.instance;
    final isDark = YHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(
            () => Checkbox(
              value: controller.checkTermsAndCondition.value,
              onChanged: (value) {
                controller.checkTermsAndCondition.value =
                    !controller.checkTermsAndCondition.value;
              },
            ),
          ),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text.rich(
              softWrap: true,
              TextSpan(
                children: [
                  TextSpan(
                    text: YTextString.iAgreeTO,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  TextSpan(
                    text: " ${YTextString.privacyPolicy}",
                    style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: isDark ? YColors.white : YColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor:
                            isDark ? YColors.white : YColors.primary),
                  ),
                  TextSpan(
                    text: " ${YTextString.and} ",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  TextSpan(
                    text: YTextString.termOfUse,
                    style: Theme.of(context).textTheme.bodySmall!.apply(
                        color: isDark ? YColors.white : YColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor:
                            isDark ? YColors.white : YColors.primary),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
