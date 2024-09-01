import 'package:ecommerceapplication/features/shop/controller/category_controller.dart';
import 'package:ecommerceapplication/features/shop/screens/sub_categories/sub_categories.dart';
import 'package:ecommerceapplication/utils/constants/colors.dart';
import 'package:ecommerceapplication/utils/helpers/helperFunction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../commons/widgets/categories_Widgets/catagories_widget_image_text.dart';
import '../../../../../commons/widgets/shimmers/category_Shimmer.dart';

class YHomeCategories extends StatelessWidget {
  const YHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = YHelperFunctions.isDarkMode(context);
    final categoryController = Get.put(CategoryController());
    return Obx(() {
      if (categoryController.isLoading.value) return YCategoryShimmer();
      if (categoryController.featuredCategories.isEmpty) {
        return Center(
          child: Text(
            "No Data Found",
            style: Theme.of(context).textTheme.bodyMedium?.apply(
                  color: isDark ? YColors.white : YColors.black,
                ),
          ),
        );
      }

      return SizedBox(
        height: 90,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: categoryController.featuredCategories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final category = categoryController.featuredCategories[index];
            return YCategories(
              image: category.image,
              imageTitle: category.name,
              onTap: () {
                Get.to(() => const SubCategoriesScreen());
              },
              backgroundColor: null,
            );
          },
        ),
      );
    });
  }
}
