import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team_project/src/utils/app_colors.dart';
import 'package:team_project/src/utils/app_text_styles.dart';

class SubjectDialog extends StatelessWidget {
  const SubjectDialog({super.key, required this.message, this.title});

  final String message;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 100,
        constraints:
        const BoxConstraints(maxHeight: 170),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColors.whiteShade1,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16,
              ),
              child: Text(
                title ?? 'Barakalla!',
                style: AppTextStyles
                    .goodJobTextStyle,
              ),
            ),
            Text(
              message,
              style:
              AppTextStyles.resultTextStyle,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            const Divider(height: 0),
            TextButton(
              onPressed: Get.back,
              child: Text(
                'Orqaga',
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
