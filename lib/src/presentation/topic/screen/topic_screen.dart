import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:team_project/src/utils/app_colors.dart';
import 'package:team_project/src/utils/app_text_styles.dart';

class TopicScreen extends StatelessWidget {
  const TopicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                systemOverlayStyle:
                const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
                iconTheme: const IconThemeData(color: Colors.white),
                actions: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset('assets/svg/ic_coin.svg'),
                        Text(
                          '350k'.tr,
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
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: SizedBox(
          height: Get.height * 0.8,
          child: ListView.separated(
            itemCount: 6,
            itemBuilder: (_, i) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Title',
                            style: AppTextStyles.sectionTitleStyle,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon:
                                SvgPicture.asset('assets/svg/ic_bookmark.svg'),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'Choroid. Layer containing blood vessels that lines the back of the eye and is located between the retina (the inner light-sensitive layer) and the sclera (the outer white eye wall). Ciliary Body. Structure containing muscle and is located behind the iris, which focuses the lens',
                      ),
                    ),
                    const Divider(height: 0),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset('assets/svg/ic_image.svg'),
                              const Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Text(
                                  'Title (Image)',
                                  style: AppTextStyles.sectionFeatureTitleStyle,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              SvgPicture.asset('assets/svg/ic_video.svg'),
                              const Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Text(
                                  'Title (Video)',
                                  style: AppTextStyles.sectionFeatureTitleStyle,
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
            separatorBuilder: (_, i) => const SizedBox(height: 16),
          ),
        ),
      ),
    );
  }
}
