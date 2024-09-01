import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapplication/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerceapplication/data/repositories/user/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<void> saveRecords(UserModel user) async {
    try {
      await _fireStore.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw "${e.message}";
    } on FormatException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw "${e.message}";
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _fireStore
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseException catch (e) {
      throw "${e.message}";
    } on FormatException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw "${e.message}";
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  Future<void> updateUserDetails(UserModel updateUser) async {
    try {
      await _fireStore
          .collection("Users")
          .doc(updateUser.id)
          .update(updateUser.toJson());
    } on FirebaseException catch (e) {
      throw "${e.message}";
    } on FormatException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw "${e.message}";
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _fireStore
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .update(json);
    } on FirebaseException catch (e) {
      throw "${e.message}";
    } on FormatException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw "${e.message}";
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  Future<void> removeUserRecord(String userId) async {
    try {
      await _fireStore.collection("Users").doc(userId).delete();
    } on FirebaseException catch (e) {
      throw "${e.message}";
    } on FormatException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw "${e.message}";
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  Future<String> uploadImage(String path, XFile image) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      throw "${e.message}";
    } on FormatException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw "${e.message}";
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }
}
