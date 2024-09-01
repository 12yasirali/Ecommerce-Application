import 'package:ecommerceapplication/commons/widgets/appbar/appBar.dart';
import 'package:ecommerceapplication/commons/widgets/brand/brand_card.dart';
import 'package:ecommerceapplication/commons/widgets/products/sortable/all_sortable_products.dart';
import 'package:ecommerceapplication/utils/constants/image_path.dart';
import 'package:ecommerceapplication/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: YAppBar(
        title: Text("Nike"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(
            YSizes.defaultSpace,
          ),
          child: Column(
            children: [
              YBrandCard(
                imageUrl: YImagePath.cloths,
                brandTitle: "Nike",
                brandProducts: "200",
              ),
              SizedBox(
                height: YSizes.spaceBetweenSections,
              ),
              YSortableProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
