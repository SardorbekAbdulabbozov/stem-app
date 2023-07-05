// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team_project/src/core/controller/base_controller.dart';
import 'package:team_project/src/data/models/suggested_topic_model.dart';
import 'package:team_project/src/data/network_models/all_subjects_response.dart';
import 'package:team_project/src/presentation/home/controller/home_controller.dart';

class MyLearningController extends BaseController {
  List<Color> colors = [
    Colors.red,
    Colors.deepPurpleAccent,
    Colors.orange,
    Colors.green,
    Colors.purpleAccent,
    Colors.pink,
    Colors.blueAccent,
    Colors.brown,
  ];

  List<AllSubjectsResponse> mySubjects = [];

  @override
  void onReady() {
    super.onReady();
    List<String> mySubjectNames = localSource.getEnrolledSubjects();
    var homeController = Get.find<HomeController>();
    mySubjectNames.forEach((subject) {
      AllSubjectsResponse subj = homeController.subjects
              ?.firstWhere((element) => element.subjectNameUz == subject) ??
          AllSubjectsResponse();
      mySubjects.add(subj);
    });
    update();
  }

  List<SuggestedTopic> suggestedTopics = [
    SuggestedTopic(
      title: 'Human Eye',
      subject: 'Biology',
      numberOfLearners: 100,
      features: ['3D'],
    ),
    SuggestedTopic(
      title: 'Earth',
      subject: 'Astronomy',
      numberOfLearners: 57,
      features: ['3D'],
    ),
  ];
}
