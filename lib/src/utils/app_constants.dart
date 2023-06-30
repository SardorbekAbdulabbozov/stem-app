import 'package:flutter/material.dart';
import 'package:team_project/src/data/models/subject_model.dart';

class AppConstants {
  static GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>(debugLabel: "STEM");

  static final bRadius16 = BorderRadius.circular(16);

  static List<SubjectModel> availableSubjects = [
    SubjectModel(title: 'Astronomy', numberOfTopics: 14, image: 'astronomy'),
    SubjectModel(title: 'Biology', numberOfTopics: 20, image: 'biology'),
    SubjectModel(title: 'Chemistry', numberOfTopics: 2, image: 'chemistry'),
    SubjectModel(title: 'Math', numberOfTopics: 7, image: 'math'),
    SubjectModel(title: 'Physics', numberOfTopics: 1, image: 'physics'),
  ];

  static const baseURL = 'https://stem-production.up.railway.app/api/v1/';

  static const hasProfile = 'hasProfile';
  static const firstName = 'firstName';
  static const lastName = 'lastName';
  static const username = 'username';
  static const introStatus = 'introStatus';
}

