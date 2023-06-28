class SuggestedTopic {
  final String title;
  final String subject;
  final int numberOfLearners;
  List<String> features;

  SuggestedTopic({
    required this.title,
    required this.subject,
    required this.numberOfLearners,
    required this.features,
  });
}
