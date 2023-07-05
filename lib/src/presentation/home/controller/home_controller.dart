import 'package:flutter/material.dart';
import 'package:team_project/src/core/controller/base_controller.dart';
import 'package:team_project/src/data/network_models/all_subjects_response.dart';
import 'package:team_project/src/presentation/home/repository/home_repository.dart';
import 'package:team_project/src/presentation/leaderboard/screen/leaderboard_screen.dart';
import 'package:team_project/src/presentation/my_learning/screen/my_learning_screen.dart';
import 'package:team_project/src/presentation/profile/screen/profile_screen.dart';

class HomeController extends BaseController {
  int navBarIndex = 0;
  FocusNode searchFocus = FocusNode();
  final HomeRepository _repository = HomeRepository();
  List<AllSubjectsResponse>? subjects;

  @override
  Future<void> onReady()async {
    super.onReady();
    setLoading(true);
    await getAllSubjects();
    setLoading(false);
  }

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

  Future<void> getAllSubjects() async {
    subjects = await _repository.getAllSubjects();
    update();
  }
}
