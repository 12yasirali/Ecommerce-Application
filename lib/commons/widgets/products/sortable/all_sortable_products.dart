import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../../layouts/grid_layout.dart';
import '../product_cards/product_cart_vertical.dart';

class YSortableProducts extends StatelessWidget {
  const YSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Iconsax.sort,
              ),
            ),
            items: [
              "Name",
              "Higher Price",
              "Lower Price",
              "Sale",
              "Newest",
              "Popularity"
            ]
                .map((options) =>
                    DropdownMenuItem(value: options, child: Text(options)))
                .toList(),
            onChanged: (value) {}),
        const SizedBox(
          height: YSizes.spaceBetweenSections,
        ),
        YGrid_Layout(
          itemCount: 8,
          itemBuilder: (_, index) {
            return const ProductVerticalCart();
          },
        ),
      ],
    );
  }
}
