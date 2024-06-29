import 'package:e_store/data/repositories/authentication/authentication_repository.dart';
import 'package:e_store/features/personalization/controllers/user_controller.dart';
import 'package:e_store/utils/constants/image_strings.dart';
import 'package:e_store/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../data/services/network_manager.dart';
import '../../../../utils/popups/loaders.dart';

class LoginController extends GetxController {
  /// Variables
  final localStorage = GetStorage();
  final hidePassword = true.obs;
  final rememberMe = false.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final userController = Get.put(UserController());

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
  }

  /// -- Email and Password SignIn
  Future<void> emailAndPasswordSignIn() async {
    try {
      //   Start Loading
      EFullScreenLoader.onLoadingDialog(
        'Logging you in....',
        EImages.docerAnimation,
      );

      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        EFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        EFullScreenLoader.stopLoading();
        return;
      }

      // Login user using Email and Password Authentication
      final userCredential = await AuthenticationRepository.instance.login(
        email.text.trim(),
        password.text.trim(),
      );

      // Sava data if remember Me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // Remove Loader
      EFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // Remove Loader
      EFullScreenLoader.stopLoading();

      // Show some Generic Error to the user
      ELoaders.errorSnackBar(title: 'Oh snap', message: e.toString());
    }
  }

  /// -- Google SignIn Authentication
  Future<void> googleSignIn() async {
    try {
      //   Start Loading
      EFullScreenLoader.onLoadingDialog(
        'Logging you in....',
        EImages.docerAnimation,
      );

      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        EFullScreenLoader.stopLoading();
        return;
      }

      // Google Authentication
      final userCredential =
          await AuthenticationRepository.instance.signInWithGoogle();

      // Save user record
      await userController.saveUserRecord(userCredential);

      // Remove Loader
      EFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // Remove Loader
      EFullScreenLoader.stopLoading();

      ELoaders.errorSnackBar(title: 'Oh snap', message: e.toString());
    }
  }
}
