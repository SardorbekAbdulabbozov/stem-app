import 'package:team_project/src/core/controller/base_controller.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LessonController extends BaseController {
  late YoutubePlayerController controller;

  @override
  void onInit() {
    super.onInit();
    controller = YoutubePlayerController(
      initialVideoId: 'nbwPPcwknPU',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        useHybridComposition: false,
      ),
    );
  }

  List<ChatMessage> message = List.generate(
    7,
    (index) => ChatMessage(
      sender: index % 2 == 0 ? 'you' : 'bot',
      time:
          '${DateTime.now().hour < 10 ? '0${DateTime.now().hour}' : '${DateTime.now().hour}'}:${DateTime.now().minute < 10 ? '0${DateTime.now().minute}' : '${DateTime.now().minute}'}',
      message: 'Uzbekistan',
    ),
  );
}

class ChatMessage {
  final String sender;
  final String time;
  final String message;

  ChatMessage({
    required this.sender,
    required this.time,
    required this.message,
  });
}
