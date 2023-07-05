import 'package:team_project/src/data/network_models/all_subjects_response.dart';

class HomeRepository {

  Future<List<AllSubjectsResponse>> getAllSubjects() async {
    List<AllSubjectsResponse> result = [];
    await Future.delayed(
      const Duration(milliseconds: 1500),
      () {
        result = [
          AllSubjectsResponse(
            subjectNameUz: 'Biologiya',
            subjectNameEn: 'Biology',
            topicCount: 2,
          ),
          AllSubjectsResponse(
            subjectNameUz: 'Geografiya',
            subjectNameEn: 'Geography',
            topicCount: 1,
          ),
          AllSubjectsResponse(
            subjectNameUz: 'Astronomiya',
            subjectNameEn: 'Astronomy',
            topicCount: 1,
          ),
          AllSubjectsResponse(
            subjectNameUz: 'Matematika',
            subjectNameEn: 'Math',
            topicCount: 0,
          ),
          AllSubjectsResponse(
            subjectNameUz: 'Fizika',
            subjectNameEn: 'Physics',
            topicCount: 0,
          ),
        ];
      },
    );
    return result;
  }
}
