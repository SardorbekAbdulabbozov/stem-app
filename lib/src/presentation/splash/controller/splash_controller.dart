import 'package:get/get.dart';
import 'package:team_project/src/core/controller/base_controller.dart';
import 'package:team_project/src/config/app_routes.dart';

class SplashController extends BaseController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        if (!localSource.hasProfile()) {
          if (!localSource.getIntroStatus()) {
            Get.offNamed(AppRoutes.onboarding);
          } else {
            Get.offNamed(AppRoutes.auth);
          }
        } else {
          if (!localSource.getIntroStatus()) {
            Get.offNamed(AppRoutes.onboarding);
          } else {
            Get.offNamed(AppRoutes.home);
          }
        }
      },
    );
  }
}
