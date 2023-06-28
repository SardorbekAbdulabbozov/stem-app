import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:team_project/src/presentation/auth/controller/auth_controller.dart';
import 'package:team_project/src/utils/app_colors.dart';
import 'package:team_project/src/utils/app_text_styles.dart';

class RegisterSection extends StatelessWidget {
  const RegisterSection({super.key, required this.controller});

  final AuthController controller;

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: AppColors.assets,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark,
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(Get.height * 0.25),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  height: Get.height * 0.25,
                  width: Get.width,
                  color: AppColors.assets,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 48, right: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'STEM',
                          style: AppTextStyles.logoTextSmallStyle
                              .copyWith(fontSize: 40),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: -50,
                  left: -100,
                  child: RotatedBox(
                    quarterTurns: 4,
                    child: SvgPicture.asset(
                      'assets/svg/ic_circle.svg',
                      height: 240,
                      width: 240,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                color: AppColors.assets,
                height: Get.height * 0.1,
                width: Get.width,
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.whiteShade4,
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.all(28),
                width: Get.width - 32,
                child: Column(
                  children: [
                    Text(
                      'register'.tr.toUpperCase(),
                      style: AppTextStyles.registerButtonStyle.copyWith(
                        fontSize: 26,
                        color: AppColors.filledIconColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 36, bottom: 16),
                      child: TextField(
                        cursorColor: AppColors.assets,
                        decoration: InputDecoration(
                          hintText: 'first_name'.tr,
                          hintStyle: AppTextStyles.authHintTextStyle,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: TextField(
                        cursorColor: AppColors.assets,
                        decoration: InputDecoration(
                          hintText: 'last_name'.tr,
                          hintStyle: AppTextStyles.authHintTextStyle,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: TextField(
                        cursorColor: AppColors.assets,
                        decoration: InputDecoration(
                          hintText: 'username'.tr,
                          hintStyle: AppTextStyles.authHintTextStyle,
                        ),
                      ),
                    ),
                    TextField(
                      cursorColor: AppColors.assets,
                      decoration: InputDecoration(
                        hintText: 'password'.tr,
                        hintStyle: AppTextStyles.authHintTextStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 48, bottom: 16),
                      child: SizedBox(
                        width: Get.width,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                AppColors.assets),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          child: Text(
                            'register'.tr,
                            style: AppTextStyles.registerButtonStyle,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: RichText(
                        text: TextSpan(
                          text: 'login_instead_text'.tr,
                          style: AppTextStyles.registerInsteadTextStyle,
                          children: [
                            TextSpan(
                              text: 'login'.tr,
                              style: AppTextStyles.registerInsteadTextStyle
                                  .copyWith(color: AppColors.assets),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  controller.changeAuthMode(isRegister: false);
                                },
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
