import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapplication/features/shop/models/category_model.dart';
import 'package:ecommerceapplication/utils/exception/firebase_exception.dart';
import 'package:ecommerceapplication/utils/exception/plateform_exception.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../services/firebase_storage_services.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapShot = await _db.collection("Categories").get();
      final list = snapShot.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();
      return list;
    } on FirebaseException catch (e) {
      throw YFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw YPlatformException(e.code).message;
    } catch (_) {
      throw "Something went wrong, Please try again";
    }
  }

  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      final storage = Get.put(YFirebaseStorageServices());

      for (var category in categories) {
        final file = await storage.getimageDataFromAssets(category.image);

        final url =
            await storage.uploadImageData("Categories", file, category.name);

        category.image = url;

        await _db
            .collection("Categories")
            .doc(category.id)
            .set(category.toJson());
      }
    } on FirebaseException catch (e) {
      throw YFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw YPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong, Please try again";
    }
  }
}
