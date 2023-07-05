import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:team_project/src/config/app_routes.dart';
import 'package:team_project/src/presentation/subject/controller/subject_controller.dart';
import 'package:team_project/src/presentation/subject/widgets/subject_dialog.dart';
import 'package:team_project/src/utils/app_colors.dart';
import 'package:team_project/src/utils/app_text_styles.dart';

class SubjectScreen extends StatelessWidget {
  const SubjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubjectController>(
      builder: (ctr) {
        ctr.setTitle(Get.arguments is String ? (Get.arguments as String) : '');
        return ModalProgressHUD(
          inAsyncCall: ctr.isLoading,
          blur: 1,
          color: Colors.white,
          child: Scaffold(
            backgroundColor: AppColors.whiteShade2,
            appBar: AppBar(
              centerTitle: true,
              toolbarHeight: 65,
              backgroundColor: AppColors.assets,
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarBrightness: Brightness.dark,
                statusBarColor: AppColors.assets,
                statusBarIconBrightness: Brightness.light,
              ),
              iconTheme: const IconThemeData(color: Colors.white),
              flexibleSpace: Stack(
                alignment: Alignment.centerRight,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 32),
                    decoration: const BoxDecoration(color: AppColors.assets),
                  ),
                  Positioned(
                    top: 28,
                    child: SvgPicture.asset('assets/svg/ic_circle.svg'),
                  ),
                ],
              ),
              title: Text(
                ctr.title,
                style:
                    AppTextStyles.appBarTextStyle.copyWith(color: Colors.white),
              ),
            ),
            body: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox(
                  height: Get.height - 65,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: ListView.separated(
                      itemBuilder: (_, i) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Material(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(20),
                              onTap: () {
                                if (!ctr.localSource
                                    .getEnrolledSubjects()
                                    .contains(Get.arguments is String
                                        ? (Get.arguments as String)
                                        : '')) {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return SubjectDialog(
                                        message:
                                            '${ctr.title} mavzularini ko`rish uchun ro`yxatdan o`ting!',
                                        title: 'Iltimos!',
                                      );
                                    },
                                  );
                                } else {
                                  Get.toNamed(
                                    AppRoutes.topic,
                                    arguments: [
                                      Get.arguments is String
                                          ? (Get.arguments as String)
                                          : '',
                                      ctr.topics[i].title,
                                    ],
                                  );
                                }
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          ctr.topics[i].title,
                                          style:
                                              AppTextStyles.topicTitleTextStyle,
                                        ),
                                        const Icon(
                                            Icons.arrow_forward_ios_rounded),
                                      ],
                                    ),
                                  ),
                                  const Divider(height: 0),
                                  Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: List.generate(
                                        ctr.topics[i].sections.length,
                                        (index) => Text(
                                          ctr.topics[i].sections[index],
                                          style: AppTextStyles
                                              .sectionTitleTextStyle,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (_, index) => const SizedBox(height: 8),
                      itemCount: ctr.topics.length,
                    ),
                  ),
                ),
                Visibility(
                  visible: !ctr.isEnrolled,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16)
                        .copyWith(bottom: 16),
                    child: SizedBox(
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () async {
                          await ctr.enroll();
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              AppColors.assets),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                        child: const Text(
                          'O`rganishni boshlash',
                          style: AppTextStyles.enrollButtonTextStyle,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
