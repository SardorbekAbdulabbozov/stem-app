import 'package:get/get.dart';
import 'package:team_project/src/presentation/splash/controller/splash_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }
}
