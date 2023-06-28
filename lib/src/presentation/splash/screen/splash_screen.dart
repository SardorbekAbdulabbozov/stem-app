import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:team_project/src/presentation/splash/controller/splash_controller.dart';
import 'package:team_project/src/utils/app_colors.dart';
import 'package:team_project/src/utils/app_text_styles.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (ctr) {
        return Scaffold(
          backgroundColor: AppColors.assets,
          appBar: AppBar(
            toolbarHeight: 0,
            backgroundColor: AppColors.assets,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: AppColors.assets,
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.dark,
            ),
          ),
          body: const Center(
            child: Text(
              'STEM',
              style: AppTextStyles.logoTextStyle,
            ),
          ),
        );
      },
    );
  }
}
