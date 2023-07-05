import 'package:get/get.dart';
import 'package:team_project/src/core/controller/base_controller.dart';
import 'package:team_project/src/data/models/topic_model.dart';

class SubjectController extends BaseController {
  List<TopicModel> topics = [];
  String title = '';
  bool isEnrolled = false;
  bool hideEnrollButton = false;

  Map<String, List<TopicModel>> mapOfTopics = {
    'Biologiya': [
      TopicModel(
        title: 'Inson ko`zi',
        sections: ['Ko`z strukturasi'],
      ),
      TopicModel(
        title: 'Hujayra',
        sections: ['Inson hujayrasi'],
      ),
    ],
    'Astronomiya': [
      TopicModel(
        title: 'Quyosh tizimi',
        sections: ['Sayyoralar'],
      ),
    ],
    "Geografiya": [
      TopicModel(
        title: 'Yer sayyorasi',
        sections: ['Yer'],
      ),
    ],
  };

  @override
  Future<void> onReady() async {
    super.onReady();
    await getTopics(Get.arguments is String ? (Get.arguments as String) : '');
  }

  Future<void> getTopics(String subjectName) async {
    setLoading(true);
    await Future.delayed(
      const Duration(milliseconds: 1500),
      () async {
        topics = mapOfTopics[subjectName] ?? [];
      },
    );
    setLoading(false);
  }

  void setTitle(String title) {
    this.title = title;
    isEnrolled = localSource.getEnrolledSubjects().contains(title);
    update();
  }

  Future<void> enroll() async {
    setLoading(true);
    await localSource.enrollToSubject(title);
    setLoading(false);
    isEnrolled = false;
    update();
  }
}
