import 'package:ecommerceapplication/commons/widgets/containers/custom_Container.dart';
import 'package:ecommerceapplication/commons/widgets/texts/section_heading.dart';
import 'package:ecommerceapplication/utils/constants/colors.dart';
import 'package:ecommerceapplication/utils/constants/image_path.dart';
import 'package:ecommerceapplication/utils/constants/sizes.dart';
import 'package:ecommerceapplication/utils/helpers/helperFunction.dart';
import 'package:flutter/material.dart';

class YBillingPaymentSection extends StatelessWidget {
  const YBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = YHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        YSectionHeading(
          sectionTitle: "Payment Methods",
          buttonTitle: "Change",
          onPressed: () {},
        ),
        const SizedBox(
          height: YSizes.spaceBetween / 2,
        ),
        Row(
          children: [
            YCircularContainer(
              width: 80,
              height: 45,
              showCircleColor: true,
              padding: const EdgeInsets.all(5),
              backgroundColor: isDark ? YColors.darkerGrey : YColors.white,
              child: const Image(image: AssetImage(YImagePath.applePay)),
            ),
            const SizedBox(
              width: YSizes.spaceBetween,
            ),
            Text(
              "Apple Pay",
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ],
        )
      ],
    );
  }
}
