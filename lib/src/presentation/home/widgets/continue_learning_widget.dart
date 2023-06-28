import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team_project/src/utils/app_colors.dart';
import 'package:team_project/src/utils/app_text_styles.dart';

class ContinueLearning extends StatelessWidget {
  const ContinueLearning({
    super.key,
    required this.subject,
    required this.part,
    required this.topic,
    required this.percentage,
  });

  final String subject;
  final String part;
  final String topic;
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width - 32,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.whiteShade2,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          SizedBox(
            width: Get.width - 64,
            child: RichText(
              text: TextSpan(
                text: subject,
                style: AppTextStyles.continueLearningTextStyle,
                children: [
                  const TextSpan(
                    text: ' > ',
                    style: AppTextStyles.continueLearningTextStyle,
                  ),
                  TextSpan(
                    text: part,
                    style: AppTextStyles.continueLearningTextStyle,
                  ),
                  const TextSpan(
                    text: ' > ',
                    style: AppTextStyles.continueLearningTextStyle,
                  ),
                  TextSpan(
                    text: topic,
                    style: AppTextStyles.continueLearningTextStyle,
                  ),
                ],
              ),
            ),
          ),
          // const SizedBox(height: 16),
          Visibility(
            visible: false,
            child: SizedBox(
              width: Get.width - 32,
              child: Stack(
                children: [
                  Container(
                    height: 16,
                    width: Get.width - 64,
                    decoration: BoxDecoration(
                      color: AppColors.whiteShade1,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Container(
                    height: 16,
                    width: (Get.width - 64) * (percentage/100),
                    decoration: BoxDecoration(
                      color: AppColors.whiteShade1,
                      gradient: const LinearGradient(
                        colors: [
                          AppColors.continueGradient1,
                          AppColors.continueGradient2,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
