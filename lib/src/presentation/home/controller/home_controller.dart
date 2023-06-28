import 'package:flutter/material.dart';
import 'package:team_project/src/core/controller/base_controller.dart';
import 'package:team_project/src/presentation/leaderboard/screen/leaderboard_screen.dart';
import 'package:team_project/src/presentation/my_learning/screen/my_learning_screen.dart';
import 'package:team_project/src/presentation/profile/screen/profile_screen.dart';

class HomeController extends BaseController {
  int navBarIndex = 0;
  FocusNode searchFocus = FocusNode();

  @override
  void dispose() {
    searchFocus.dispose();
    super.dispose();
  }

  void changeIndex(int newIndex) {
    navBarIndex = newIndex;
    update();
  }

  List<Widget> screens = [
    const MyLearningScreen(),
    const LeaderboardScreen(),
    const ProfileScreen(),
  ];
}
