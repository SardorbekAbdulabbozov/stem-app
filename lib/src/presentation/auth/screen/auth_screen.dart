import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:team_project/src/presentation/auth/controller/auth_controller.dart';
import 'package:team_project/src/presentation/auth/widgets/login_section.dart';
import 'package:team_project/src/presentation/auth/widgets/register_section.dart';
import 'package:team_project/src/utils/app_colors.dart';
import 'package:team_project/src/utils/app_text_styles.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (ctr) {
        return ModalProgressHUD(
          inAsyncCall: ctr.isLoading,
          progressIndicator:
              const CircularProgressIndicator(color: AppColors.assets),
          child: ctr.isIntro
              ? Scaffold(
                  backgroundColor: AppColors.assets,
                  appBar: AppBar(
                    backgroundColor: AppColors.assets,
                    systemOverlayStyle: const SystemUiOverlayStyle(
                      statusBarColor: AppColors.assets,
                      statusBarIconBrightness: Brightness.light,
                      statusBarBrightness: Brightness.dark,
                    ),
                  ),
                  body: SizedBox(
                    height: Get.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 36),
                          child: Text(
                            'STEM',
                            style: AppTextStyles.logoTextSmallStyle,
                          ),
                        ),
                        SvgPicture.asset('assets/svg/ic_auth.svg'),
                        const Spacer(),
                        Container(
                          height: Get.height * 0.3,
                          width: Get.width,
                          margin: const EdgeInsets.all(16),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Text(
                                'login_message'.tr,
                                style: AppTextStyles.authMessageStyle,
                                textAlign: TextAlign.center,
                              ),
                              const Spacer(),
                              SizedBox(
                                width: Get.width,
                                height: 56,
                                child: ElevatedButton(
                                  onPressed: () {
                                    ctr.changeAuthMode(isRegister: true);
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            AppColors.assets),
                                    shape: MaterialStateProperty.all<
                                        OutlinedBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    'register'.tr,
                                    style: AppTextStyles.registerButtonStyle,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 16),
                                child: RichText(
                                  text: TextSpan(
                                    text: 'login_instead_text'.tr,
                                    style: AppTextStyles.loginInsteadTextStyle,
                                    children: [
                                      TextSpan(
                                        text: 'login'.tr,
                                        style: AppTextStyles.loginTextStyle,
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            ctr.changeAuthMode(
                                                isRegister: false);
                                          },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : ctr.isRegister
                  ? RegisterSection(controller: ctr)
                  : LoginSection(controller: ctr),
        );
      },
    );
  }
}
