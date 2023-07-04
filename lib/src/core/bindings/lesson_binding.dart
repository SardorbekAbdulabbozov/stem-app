import 'package:get/get.dart';
import 'package:team_project/src/presentation/lesson/controller/lesson_controller.dart';

class LessonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LessonController>(() => LessonController());
  }
}
