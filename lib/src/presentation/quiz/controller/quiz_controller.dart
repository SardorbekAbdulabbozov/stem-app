import 'package:team_project/src/core/controller/base_controller.dart';

class QuizController extends BaseController {
  List<int> selectedOptionIndex = [5, 5, 5, 5, 5];
  int currentQuestionIndex = 0;

  final List<String> options = ['A', 'B', 'C', 'D'];

  final List<Question> quiz = List.generate(
    5,
    (index) => Question(
      question: 'What is my age? $index',
      options: [
        '${15 + index}',
        '${17 + index}',
        '${5 + index}',
        '${21 + index}',
      ],
      correctAnswer: '${21 + index}',
    ),
  );

  void selectAnswer(int index) {
    selectedOptionIndex[currentQuestionIndex] = index;
    update();
  }

  void changeQuestion(int index) {
    if (index < 0 || index > 4) return;
    currentQuestionIndex = index;
    update();
  }
}

class Question {
  final String question;
  final List<String> options;
  final String correctAnswer;

  Question(
      {required this.question,
      required this.options,
      required this.correctAnswer});
}
