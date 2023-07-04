import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:team_project/src/presentation/quiz_result/controller/quiz_result_controller.dart';
import 'package:team_project/src/utils/app_colors.dart';
import 'package:team_project/src/utils/app_text_styles.dart';

class QuizResultScreen extends StatelessWidget {
  const QuizResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizResultController>(
      builder: (context) {
        return Scaffold(
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
              'Natija',
              style:
                  AppTextStyles.appBarTextStyle.copyWith(color: Colors.white),
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Card(
                  elevation: 0,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      children: [
                        Image.asset('assets/jpg/trophy.png'),
                        const SizedBox(height: 32),
                        const Text(
                          'Siz +10 tanga qo`lga kiritdingiz!',
                          style: AppTextStyles.bonusTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Text(
                'Javoblar',
                style: AppTextStyles.bonusTextStyle,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Card(
                  elevation: 0,
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                        child: ListView.separated(
                          itemBuilder: (_, i) {
                            return Center(
                              child: Text(
                                '${i + 1}',
                                style: AppTextStyles.answerIndexTextStyle,
                              ),
                            );
                          },
                          separatorBuilder: (_, i) => SizedBox(
                            width: (Get.width - 128) / 5,
                          ),
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                        ),
                      ),
                      const Divider(height: 0),
                      SizedBox(
                        height: 50,
                        child: ListView.separated(
                          itemBuilder: (_, i) {
                            return Center(
                              child: Text(
                                i % 2 == 0 ? 'T' : 'F',
                                style:
                                    AppTextStyles.answerIndexTextStyle.copyWith(
                                  color: i % 2 == 0
                                      ? AppColors.green
                                      : AppColors.red,
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (_, i) => SizedBox(
                            width: (Get.width - 128) / 5,
                          ),
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 64),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 4),
                            child: Text(
                              'To`g`ri javoblar',
                              style: AppTextStyles.answerDetails1TextStyle,
                            ),
                          ),
                          Text(
                            '3',
                            style: AppTextStyles.answerDetails2TextStyle,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 4),
                          child: Text(
                            'Noto`g`ri javoblar',
                            style: AppTextStyles.answerDetails1TextStyle,
                          ),
                        ),
                        Text(
                          '2',
                          style: AppTextStyles.answerDetails2TextStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16)
                    .copyWith(top: 16),
                child: const Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 4),
                          child: Text(
                            'Aniqlik',
                            style: AppTextStyles.answerDetails1TextStyle,
                          ),
                        ),
                        Text(
                          '60%',
                          style: AppTextStyles.answerDetails2TextStyle,
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
