import 'package:get/get.dart';
import 'package:team_project/src/presentation/onboarding/controller/onboarding_controller.dart';

class OnboardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardingController>(() => OnboardingController());
  }
}
