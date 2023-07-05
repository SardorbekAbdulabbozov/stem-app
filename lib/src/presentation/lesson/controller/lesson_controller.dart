import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team_project/src/core/controller/base_controller.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LessonController extends BaseController {
  late YoutubePlayerController controller;
  List<String> args = [];
  String title = '';
  String fullInfo = '';
  String model = '';
  String image = '';

  @override
  void onInit() {
    super.onInit();
    args = Get.arguments is List<String> ? (Get.arguments as List<String>) : [];
    debugPrint("::::: $args");
    controller = YoutubePlayerController(
      initialVideoId: args[3],
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        useHybridComposition: false,
      ),
    );
  }

  @override
  void onReady() {
    super.onReady();
    title = args.first;
    fullInfo = args[1];
    image = args[2];
    model = args[4];
    update();
  }

  List<ChatMessage> message = List.generate(
    0,
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
