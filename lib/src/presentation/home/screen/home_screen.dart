import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:team_project/src/presentation/home/controller/home_controller.dart';
import 'package:team_project/src/presentation/home/widgets/home_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (ctr) => KeyboardDismisser(
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
    );
  }
}

/*ModelViewer(
              src: 'assets/${ctr.objects[4]}.glb',
              ar: true,
              autoPlay: true,
              autoRotate: true,
              cameraControls: true,
            )*/

/*              SizedBox(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () => ctr.changeIndex(false),
                      child: const Icon(Icons.arrow_back_ios_rounded),
                    ),
                    ElevatedButton(
                      onPressed: () => ctr.changeIndex(true),
                      child: const Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  ],
                ),
              )*/
