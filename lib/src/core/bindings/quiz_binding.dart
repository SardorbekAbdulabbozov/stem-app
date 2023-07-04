import 'package:get/get.dart';
import 'package:team_project/src/presentation/quiz/controller/quiz_controller.dart';

class QuizBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuizController>(() => QuizController());
  }
}
