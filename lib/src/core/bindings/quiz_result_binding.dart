import 'package:get/get.dart';
import 'package:team_project/src/presentation/quiz_result/controller/quiz_result_controller.dart';

class QuizResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuizResultController>(() => QuizResultController());
  }
}
