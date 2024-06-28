import 'package:e_store/data/repositories/authentication/authentication_repository.dart';
import 'package:e_store/data/repositories/user/user_repository.dart';
import 'package:e_store/features/authentication/models/user_model.dart';
import 'package:e_store/features/authentication/screens/signup/verify_email.dart';
import 'package:e_store/utils/constants/image_strings.dart';
import 'package:e_store/utils/popups/full_screen_loader.dart';
import 'package:e_store/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../data/services/network_manager.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs; // Observable for hiding/showing password
  final privacyPolicy = true.obs; // Observable for privacy policy acceptance
  final email = TextEditingController(); // Controller for email input
  final lastName = TextEditingController(); // Controller for lastName input
  final firstName = TextEditingController(); // Controller for firstName input
  final userName = TextEditingController(); // Controller for userName input
  final password = TextEditingController(); // Controller for password input
  final phoneNumber = TextEditingController(); // Controller for phoneNo input
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// Signup
  void signup() async {
    try {
      // Start Loading
      EFullScreenLoader.onLoadingDialog(
        'We are processing your information...',
        EImages.docerAnimation,
      );

      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        EFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!signupFormKey.currentState!.validate()) {
        EFullScreenLoader.stopLoading();
        return;
      }

      // Privacy Policy Check
      if (!privacyPolicy.value) {
        ELoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message:
              'In order to create account you must have to read and accept Privacy Policy and Terms of Use',
        );
        return;
      }

      // Register user in the Firebase Authentication and Save user data in the Firebase
      final userCredential =
          await AuthenticationRepository.instance.registerWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );

      // Save Authenticated user data in the Firebase Firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        userName: userName.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Stop Loading
      EFullScreenLoader.stopLoading();

      // Show Success Message
      ELoaders.successSnackBar(
        title: 'Congratulations',
        message: 'Your account has been crated! Verify email to continue.',
      );

      // Move to verify email screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      //   Remove Loader
      EFullScreenLoader.stopLoading();

      // Show some Generic Error to the user
      ELoaders.errorSnackBar(title: 'Oh snap', message: e.toString());
    }
  }
}
