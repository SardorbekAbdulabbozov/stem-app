import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:team_project/src/presentation/lesson/controller/lesson_controller.dart';
import 'package:team_project/src/utils/app_colors.dart';
import 'package:team_project/src/utils/app_text_styles.dart';

class Chatbot extends StatelessWidget {
  const Chatbot({super.key, required this.controller});

  final LessonController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Chatbot',
                      style:
                          AppTextStyles.appBarTextStyle.copyWith(fontSize: 16),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: IconButton(
                    onPressed: Get.back,
                    icon: const Icon(Icons.close_rounded),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 0),
          Expanded(
            child: controller.message.isEmpty
                ? SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 128),
                          child: SizedBox(
                            width: Get.width - 128,
                            height: Get.height / 3,
                            child: SvgPicture.asset(
                              'assets/svg/ic_chatbot_i2.svg',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 32),
                          child: Text(
                            'chatbot_intro_message'.tr,
                            style: AppTextStyles.chatbotIntroTextStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: controller.message.length,
                    // reverse: true,
                    itemBuilder: (_, i) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment:
                              controller.message[i].sender == 'bot'
                                  ? MainAxisAlignment.start
                                  : MainAxisAlignment.end,
                          children: [
                            if (controller.message[i].sender == 'bot')
                              const CircleAvatar(
                                radius: 25,
                                child: Text('Bot'),
                              ),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8)
                                  .copyWith(top: i == 0 ? 16 : 0),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(16).copyWith(
                                  bottomLeft:
                                      controller.message[i].sender == 'bot'
                                          ? const Radius.circular(0)
                                          : null,
                                  bottomRight:
                                      controller.message[i].sender == 'bot'
                                          ? null
                                          : const Radius.circular(0),
                                ),
                                color: controller.message[i].sender == 'bot'
                                    ? AppColors.chatbotIconColor2
                                    : AppColors.assets,
                              ),
                              child: Column(
                                crossAxisAlignment:
                                    controller.message[i].sender != 'bot'
                                        ? CrossAxisAlignment.end
                                        : CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.message[i].message,
                                    style:
                                        AppTextStyles.chatbotMessageTextStyle,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: Text(
                                      controller.message[i].time,
                                      style: AppTextStyles
                                          .chatbotMessageTextStyle
                                          .copyWith(
                                        color: controller.message[i].sender ==
                                                'bot'
                                            ? AppColors.whiteShade5
                                            : AppColors.lightGrey,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (controller.message[i].sender == 'you')
                              const CircleAvatar(
                                radius: 25,
                                child: Text(
                                  // '${controller.localSource.getUserDetails().firstName.substring(0, 1)}${controller.localSource.getUserDetails().lastName.substring(0, 1)}'),
                                  'SA',
                                ),
                              ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
          Container(
            width: Get.width,
            height: kToolbarHeight,
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
              border: Border.all(
                color: AppColors.chatbotIconColor1,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'ask_a_question'.tr,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                        ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                        ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                        ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                    cursorColor: AppColors.assets,
                  ),
                ),
                const VerticalDivider(
                  width: 0,
                  color: AppColors.assets,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.send_rounded,
                    color: AppColors.assets,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
