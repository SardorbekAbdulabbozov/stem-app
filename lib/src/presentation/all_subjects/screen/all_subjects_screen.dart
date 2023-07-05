import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:team_project/src/config/app_routes.dart';
import 'package:team_project/src/core/widgets/subject_card.dart';
import 'package:team_project/src/presentation/all_subjects/controller/all_subjects_controller.dart';
import 'package:team_project/src/utils/app_text_styles.dart';

class AllSubjectsScreen extends StatelessWidget {
  const AllSubjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllSubjectsController>(
      builder: (ctr) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'subjects'.tr,
              style: AppTextStyles.appBarTextStyle,
            ),
          ),
          body: ModalProgressHUD(
            inAsyncCall: ctr.isLoading,
            blur: 1,
            color: Colors.white,
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16)
                  .copyWith(bottom: 16),
              itemCount: ctr.subjects?.length ?? 0,
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
                    if ((ctr.subjects?[i].topicCount ?? 0) == 0) {
                      return;
                    } else {
                      Get.toNamed(
                        AppRoutes.subject,
                        arguments: ctr.subjects?[i].subjectNameUz ?? '',
                      );
                    }
                  },
                  title: ctr.subjects?[i].subjectNameUz ?? '',
                  topicsCount: (ctr.subjects?[i].topicCount ?? 0).toString(),
                  image: (ctr.subjects?[i].subjectNameEn ?? '').toLowerCase(),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
