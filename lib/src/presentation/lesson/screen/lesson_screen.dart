// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:team_project/src/config/app_routes.dart';
import 'package:team_project/src/presentation/lesson/controller/lesson_controller.dart';
import 'package:team_project/src/presentation/lesson/widgets/chatbot.dart';
import 'package:team_project/src/utils/app_colors.dart';
import 'package:team_project/src/utils/app_text_styles.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

final scaffoldState = GlobalKey<ScaffoldState>();

class LessonScreen extends StatelessWidget {
  const LessonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LessonController>(
      builder: (ctr) {
        return Scaffold(
          key: scaffoldState,
          appBar: AppBar(
            toolbarHeight: 64,
            backgroundColor: AppColors.assets,
            iconTheme: const IconThemeData(color: Colors.white),
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: AppColors.assets,
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.dark,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child: IconButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.model,arguments: ctr.model);
                  },
                  icon: SvgPicture.asset(
                    'assets/svg/ic_3d.svg',
                    color: Colors.white,
                    height: 48,
                    width: 48,
                  ),
                ),
              ),
            ],
            centerTitle: true,
            title: Text(
              (Get.arguments is List<String>
                      ? (Get.arguments as List<String>)
                      : [])
                  .first,
              style:
                  AppTextStyles.appBarTextStyle.copyWith(color: Colors.white),
            ),
          ),
          body: Stack(
            alignment: Alignment.bottomRight,
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Text(
                              ctr.title,
                              style: AppTextStyles.lessonTextStyle.copyWith(
                                  fontWeight: FontWeight.w700, fontSize: 20),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                          Text(
                            ctr.fullInfo,
                            style: AppTextStyles.lessonTextStyle,
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                    if (ctr.image.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Text(
                                'Rasm 1'.tr,
                                style: AppTextStyles.lessonTextStyle.copyWith(
                                    fontWeight: FontWeight.w700, fontSize: 20),
                              ),
                            ),
                            CachedNetworkImage(
                              imageUrl: ctr.image,
                            ),
                          ],
                        ),
                      ),
                    if (ctr.args[3].isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Video'.tr,
                              style: AppTextStyles.lessonTextStyle.copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: YoutubePlayer(
                                width: Get.width,
                                controller: ctr.controller,
                                aspectRatio: 16 / 9,
                                actionsPadding: const EdgeInsets.all(16),
                                progressColors: const ProgressBarColors(
                                  playedColor: AppColors.assets,
                                  handleColor: AppColors.assets,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              Positioned(
                right: 16,
                bottom: 16,
                child: SizedBox(
                  width: 70,
                  height: 70,
                  child: FloatingActionButton(
                    onPressed: () {
                      scaffoldState.currentState?.showBottomSheet(
                        (context) {
                          return Chatbot(
                            controller: ctr,
                          );
                        },
                        constraints: BoxConstraints(
                          maxHeight: Get.height - 56,
                          maxWidth: Get.width,
                        ),
                        elevation: 0,
                        enableDrag: false,
                        backgroundColor: Colors.white,
                        shape: const ContinuousRectangleBorder(),
                      );
                    },
                    shape: const CircleBorder(),
                    backgroundColor: AppColors.chatbotIconColor2,
                    child: SvgPicture.asset(
                      'assets/svg/ic_chatbot.svg',
                      color: AppColors.chatbotIconColor1,
                      height: 48,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
