import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team_project/src/config/app_routes.dart';
import 'package:team_project/src/utils/app_colors.dart';
import 'package:team_project/src/utils/app_text_styles.dart';

class FinishDialog extends StatelessWidget {
  const FinishDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 100,
        constraints:
        const BoxConstraints(maxHeight: 220),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColors.whiteShade1,
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 16,
              ),
              child: Text(
                'Barakalla!',
                style: AppTextStyles
                    .goodJobTextStyle,
              ),
            ),
            const Text(
              'Siz 5 ta savoldan 2 tasiga to`gri javob berdingiz!',
              style:
              AppTextStyles.resultTextStyle,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            const Divider(height: 0),
            TextButton(
              onPressed: () {
                Get.back();
                Get.toNamed(AppRoutes.quizResult);
              },
              child: Text(
                'Natijani ko`rish',
                style: AppTextStyles
                    .resultTextStyle
                    .copyWith(
                  color: AppColors.assets,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const Divider(height: 0),
            TextButton(
              onPressed: () {},
              child: Text(
                'O`rganishda davom etish',
                style: AppTextStyles
                    .resultTextStyle
                    .copyWith(
                  color: AppColors.assets,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
