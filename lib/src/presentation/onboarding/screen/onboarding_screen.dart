// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:team_project/src/presentation/onboarding/controller/onboarding_controller.dart';
import 'package:team_project/src/utils/app_colors.dart';
import 'package:team_project/src/utils/app_text_styles.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingController>(
      builder: (ctr) {
        return Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: SvgPicture.asset(
                'assets/svg/ic_logo_text.svg',
                color: AppColors.assets,
              ),
            ),
            automaticallyImplyLeading: false,
            actions: [
              TextButton(
                onPressed: () {
                  ctr.localSource.setIntroStatus(true);
                  ctr.goToNextPage();
                },
                child: Text(
                  'skip'.tr,
                  style: AppTextStyles.skipButtonTextStyle,
                ),
              ),
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: GetPlatform.isAndroid
                    ? (2 * Get.height / 3 - 55)
                    : (2 * Get.height / 3 - 110),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: PageView.builder(
                    itemCount: 3,
                    onPageChanged: ctr.changeScene,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (_, i) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Image.asset('assets/jpg/scene${i + 1}.png'),
                      );
                    },
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                height: GetPlatform.isAndroid
                    ? Get.height / 3 - 32
                    : Get.height / 3 - 16,
                width: Get.width,
                decoration: const BoxDecoration(color: AppColors.assets),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Text(
                        'feature${ctr.sceneIndex + 1}_title'.tr,
                        style: AppTextStyles.onboardingSceneText
                            .copyWith(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Text(
                      'feature${ctr.sceneIndex + 1}'.tr,
                      style: AppTextStyles.onboardingSceneText,
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: ctr.sceneIndex != 2
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        if (ctr.sceneIndex == 2) const Spacer(),
                        SizedBox(
                          width: 161,
                          height: GetPlatform.isAndroid ? 40 : 100,
                          child: Center(
                            child: ListView.separated(
                              itemCount: 3,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (_, i) => CircleAvatar(
                                radius: 4,
                                backgroundColor: i == ctr.sceneIndex
                                    ? Colors.white
                                    : AppColors.middleGrey,
                              ),
                              separatorBuilder: (_, i) =>
                                  const SizedBox(width: 8),
                            ),
                          ),
                        ),
                        if (ctr.sceneIndex == 2)
                          TextButton(
                            onPressed: () {
                              ctr.localSource.setIntroStatus(true);
                              ctr.goToNextPage();
                            },
                            child: Text(
                              'continue'.tr,
                              style: AppTextStyles.skipButtonTextStyle
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
