import 'package:ecommerceapplication/utils/constants/image_path.dart';

import '../../features/shop/models/category_model.dart';

class DummyData{

  // static final List<BannerModel> banners = [
  // ]

  static final List<CategoryModel> categories = [
    CategoryModel(id: "1", name: "Sports", image: YImagePath.sports, isFeatured: false),
    CategoryModel(id: "2", name: "Furniture", image: YImagePath.sports, isFeatured: false),
    CategoryModel(id: "3", name: "Electronics", image: YImagePath.sports, isFeatured: false),
    CategoryModel(id: "4", name: "Clothes", image: YImagePath.sports, isFeatured: false),
    CategoryModel(id: "5", name: "Animals", image: YImagePath.sports, isFeatured: false),
    CategoryModel(id: "6", name: "Shoes", image: YImagePath.sports, isFeatured: false),
    CategoryModel(id: "7", name: "Cosmetics", image: YImagePath.sports, isFeatured: false),
    CategoryModel(id: "14", name: "Jewelery", image: YImagePath.sports, isFeatured: false),

    //subCatagories
    CategoryModel(id: "7", name: "Sports", image: YImagePath.sports, parentId: "1",isFeatured: false),
    CategoryModel(id: "7", name: "Sports", image: YImagePath.sports, parentId: "1",isFeatured: false),
    CategoryModel(id: "7", name: "Sports", image: YImagePath.sports, parentId: "1",isFeatured: false),
  ];
}