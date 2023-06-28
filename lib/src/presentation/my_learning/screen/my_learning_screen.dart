// ignore_for_file: deprecated_member_use
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:team_project/src/config/app_routes.dart';
import 'package:team_project/src/core/widgets/subject_card.dart';
import 'package:team_project/src/presentation/my_learning/controller/my_learning_controller.dart';
import 'package:team_project/src/utils/app_colors.dart';
import 'package:team_project/src/utils/app_text_styles.dart';

class MyLearningScreen extends StatelessWidget {
  const MyLearningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyLearningController>(
      builder: (ctr) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: GetPlatform.isAndroid? 16:0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      SvgPicture.asset(
                        'assets/svg/ic_home_card.svg',
                        width: Get.width,
                      ),
                      Positioned(
                        top: 28,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'quote_of_the_day'.tr,
                              style: AppTextStyles.helloCardTextStyle,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 16, bottom: 10),
                              child: Text(
                                '"No pain, no gain!"',
                                style: AppTextStyles.quoteTextStyle,
                              ),
                            ),
                            const Text(
                              '- Sardorbek Abdulabbozov',
                              style: AppTextStyles.quoteAuthorTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
                  child: Text(
                    'my_subjects'.tr,
                    style: AppTextStyles.sectionNameTextStyle,
                  ),
                ),
                SizedBox(
                  height: 6.2 * (Get.width - 48) / 9 + 12,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: ctr.mySubjects.length,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          left: index == 0 ? 16 : 0,
                          right: index == ctr.mySubjects.length - 1 ? 16 : 0,
                          bottom: 16,
                        ),
                        child: SubjectCard(
                          onTap: () {
                            Get.toNamed(AppRoutes.subject,
                                arguments: ctr.mySubjects[index].title);
                          },
                          title: ctr.mySubjects[index].title,
                          topicsCount:
                              ctr.mySubjects[index].numberOfTopics.toString(),
                          image: ctr.mySubjects[index].image,
                        ),
                      );
                    },
                    separatorBuilder: (_, i) => const SizedBox(width: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
                  child: Text(
                    'suggested_topics'.tr,
                    style: AppTextStyles.sectionNameTextStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: List.generate(
                      ctr.suggestedTopics.length,
                      (index) {
                        int colorIndex = Random().nextInt(ctr.colors.length);
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Material(
                            borderRadius: BorderRadius.circular(16),
                            elevation: 5,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: SizedBox(
                                width: Get.width,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              ctr.suggestedTopics[index].title),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              SizedBox(
                                                width: Get.width / 4,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Chip(
                                                      backgroundColor: ctr
                                                          .colors[colorIndex]
                                                          .withOpacity(0.1),
                                                      label: Text(
                                                        ctr
                                                            .suggestedTopics[
                                                                index]
                                                            .subject,
                                                        style: AppTextStyles
                                                            .chipTextStyle
                                                            .copyWith(
                                                          color: ctr.colors[
                                                              colorIndex],
                                                        ),
                                                      ),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                      ),
                                                      // backgroundColor: AppColors.,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(4),
                                                child: SvgPicture.asset(
                                                  'assets/svg/ic_members.svg',
                                                  color: AppColors.middleGrey,
                                                  height: 16,
                                                  width: 16,
                                                ),
                                              ),
                                              Text(
                                                '${ctr.suggestedTopics[index].numberOfLearners} ${'learners'.tr}',
                                                style: AppTextStyles
                                                    .learnersCountTextStyle,
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 50,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: List.generate(
                                          ctr.suggestedTopics[index].features
                                              .length,
                                          (i) {
                                            return Padding(
                                              padding: EdgeInsets.only(
                                                right: i == 0 ? 4 : 0,
                                              ),
                                              child: Material(
                                                elevation: 5,
                                                shape: const CircleBorder(),
                                                child: CircleAvatar(
                                                  backgroundColor: ctr
                                                              .suggestedTopics[
                                                                  index]
                                                              .features[i] ==
                                                          '3D'
                                                      ? Colors.redAccent
                                                      : Colors.orangeAccent,
                                                  radius: 18,
                                                  child: Text(
                                                    ctr.suggestedTopics[index]
                                                        .features[i],
                                                    style: AppTextStyles
                                                        .circleFeaturesTextStyle,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                /*SizedBox(
                  height: 500,
                  width: Get.width,
                  child: ModelViewer(
                    src: 'assets/3d/Flexing_arm.glb',
                    ar: true,
                    autoPlay: true,
                    autoRotate: true,
                    cameraControls: true,
                  ),
                )*/
              ],
            ),
          ),
        );
      },
    );
  }
}
