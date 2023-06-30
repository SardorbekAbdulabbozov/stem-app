// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:team_project/src/config/app_routes.dart';
import 'package:team_project/src/presentation/profile/controller/profile_controller.dart';
import 'package:team_project/src/utils/app_colors.dart';
import 'package:team_project/src/utils/app_text_styles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (ctr) {
        return ModalProgressHUD(
          inAsyncCall: ctr.isLoading,
          progressIndicator:
              const CircularProgressIndicator(color: AppColors.assets),
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              automaticallyImplyLeading: false,
              title: Text(
                'profile'.tr,
                style: AppTextStyles.appBarTextStyle,
              ),
              actions: [
                IconButton(
                  onPressed: () async {
                    ctr.setLoading(true);
                    await ctr.localSource.logout();
                    ctr.setLoading(false);
                    Get.offAllNamed(AppRoutes.auth);
                  },
                  icon: SvgPicture.asset(
                    'assets/svg/ic_logout.svg',
                    color: AppColors.red,
                  ),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: AppColors.whiteShade3,
                    ),
                    margin: const EdgeInsets.only(bottom: 16),
                    padding:
                        const EdgeInsets.all(16).copyWith(bottom: 4, top: 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 32,
                              backgroundColor: AppColors.assets,
                              child: SvgPicture.asset(
                                'assets/svg/ic_user.svg',
                                width: 50,
                                height: 50,
                                color: AppColors.whiteShade3,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    '${ctr.user.firstName} ${ctr.user.lastName}',
                                    style: AppTextStyles.userFullNameProfile,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, bottom: 16, left: 8),
                                  child: Text(
                                    '@${ctr.user.username}',
                                    style: AppTextStyles.usernameProfile,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        ListView.separated(
                          shrinkWrap: true,
                          itemCount: ctr.menu.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (_, i) {
                            return Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {},
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 16),
                                          child: SvgPicture.asset(
                                            'assets/svg/ic_${ctr.menu[i].icon}.svg',
                                            color: AppColors.assets,
                                            height: 30,
                                            width: 30,
                                          ),
                                        ),
                                        Text(
                                          ctr.menu[i].title,
                                          style: AppTextStyles
                                              .profileMenuItemTextStyle,
                                        ),
                                      ],
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: AppColors.filledIconColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (_, i) => const Divider(height: 0),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${'version'.tr}: ${'1.0.0'}',
                    style: AppTextStyles.versionTextStyle,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
