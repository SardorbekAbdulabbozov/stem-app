import 'package:get/get.dart';
import 'package:team_project/src/data/local_source/local_source.dart';

class BaseController extends GetxController {

  LocalSource localSource = LocalSource.getInstance();
  bool isLoading = false;

  void setLoading(bool status){
    isLoading = status;
    update();
  }
}
