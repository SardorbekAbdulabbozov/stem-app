import 'package:get/get.dart';
import 'package:team_project/src/core/controller/base_controller.dart';
import 'package:team_project/src/config/app_routes.dart';
import 'package:team_project/src/data/local_source/local_source.dart';

class SplashController extends BaseController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        if (!LocalSource.getInstance().getIntroStatus()) {
          Get.offNamed(AppRoutes.onboarding);
        } else {
          Get.offNamed(AppRoutes.home);
        }
      },
    );
  }
}
