import 'package:flutter/material.dart';
import 'package:team_project/src/core/controller/base_controller.dart';
import 'package:team_project/src/data/models/subject_model.dart';
import 'package:team_project/src/data/models/suggested_topic_model.dart';

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

  List<SubjectModel> mySubjects = [
    SubjectModel(title: 'Astronomy', numberOfTopics: 14, image: 'astronomy'),
    SubjectModel(title: 'Biology', numberOfTopics: 20, image: 'biology'),
  ];

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