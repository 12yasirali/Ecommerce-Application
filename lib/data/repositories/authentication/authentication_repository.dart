import 'package:ecommerceapplication/data/repositories/user/user_repository.dart';
import 'package:ecommerceapplication/features/authentication/screens/OnBoarding/Widgets/onboarding.dart';
import 'package:ecommerceapplication/features/authentication/screens/login/login_Page.dart';
import 'package:ecommerceapplication/features/authentication/screens/signUp/verify_Email.dart';
import 'package:ecommerceapplication/home_menu.dart';
import 'package:ecommerceapplication/utils/constants/image_path.dart';
import 'package:ecommerceapplication/utils/exception/firebase_auth_exception.dart';
import 'package:ecommerceapplication/utils/exception/firebase_exception.dart';
import 'package:ecommerceapplication/utils/exception/format_exception.dart';
import 'package:ecommerceapplication/utils/exception/plateform_exception.dart';
import 'package:ecommerceapplication/utils/popups/fullscreen_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;
  User? get authUser => _auth.currentUser;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
    super.onReady();
  }

  screenRedirect() {
    final user = _auth.currentUser;
    if (user != null) {
      user.reload();
      if (user.emailVerified) {
        Get.offAll(() => const Home_Menu());
      } else {
        Get.offAll(() => Verify_Email(email: _auth.currentUser?.email));
      }
    } else {
      //locale storage
      deviceStorage.writeIfNull("IsFirstTime", true);
      deviceStorage.read("IsFirstTime") != true
          ? Get.offAll(() => const Login_Page())
          : Get.offAll(() => const OnBoardingScreen());
    }
  }

  Future<UserCredential> registerUsingEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credentials = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credentials;
    } on FirebaseException catch (e) {
      throw YFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw YFormatException(e.message);
    } on PlatformException catch (e) {
      throw YPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong, Please try again.";
    }
  }

  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential;
    } on FirebaseAuthException catch (e) {
      throw YFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw YFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw YFormatException();
    } on PlatformException catch (e) {
      throw YPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong, Please try again.";
    }
  }

  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw YFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw YFormatException();
    } on PlatformException catch (e) {
      throw YPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong, Please try again.";
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw YFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw YFormatException();
    } on PlatformException catch (e) {
      throw YPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong, Please try again.";
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;

      final credentials = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw YFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw YFormatException();
    } on PlatformException catch (e) {
      throw YPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong, Please try again.";
    }
  }

  Future<void> logout() async {
    try {
      YFullScreenLoader.openLoadingDialog(
          "You are logged Outing", YImagePath.loadingAnimationJson);
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      YFullScreenLoader.stopLoader();
      Get.offAll(() => const Login_Page());
    } on FirebaseAuthException catch (e) {
      throw YFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw YFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw YFormatException();
    } on PlatformException catch (e) {
      throw YPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong, Please try again.";
    }
  }

  Future<void> deleteAccount() async {
    try {
      UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      throw YFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw YFormatException();
    } on PlatformException catch (e) {
      throw YPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong, Please try again.";
    }
  }

  Future<void> reAuthenticateUserWithEmailAndPassword(
      String email, String password) async {
    try {
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: password);
      await _auth.currentUser?.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw YFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw YFormatException();
    } on PlatformException catch (e) {
      throw YPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong, Please try again.";
    }
  }
}
