import 'package:team_project/src/core/controller/base_controller.dart';
import 'package:team_project/src/data/models/topic_model.dart';

class SubjectController extends BaseController {
  final List<TopicModel> topics = [
    TopicModel(
      title: 'Introduction',
      sections: [
        'Welcome to Biology',
        'Overview: Biology',
      ],
    ),
    TopicModel(
      title: 'Human Anatomy',
      sections: [
        'Eye',
        'Brain',
        'Body',
      ],
    ),
    TopicModel(
      title: 'Plants and their structure',
      sections: [
        'Overview: Plant',
        'Structure and family of plants, trees and etc.',
      ],
    ),
  ];
}
