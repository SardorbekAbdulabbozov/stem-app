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
                child: Form(
                  key: controller.formKeyRegister,
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
                        child: TextFormField(
                          controller: controller.firstNameController,
                          validator: (input) {
                            if ((input ?? '').isEmpty) {
                              return 'first_name_empty_error'.tr;
                            } else if ((input ?? '').length < 2 ||
                                (input ?? '').length > 15) {
                              return 'first_name_length'.tr;
                            } else {
                              return null;
                            }
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[A-Za-z]')),
                          ],
                          onSaved: (firstName) {
                            controller.firstName = firstName ?? '';
                          },
                          cursorColor: AppColors.assets,
                          decoration: InputDecoration(
                            hintText: 'first_name'.tr,
                            hintStyle: AppTextStyles.authHintTextStyle,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: TextFormField(
                          controller: controller.lastNameController,
                          validator: (input) {
                            if ((input ?? '').isEmpty) {
                              return 'last_name_empty_error'.tr;
                            } else if ((input ?? '').length < 2 ||
                                (input ?? '').length > 15) {
                              return 'last_name_length'.tr;
                            } else {
                              return null;
                            }
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp(r'[A-Za-z]'),
                            ),
                          ],
                          onSaved: (lastName) {
                            controller.lastName = lastName ?? '';
                          },
                          cursorColor: AppColors.assets,
                          decoration: InputDecoration(
                            hintText: 'last_name'.tr,
                            hintStyle: AppTextStyles.authHintTextStyle,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
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
                        controller: controller.passwordController,
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
                        obscureText: !controller.showPassword,
                        decoration: InputDecoration(
                          hintText: 'password'.tr,
                          hintStyle: AppTextStyles.authHintTextStyle,
                          suffixIcon: IconButton(
                            onPressed: controller.changePasswordVisibility,
                            icon: Icon(
                              controller.showPassword
                                  ? Icons.visibility_off_rounded
                                  : Icons.visibility_rounded,
                              color: AppColors.assets,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 48, bottom: 16),
                        child: SizedBox(
                          width: Get.width,
                          height: 56,
                          child: ElevatedButton(
                            onPressed: () async {
                              await controller.register();
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
                                    controller.changeAuthMode(
                                      isRegister: false,
                                    );
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
