import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:team_project/src/utils/app_text_styles.dart';

class SubjectCard extends StatelessWidget {
  const SubjectCard({
    super.key,
    required this.onTap,
    required this.title,
    required this.topicsCount,
    required this.image,
  });

  final String image;
  final String title;
  final String topicsCount;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      borderRadius: const BorderRadius.all(
        Radius.circular(16),
      ),
      child: InkWell(
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
        onTap: onTap,
        child: SizedBox(
          width: (Get.width - 48) / 2,
          height: 6.2 * (Get.width - 48) / 9,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/svg/ic_$image.svg',
                  height: 4 * (Get.width - 48) / 9,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                    bottom: 4,
                  ),
                  child: Text(
                    title,
                    style: AppTextStyles.mySubjectTitleStyle,
                  ),
                ),
                Text(
                  '$topicsCount ${'topics'.tr}',
                  style: AppTextStyles.mySubjectTopicsStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

