import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:team_project/src/presentation/quiz/controller/quiz_controller.dart';
import 'package:team_project/src/presentation/quiz/widgets/finish_dialog.dart';
import 'package:team_project/src/utils/app_colors.dart';
import 'package:team_project/src/utils/app_text_styles.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizController>(
      builder: (ctr) {
        return Scaffold(
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
              'Test',
              style:
                  AppTextStyles.appBarTextStyle.copyWith(color: Colors.white),
            ),
          ),
          bottomNavigationBar: Container(
            height: GetPlatform.isAndroid ? 96 : 84,
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(color: Colors.black.withOpacity(0.6), blurRadius: 5),
              ],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: IconButton(
                      onPressed: () =>
                          ctr.changeQuestion(ctr.currentQuestionIndex - 1),
                      icon: const Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.white,
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(AppColors.assets),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    child: ElevatedButton(
                      onPressed: ctr.selectedOptionIndex.contains(5)
                          ? null
                          : () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return const FinishDialog();
                                },
                              );
                            },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        elevation: MaterialStateProperty.all<double>(0),
                        side: MaterialStateProperty.all<BorderSide>(
                          BorderSide(
                            color: ctr.selectedOptionIndex.contains(5)
                                ? AppColors.whiteShade6
                                : AppColors.assets,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'Yakunlash',
                          style: AppTextStyles.submitTextStyle.copyWith(
                            color: ctr.selectedOptionIndex.contains(5)
                                ? AppColors.whiteShade6
                                : null,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: IconButton(
                      onPressed: () =>
                          ctr.changeQuestion(ctr.currentQuestionIndex + 1),
                      icon: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white,
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(AppColors.assets),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16)
                    .copyWith(top: 32, bottom: 8),
                child: SizedBox(
                  height: 80,
                  child: ListView.separated(
                    itemCount: ctr.quiz.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, i) {
                      return GestureDetector(
                        onTap: () => ctr.changeQuestion(i),
                        child: Container(
                          width: (Get.width - 96) / 5,
                          height: (Get.width - 96) / 5,
                          decoration: BoxDecoration(
                            color: ctr.currentQuestionIndex != i
                                ? AppColors.whiteShade6
                                : null,
                            gradient: ctr.currentQuestionIndex == i
                                ? const LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      AppColors.gradient1,
                                      AppColors.gradient2
                                    ],
                                  )
                                : null,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              '${i + 1}',
                              style: AppTextStyles.quizIndexTextStyle,
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (_, i) => const SizedBox(width: 16),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  height: 2,
                  child: ListView.separated(
                    itemCount: ctr.quiz.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (_, i) {
                      return Container(
                        height: 2,
                        width: (Get.width - 96) / 5,
                        decoration: BoxDecoration(
                          color: ctr.currentQuestionIndex != i
                              ? AppColors.whiteShade6
                              : Colors.black,
                          gradient: i == ctr.currentQuestionIndex
                              ? const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    AppColors.gradient1,
                                    AppColors.gradient2,
                                  ],
                                )
                              : null,
                        ),
                      );
                    },
                    separatorBuilder: (_, i) =>
                        Container(width: 16, color: AppColors.whiteShade6),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  ctr.quiz[ctr.currentQuestionIndex].question,
                  style: AppTextStyles.quizQuestionTextStyle,
                ),
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, i) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: InkWell(
                      onTap: () => ctr.selectAnswer(i),
                      borderRadius: BorderRadius.circular(8),
                      child: Row(
                        children: [
                          Container(
                            width: (Get.width - 96) / 6,
                            height: (Get.width - 96) / 6,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              color: ctr.selectedOptionIndex[
                                          ctr.currentQuestionIndex] !=
                                      i
                                  ? AppColors.whiteShade6
                                  : null,
                              gradient: ctr.selectedOptionIndex[
                                          ctr.currentQuestionIndex] ==
                                      i
                                  ? const LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        AppColors.gradient1,
                                        AppColors.gradient2
                                      ],
                                    )
                                  : null,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                ctr.options[i],
                                style: AppTextStyles.quizIndexTextStyle,
                              ),
                            ),
                          ),
                          Text(
                            ctr.quiz[ctr.currentQuestionIndex].options[i],
                            style: AppTextStyles.optionTextStyle.copyWith(
                              color: ctr.selectedOptionIndex[
                                          ctr.currentQuestionIndex] ==
                                      i
                                  ? AppColors.assets
                                  : null,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (_, i) => const SizedBox(height: 16),
                itemCount: ctr.quiz[ctr.currentQuestionIndex].options.length,
              ),
            ],
          ),
        );
      },
    );
  }
}
