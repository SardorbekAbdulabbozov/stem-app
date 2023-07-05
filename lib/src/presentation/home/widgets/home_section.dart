// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:team_project/src/config/app_routes.dart';
import 'package:team_project/src/core/widgets/subject_card.dart';
import 'package:team_project/src/presentation/home/widgets/continue_learning_widget.dart';
import 'package:team_project/src/presentation/home/widgets/goal_pie_chart.dart';
import 'package:team_project/src/presentation/home/controller/home_controller.dart';
import 'package:team_project/src/presentation/home/widgets/streak_widget.dart';
import 'package:team_project/src/utils/app_colors.dart';
import 'package:team_project/src/utils/app_text_styles.dart';

class HomeSection extends StatelessWidget {
  final HomeController ctr;

  const HomeSection({super.key, required this.ctr});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: GetPlatform.isAndroid ? 16 : 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Stack(
                children: [
                  SvgPicture.asset(
                    'assets/svg/ic_home_card.svg',
                    width: Get.width,
                  ),
                  Positioned(
                    top: 26,
                    left: 26,
                    child: RichText(
                      text: TextSpan(
                        text: '${'hello'.tr}\n',
                        style: AppTextStyles.helloCardTextStyle,
                        children: [
                          TextSpan(
                            text:
                                '${ctr.localSource.getUserDetails().firstName} ${ctr.localSource.getUserDetails().lastName}',
                            style: AppTextStyles.helloCardUsernameTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: false,
                    child: Positioned(
                      bottom: 28,
                      child: Container(
                        width: Get.width - 32,
                        height: 32,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 26,
                        ),
                        child: TextField(
                          style: AppTextStyles.searchFieldTextStyle,
                          maxLines: 1,
                          focusNode: ctr.searchFocus,
                          cursorColor: AppColors.assets,
                          decoration: InputDecoration(
                            filled: true,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              child: SvgPicture.asset(
                                'assets/svg/ic_search.svg',
                                color: AppColors.grey,
                              ),
                            ),
                            hintText: 'search'.tr,
                            hintStyle: AppTextStyles.searchFieldTextStyle
                                .copyWith(height: 0.5),
                            fillColor: AppColors.background,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 0,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            if (ctr.subjects?.isNotEmpty ?? false)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'explore'.tr,
                      style: AppTextStyles.sectionNameTextStyle,
                    ),
                    TextButton(
                      child: Text(
                        'view_all'.tr,
                        style:
                            AppTextStyles.viewAllSubjectsTextStyle.copyWith(),
                      ),
                      onPressed: () {
                        Get.toNamed(AppRoutes.allSubjects);
                      },
                    ),
                  ],
                ),
              ),
            if (ctr.subjects?.isNotEmpty ?? false)
              SizedBox(
                height: 6.2 * (Get.width - 48) / 9 + 12,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        left: index == 0 ? 16 : 0,
                        right: index == 2 ? 16 : 0,
                        bottom: 16,
                      ),
                      child: SubjectCard(
                        onTap: () {
                          Get.toNamed(
                            AppRoutes.subject,
                            arguments: ctr.subjects?[index].subjectNameUz,
                          );
                        },
                        title: ctr.subjects?[index].subjectNameUz ?? '',
                        topicsCount:
                            (ctr.subjects?[index].topicCount ?? 0).toString(),
                        image: (ctr.subjects?[index].subjectNameEn ?? '')
                            .toLowerCase(),
                      ),
                    );
                  },
                  separatorBuilder: (_, i) => const SizedBox(width: 16),
                ),
              ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'streaks'.tr,
                    style: AppTextStyles.sectionNameTextStyle,
                  ),
                  const Visibility(
                    visible: false,
                    child: Padding(
                      padding: EdgeInsets.only(left: 4, top: 6),
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.black,
                        size: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const StreakWidget(streakText: '0/7', percentage: 0 / 7),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
              child: Text(
                'continue_learning'.tr,
                style: AppTextStyles.sectionNameTextStyle,
              ),
            ),
            const ContinueLearning(
              subject: 'Biology',
              part: 'Anatomy',
              topic: 'Brain',
              percentage: 50,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
              child: Text(
                'progress'.tr,
                style: AppTextStyles.sectionNameTextStyle,
              ),
            ),
            const GoalPieChart(
              percentages: {'Biology': 95, 'Astronomy': 43},
            ),
          ],
        ),
      ),
    );
  }
}
