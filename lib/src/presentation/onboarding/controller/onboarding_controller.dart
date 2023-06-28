import 'package:team_project/src/core/controller/base_controller.dart';

class OnboardingController extends BaseController{
  int sceneIndex = 0;

  void changeScene(int newIndex) {
    sceneIndex = newIndex;
    update();
  }
}