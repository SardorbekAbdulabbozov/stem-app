import 'package:get/get.dart';
import 'package:team_project/src/presentation/home/controller/home_controller.dart';
import 'package:team_project/src/presentation/leaderboard/controller/leaderboard_controller.dart';
import 'package:team_project/src/presentation/my_learning/controller/my_learning_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<MyLearningController>(
      () => MyLearningController(),
      fenix: true,
    );
    Get.lazyPut<LeaderboardController>(
      () => LeaderboardController(),
      fenix: true,
    );
  }
}
