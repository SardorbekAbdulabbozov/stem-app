import 'package:get/get.dart';
import 'package:team_project/src/core/controller/base_controller.dart';
import 'package:team_project/src/data/models/user_model.dart';

class ProfileController extends BaseController {
  late UserModel user;

  List<ProfileMenuItem> menu = [
    ProfileMenuItem(title: 'profile_edit'.tr, icon: 'edit'),
    ProfileMenuItem(title: 'my_subjects'.tr, icon: 'my_subjects'),
    ProfileMenuItem(title: 'my_coins'.tr, icon: 'coin_dollar'),
    ProfileMenuItem(title: 'saved_lessons'.tr, icon: 'bookmark_filled'),
    ProfileMenuItem(title: 'streaks'.tr, icon: 'streak'),
    ProfileMenuItem(title: 'settings'.tr, icon: 'setting'),
  ];

  @override
  void onInit() {
    super.onInit();
    user = localSource.getUserDetails();
  }
}

class ProfileMenuItem {
  final String title;
  final String icon;

  ProfileMenuItem({required this.title, required this.icon});
}
