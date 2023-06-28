import 'package:get/get.dart';
import 'package:team_project/src/presentation/topic/controller/topic_controller.dart';

class TopicBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TopicController>(() => TopicController());
  }
}
