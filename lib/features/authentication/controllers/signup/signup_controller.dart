import 'package:e_store/utils/constants/image_strings.dart';
import 'package:e_store/utils/popups/full_screen_loader.dart';
import 'package:e_store/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../data/services/network_manager.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final email = TextEditingController(); // Controller for email input
  final lastName = TextEditingController(); // Controller for lastName input
  final firstName = TextEditingController(); // Controller for firstName input
  final userName = TextEditingController(); // Controller for userName input
  final password = TextEditingController(); // Controller for password input
  final phoneNumber = TextEditingController(); // Controller for phoneNo input
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// Signup
  Future<void> signup() async {
    try {
      // Start Loading
      EFullScreenLoader.onLoadingDialog(
          'We are processing your information...', EImages.docerAnimation);

      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      // Form Validation
      if (!signupFormKey.currentState!.validate()) return;

      // Privacy Policy Check

      // Register user in the Firebase Authentication and Save user data in the Firebase

      // Save Authenticated user data in the Firebase Firestore

      // Show Success Message

      // Move to verify email screen
    } catch (e) {
      // Show some Generic Error to the user
      ELoaders.errorSnackBar(title: 'Oh snap', message: e.toString());
    } finally {
      //   Remove Loader
      EFullScreenLoader.stopLoading();
    }
  }
}
