import 'package:flutter/material.dart';
import 'package:team_project/src/core/controller/base_controller.dart';
import 'package:team_project/src/data/network_models/all_subjects_response.dart';
import 'package:team_project/src/presentation/all_subjects/repository/all_subjects_repository.dart';

class AllSubjectsController extends BaseController {
  List<AllSubjectsResponse>? subjects;
  final AllSubjectsRepository _repository = AllSubjectsRepository();

  Future<void> getAllSubjects() async {
    subjects = await _repository.getAllSubjects();
    debugPrint(
        'Subjects Subjects Subjects ${subjects?.first.subjectNameEn} ${subjects?.first.subjectNameUz} ${subjects?.first.topicCount}');
    update();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    setLoading(true);
    await getAllSubjects();
    setLoading(false);
  }
}
