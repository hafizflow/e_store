import 'package:e_store/data/services/network_manager.dart';
import 'package:e_store/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:e_store/features/authentication/controllers/signup/signup_controller.dart';
import 'package:e_store/features/shop/controllers/home_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(OnBoardingController());
    Get.put(HomeController());
    Get.put(SignupController());
  }
}
