import 'package:ecommerceapplication/commons/widgets/appbar/appBar.dart';
import 'package:ecommerceapplication/features/shop/screens/brands/brand_Products.dart';
import 'package:ecommerceapplication/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../commons/widgets/brand/brand_card.dart';
import '../../../../commons/widgets/layouts/grid_layout.dart';
import '../../../../commons/widgets/texts/section_heading.dart';
import '../../../../utils/constants/image_path.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const YAppBar(
        title: Text('Brands'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            YSizes.defaultSpace,
          ),
          child: Column(
            children: [
              const YSectionHeading(
                sectionTitle: "Brands",
                showButton: false,
              ),
              const SizedBox(
                height: YSizes.spaceBetween,
              ),
              YGrid_Layout(
                itemCount: 10,
                mainAxisExtent: 70,
                itemBuilder: (_, index) {
                  return YBrandCard(
                    showBorder: false,
                    imageUrl: YImagePath.cloths,
                    brandTitle: "Nike",
                    brandProducts: "200",
                    onTap: () {
                      Get.to(() => const BrandProducts());
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
