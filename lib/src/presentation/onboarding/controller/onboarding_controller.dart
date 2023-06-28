import 'package:get/get.dart';
import 'package:team_project/src/config/app_routes.dart';
import 'package:team_project/src/core/controller/base_controller.dart';

class OnboardingController extends BaseController {
  int sceneIndex = 0;

  void changeScene(int newIndex) {
    sceneIndex = newIndex;
    update();
  }

  void goToNextPage() {
    if (!localSource.hasProfile()) {
      Get.offNamed(AppRoutes.auth);
    } else {
      Get.offNamed(AppRoutes.home);
    }
  }
}
