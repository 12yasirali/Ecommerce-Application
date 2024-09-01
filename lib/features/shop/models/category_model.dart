import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String image;
  String name;
  String? parentId;
  bool isFeatured;

  CategoryModel(
      {required this.id,
      required this.name,
      required this.image,
      this.parentId,
      required this.isFeatured});

  static CategoryModel empty() => CategoryModel(
      id: " ", name: " ", image: " ", parentId: " ", isFeatured: false);
  Map<String, dynamic> toJson() {
    return {
      "Image": image,
      "Name": name,
      "IsFeatured": isFeatured,
      "ParentId": parentId
    };
  }

  factory CategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return CategoryModel(
        id: document.id,
        name: data["Name"] ?? " ",
        image: data["Image"] ?? " ",
        parentId: data["ParentId"] ?? " ",
        isFeatured: data["IsFeatured"] ?? false,
      );
    }
    return CategoryModel.empty();
  }
}
