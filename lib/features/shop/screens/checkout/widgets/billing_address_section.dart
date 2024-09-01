import 'package:ecommerceapplication/commons/widgets/texts/section_heading.dart';
import 'package:ecommerceapplication/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class YBillingAddressSection extends StatelessWidget {
  const YBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        YSectionHeading(
          sectionTitle: 'Shipping Address',
          buttonTitle: "Change",
          onPressed: () {},
        ),
        Text(
          "kala Baagh",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: YSizes.spaceBetween/2,),
        Row(
          children: [
            const Icon(
              Icons.phone,
              color: Colors.grey,
              size: 16,
            ),
            const SizedBox(
              width: YSizes.spaceBetween,
            ),
            Text(
              "+92 331 4567890",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(
          height: YSizes.spaceBetween / 2,
        ),
        Row(
          children: [
            const Icon(
              Icons.location_history,
              color: Colors.grey,
              size: 16,
            ),
            const SizedBox(
              width: YSizes.spaceBetween,
            ),
            Expanded(
              child: Text(
                "South Liama, Maine 87659, USA",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
