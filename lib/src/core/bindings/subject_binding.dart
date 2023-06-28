import 'package:get/get.dart';
import 'package:team_project/src/presentation/subject/controller/subject_controller.dart';

class SubjectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubjectController>(() => SubjectController());
  }
}
