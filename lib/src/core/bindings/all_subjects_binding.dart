import 'package:get/get.dart';
import 'package:team_project/src/presentation/all_subjects/controller/all_subjects_controller.dart';

class AllSubjectsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllSubjectsController>(() => AllSubjectsController());
  }
}
