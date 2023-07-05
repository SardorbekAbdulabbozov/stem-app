import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:team_project/src/presentation/home/controller/home_controller.dart';
import 'package:team_project/src/presentation/home/widgets/home_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (ctr) => KeyboardDismisser(
        child: ModalProgressHUD(
          inAsyncCall: ctr.isLoading,
          color: Colors.white,
          blur: 1,
          child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 0,
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarBrightness: Brightness.light,
              ),
            ),
            backgroundColor: Colors.white,
            body: ctr.navBarIndex == 0
                ? HomeSection(ctr: ctr)
                : ctr.screens[ctr.navBarIndex - 1],
            bottomNavigationBar: Container(
              height: GetPlatform.isAndroid ? 72 : 84,
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(color: Colors.black.withOpacity(0.6), blurRadius: 5),
                ],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: BottomNavigationBar(
                  showUnselectedLabels: true,
                  type: BottomNavigationBarType.fixed,
                  currentIndex: ctr.navBarIndex,
                  onTap: ctr.changeIndex,
                  items: [
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset('assets/svg/ic_home_outlined.svg'),
                      label: 'home'.tr,
                      activeIcon:
                          SvgPicture.asset('assets/svg/ic_home_filled.svg'),
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        'assets/svg/ic_my_learning_outlined.svg',
                      ),
                      label: 'my_learning'.tr,
                      activeIcon: SvgPicture.asset(
                          'assets/svg/ic_my_learning_filled.svg'),
                    ),
                    BottomNavigationBarItem(
                      icon:
                          SvgPicture.asset('assets/svg/ic_progress_outlined.svg'),
                      label: 'leaderboard'.tr,
                      activeIcon:
                          SvgPicture.asset('assets/svg/ic_progress_filled.svg'),
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset('assets/svg/ic_user_outlined.svg'),
                      label: 'profile'.tr,
                      activeIcon:
                          SvgPicture.asset('assets/svg/ic_user_filled.svg'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}