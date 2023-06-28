import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team_project/src/utils/app_colors.dart';
import 'package:team_project/src/utils/app_text_styles.dart';

class StreakWidget extends StatelessWidget {
  const StreakWidget({
    super.key,
    required this.streakText,
    required this.percentage,
  });

  final String streakText;
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
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                height: 16,
                width: Get.width - 114,
                decoration: BoxDecoration(
                  color: AppColors.whiteShade1,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                height: 16,
                width: (Get.width - 114) * percentage,
                decoration: BoxDecoration(
                  color: AppColors.whiteShade1,
                  gradient: const LinearGradient(
                    colors: [
                      AppColors.streakGradient1,
                      AppColors.streakGradient2,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
          const SizedBox(width: 9),
          Text(
            streakText,
            style: AppTextStyles.streakTextStyle,
          ),
        ],
      ),
    );
  }
}
