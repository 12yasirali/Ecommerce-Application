import 'package:ecommerceapplication/data/repositories/category/category_repository.dart';
import 'package:ecommerceapplication/features/shop/models/category_model.dart';
import 'package:ecommerceapplication/utils/popups/loader.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    try {
      isLoading.value = true;

      final categories = await _categoryRepository.getAllCategories();

      allCategories.assignAll(categories);

      featuredCategories.assignAll(allCategories
          .where(
            (category) => category.isFeatured && category.parentId!.isNotEmpty,
          )
          .take(8)
          .toList());
    } catch (e) {
      YLoaders.errorSnackBar(title: "Oh no!", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
