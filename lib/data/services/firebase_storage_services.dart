import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/exception/firebase_exception.dart';
import '../../utils/exception/plateform_exception.dart';

class YFirebaseStorageServices extends GetxController {
  static YFirebaseStorageServices get instance => Get.find();

  final _firebaseStorage = FirebaseStorage.instance;

  Future<Uint8List> getimageDataFromAssets(String path) async {
    try {
      final byteData = await rootBundle.load(path);
      final imageData = byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
      return imageData;
    } on FirebaseException catch (e) {
      throw YFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw YPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong, Please try again";
    }
  }

  Future<String> uploadImageData(
      String path, Uint8List image, String name) async {
    try {
      final ref = _firebaseStorage.ref(path).child(name);
      await ref.putData(image);
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      throw YFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw YPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong, Please try again";
    }
  }

  Future<String> uploadImageFile(String path, XFile image) async {
    try {
      final ref = _firebaseStorage.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      throw YFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw YPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong, Please try again";
    }
  }
}
