import 'package:e_store/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(OnBoardingController());
  }
}
