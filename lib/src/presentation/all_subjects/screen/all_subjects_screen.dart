import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team_project/src/config/app_routes.dart';
import 'package:team_project/src/core/widgets/subject_card.dart';
import 'package:team_project/src/utils/app_constants.dart';
import 'package:team_project/src/utils/app_text_styles.dart';

class AllSubjectsScreen extends StatelessWidget {
  const AllSubjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'subjects'.tr,
          style: AppTextStyles.appBarTextStyle,
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 16),
        itemCount: AppConstants.availableSubjects.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio:
              ((Get.width - 48) / 2) / (6.2 * (Get.width - 48) / 9),
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        itemBuilder: (_, i) {
          return SubjectCard(
            onTap: () {
              Get.toNamed(
                AppRoutes.subject,
                arguments: AppConstants.availableSubjects[i].title,
              );
            },
            title: AppConstants.availableSubjects[i].title,
            topicsCount:
                AppConstants.availableSubjects[i].numberOfTopics.toString(),
            image: AppConstants.availableSubjects[i].image,
          );
        },
      ),
    );
  }
}
