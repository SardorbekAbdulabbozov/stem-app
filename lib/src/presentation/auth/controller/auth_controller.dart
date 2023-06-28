import 'package:team_project/src/core/controller/base_controller.dart';

class AuthController extends BaseController {
  bool isIntro = true;
  bool isRegister = false;

  void changeAuthMode({required bool isRegister}) {
    this.isRegister = isRegister;
    isIntro = false;
    update();
  }
}
