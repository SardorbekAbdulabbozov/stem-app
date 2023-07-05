import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:team_project/src/config/app_routes.dart';
import 'package:team_project/src/presentation/topic/controller/topic_controller.dart';
import 'package:team_project/src/utils/app_colors.dart';
import 'package:team_project/src/utils/app_text_styles.dart';

class TopicScreen extends StatelessWidget {
  const TopicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TopicController>(
      builder: (ctr) {
        return ModalProgressHUD(
          inAsyncCall: ctr.isLoading,
          color: Colors.white,
          blur: 1,
          child: Scaffold(
            backgroundColor: AppColors.whiteShade2,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(Get.height * 0.2),
              child: Container(
                color: AppColors.assets,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppBar(
                      backgroundColor: AppColors.assets,
                      systemOverlayStyle: const SystemUiOverlayStyle(
                          statusBarBrightness: Brightness.dark),
                      iconTheme: const IconThemeData(color: Colors.white),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset('assets/svg/ic_coin.svg'),
                              Text(
                                '${ctr.localSource.getUserCoins()}'.tr,
                                style: AppTextStyles.coinTextStyle
                                    .copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, bottom: 16),
                      child: Text(
                        Get.arguments is List<String>
                            ? (Get.arguments as List<String>).first
                            : '',
                        style: AppTextStyles.topicScreenSubjectTitleTextStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(
                        Get.arguments is List<String>
                            ? (Get.arguments as List<String>).last
                            : '',
                        style: AppTextStyles.topicScreenTitleTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16)
                  .copyWith(bottom: 16),
              child: SizedBox(
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.quiz);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(AppColors.assets),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Test topshirish',
                    style: AppTextStyles.enrollButtonTextStyle,
                  ),
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: SizedBox(
                height: Get.height * 0.8,
                child: ListView.separated(
                  itemCount: ctr.sections.length,
                  itemBuilder: (_, i) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Material(
                        borderRadius: BorderRadius.circular(20),
                        child: InkWell(
                          onTap: () {
                            Get.toNamed(
                              AppRoutes.lesson,
                              arguments: [
                                ctr.sections[i].title,
                                ctr.sections[i].fullInfo,
                                ctr.sections[i].image,
                                ctr.sections[i].video,
                                ctr.sections[i].model,
                              ],
                            );
                          },
                          borderRadius: BorderRadius.circular(20),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16)
                                        .copyWith(top: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      ctr.sections[i].title,
                                      style: AppTextStyles.sectionTitleStyle,
                                    ),
                                    Visibility(
                                      visible: false,
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: SvgPicture.asset(
                                          'assets/svg/ic_bookmark.svg',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: Text(
                                  ctr.sections[i].info,
                                  style: AppTextStyles.topicBriefTextStyle,
                                ),
                              ),
                              const Divider(height: 0),
                              if (ctr.sections[i].features.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/svg/ic_${ctr.sections[i].features.isNotEmpty ? ctr.sections[i].features.first : 'image'}.svg',
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 16),
                                            child: Text(
                                              ctr.sections[i].features.first,
                                              style: AppTextStyles
                                                  .sectionFeatureTitleStyle,
                                            ),
                                          ),
                                        ],
                                      ),
                                      if (ctr.sections[i].features.length == 2)
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 16, bottom: 4),
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/svg/ic_${ctr.sections[i].features.isNotEmpty ? ctr.sections[i].features.last : "video"}.svg'),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 16),
                                                child: Text(
                                                  ctr.sections[i].features.last,
                                                  style: AppTextStyles
                                                      .sectionFeatureTitleStyle,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (_, i) => const SizedBox(height: 16),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
