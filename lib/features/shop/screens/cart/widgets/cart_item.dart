import 'package:flutter/material.dart';

import '../../../../../commons/widgets/products/cart/add_remove_quantity_button.dart';
import '../../../../../commons/widgets/products/cart/cart_item_added.dart';
import '../../../../../commons/widgets/texts/product_PriceText.dart';
import '../../../../../utils/constants/sizes.dart';

class YCartItemsList extends StatelessWidget {
  const YCartItemsList({
    super.key,
    this.showAddRemoveButton = true,
  });

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 2,
      separatorBuilder: (_, __) => const SizedBox(
        height: YSizes.spaceBetweenSections,
      ),
      itemBuilder: (_, index) {
        return Column(
          children: [
            const YCartItemAdded(),
            if (showAddRemoveButton)
              const SizedBox(
                height: YSizes.spaceBetween,
              ),
            if (showAddRemoveButton)
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 60,
                      ),
                      YProductQuantityWithAddAndRemove(),
                    ],
                  ),
                  YProductPriceText(
                    price: "256",
                  ),
                ],
              )
          ],
        );
      },
    );
  }
}
