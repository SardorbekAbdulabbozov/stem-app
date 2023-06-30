// ignore_for_file: deprecated_member_use

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:team_project/src/presentation/auth/controller/auth_controller.dart';
import 'package:team_project/src/utils/app_colors.dart';
import 'package:team_project/src/utils/app_text_styles.dart';

class LoginSection extends StatelessWidget {
  const LoginSection({super.key, required this.controller});

  final AuthController controller;

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
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
                    padding: const EdgeInsets.only(top: 48, left: 16),
                    child: Text(
                      'STEM',
                      style: AppTextStyles.logoTextSmallStyle
                          .copyWith(fontSize: 40),
                    ),
                  ),
                ),
                Positioned(
                  top: -100,
                  right: -100,
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: SvgPicture.asset(
                      'assets/svg/ic_circle.svg',
                      height: 250,
                      width: 250,
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
                child: Form(
                  key: controller.formKeyLogin,
                  child: Column(
                    children: [
                      Text(
                        'login'.tr.toUpperCase(),
                        style: AppTextStyles.registerButtonStyle.copyWith(
                          fontSize: 26,
                          color: AppColors.filledIconColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 36, bottom: 16),
                        child: TextFormField(
                          controller: controller.usernameController,
                          cursorColor: AppColors.assets,
                          validator: (input) {
                            if ((input ?? '').isEmpty) {
                              return 'username_empty_error'.tr;
                            } else {
                              return null;
                            }
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp(r'\w'),
                            ),
                          ],
                          onSaved: (username) {
                            controller.username = username ?? '';
                          },
                          decoration: InputDecoration(
                            hintText: 'username'.tr,
                            hintStyle: AppTextStyles.authHintTextStyle,
                          ),
                        ),
                      ),
                      TextFormField(
                        cursorColor: AppColors.assets,
                        validator: (input) {
                          if ((input ?? '').isEmpty) {
                            return 'password_empty_error'.tr;
                          } else if ((input ?? '').length < 8) {
                            return 'password_length'.tr;
                          } else if (!controller.regExpForPassword
                              .hasMatch(input ?? '')) {
                            return 'password_requirement'.tr;
                          } else {
                            return null;
                          }
                        },
                        onSaved: (password) {
                          controller.password = password ?? '';
                        },
                        decoration: InputDecoration(
                          hintText: 'password'.tr,
                          hintStyle: AppTextStyles.authHintTextStyle,
                          suffixIcon: IconButton(
                            onPressed: controller.changePasswordVisibility,
                            icon: SvgPicture.asset(
                              controller.showPassword
                                  ? 'assets/svg/ic_visibility_off.svg'
                                  : 'assets/svg/ic_visibility_on.svg',
                              color: AppColors.assets,
                            ),
                          ),
                        ),
                        obscureText: !controller.showPassword,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 48, bottom: 16),
                        child: SizedBox(
                          width: Get.width,
                          height: 56,
                          child: ElevatedButton(
                            onPressed: () async {
                              await controller.login();
                            },
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
                              'login'.tr,
                              style: AppTextStyles.registerButtonStyle,
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'forgot_password'.tr,
                          style: AppTextStyles.forgotPasswordTextStyle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: RichText(
                          text: TextSpan(
                            text: 'register_instead_text'.tr,
                            style: AppTextStyles.registerInsteadTextStyle,
                            children: [
                              TextSpan(
                                text: 'register'.tr,
                                style: AppTextStyles.registerInsteadTextStyle
                                    .copyWith(color: AppColors.assets),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    controller.changeAuthMode(isRegister: true);
                                  },
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
