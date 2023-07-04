import 'package:get/get.dart';
import 'package:team_project/src/presentation/model/controller/model_controller.dart';

class ModelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ModelController>(() => ModelController());
  }
}
