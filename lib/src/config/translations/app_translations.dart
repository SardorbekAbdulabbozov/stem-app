import 'package:get/get.dart';
import 'package:team_project/src/config/translations/uz.dart';
import 'package:team_project/src/config/translations/en.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': En().translations,
    'uz_UZ': Uz().translations,
  };
}