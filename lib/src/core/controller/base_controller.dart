import 'package:get/get.dart';

class BaseController extends GetxController {
  bool isLoading = false;

  void setLoading(bool status){
    isLoading = status;
    update();
  }
}
