import 'package:e_store/features/authentication/screens/login/login.dart';
import 'package:e_store/features/authentication/screens/onBoarding/onboarding.dart';
import 'package:e_store/utils/exceptions/format_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// Function to show relevant screen
  screenRedirect() {
    // Local Storage
    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') == false
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const OnBoardingScreen());
  }

  /* -------------------- Email & Password sign-in -------------------- */

  /// [EmailAuthentication] - SignIn

  /// [EmailAuthentication] - REGISTER
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseException catch (e) {
      throw EFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw const EFormatException();
    } on PlatformException catch (e) {
      throw EPlatformException(e.code).message;
    } catch (e) {
      throw 'Some thing went wrong. Please try again';
    }
  }

  /// [EmailAuthentication] - MAIL VERIFICATION
  Future<void> sendMailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseException catch (e) {
      throw EFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw const EFormatException();
    } on PlatformException catch (e) {
      throw EPlatformException(e.code).message;
    } catch (e) {
      throw 'Some thing went wrong. Please try again';
    }
  }

  /// [EmailAuthentication] - ReAuthenticate User
  /// [EmailAuthentication] - FORGET PASSWORD

  /* -------------------- Federated identity & social sign-in -------------------- */

  /// [GoogleAuthentication] - GOOGLE
  /// [FacebookAuthentication] - FACEBOOK

  /* -------------------- ./end Federated identity & social sign-in -------------------- */

  /// [LogoutUser] - Valid for any Authentication
  /// [DeleteUser] - Remove user Auth and Firebase account
}
