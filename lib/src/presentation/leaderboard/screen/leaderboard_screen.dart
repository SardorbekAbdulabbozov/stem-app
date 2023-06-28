import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:team_project/src/presentation/leaderboard/controller/leaderboard_controller.dart';
import 'package:team_project/src/utils/app_colors.dart';
import 'package:team_project/src/utils/app_text_styles.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LeaderboardController>(
      builder: (context) {
        double mainViewHeight =
            Get.height - kToolbarHeight - (GetPlatform.isAndroid ? 174 : 202);
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              automaticallyImplyLeading: false,
              title: Text(
                'leaderboard'.tr,
                style: AppTextStyles.appBarTextStyle,
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset('assets/svg/ic_coin.svg'),
                      Text(
                        '350k'.tr,
                        style: AppTextStyles.coinTextStyle,
                      ),
                    ],
                  ),
                )
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.fromLTRB(16, 13, 16, 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Material(
                    color: AppColors.assets,
                    borderRadius: BorderRadius.circular(20),
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: TabBar(
                        indicatorWeight: 0,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white.withOpacity(0.15),
                        ),
                        dividerColor: Colors.transparent,
                        tabs: [
                          SizedBox(
                            height: 46,
                            width: Get.width,
                            child: Center(
                              child: Text(
                                'weekly'.tr,
                                style: AppTextStyles.tabNameStyle,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 46,
                            width: Get.width,
                            child: Center(
                              child: Text(
                                'all_time'.tr,
                                style: AppTextStyles.tabNameStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: mainViewHeight,
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        LeaderboardBody(viewHeight: mainViewHeight),
                        LeaderboardBody(viewHeight: mainViewHeight),
                      ],
                    ),
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

class LeaderboardBody extends StatelessWidget {
  const LeaderboardBody({super.key, required this.viewHeight});

  final double viewHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: Get.width,
          height: viewHeight - 90,
          margin: const EdgeInsets.only(top: 16),
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          decoration: const BoxDecoration(
            color: AppColors.whiteShade2,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: ListView.separated(
            itemCount: 6,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (_, i) {
              return Container(
                width: Get.width,
                height: 62.8,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  color: AppColors.whiteShade1,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      ((7 * (i + 1)) - 5) % 5 > 2
                          ? Icons.keyboard_arrow_up_rounded
                          : ((7 * (i + 1)) - 5) % 4 == 0
                              ? Icons.remove_rounded
                              : Icons.keyboard_arrow_down_rounded,
                      color: ((7 * (i + 1)) - 5) % 5 > 2
                          ? Colors.green
                          : ((7 * (i + 1)) - 5) % 4 == 0
                              ? Colors.black
                              : Colors.red,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Text(
                        '${i + 1}',
                        style: AppTextStyles.rankingIndexStyle.copyWith(
                          color: i + 1 == 6
                              ? AppColors.rankingIndicatorProfile
                              : null,
                        ),
                      ),
                    ),
                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: AppColors.lightGrey,
                          child: SvgPicture.asset('assets/svg/ic_user.svg'),
                        ),
                        if (i == 0)
                          Image.asset(
                            'assets/jpg/ic_first_ranking.png',
                            scale: 5,
                          )
                      ],
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Text(
                          i + 1 == 6 ? 'You' : 'Sardorbek',
                          style: AppTextStyles.rankingNameStyle.copyWith(
                            color: i + 1 == 6
                                ? AppColors.rankingIndicatorProfile
                                : null,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Text(
                      '${190 * ((6 - i) + 1) + 8 * i} c.',
                      style: AppTextStyles.rankingIndexStyle.copyWith(
                        color: i + 1 == 6
                            ? AppColors.rankingIndicatorProfile
                            : null,
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (_, i) => const SizedBox(height: 16),
          ),
        ),
        ConstrainedBox(
          constraints: BoxConstraints.tightFor(width: Get.width, height: 64),
          child: ElevatedButton(
            onPressed: () {},
            style: const ButtonStyle(
              elevation: MaterialStatePropertyAll<double>(0),
              backgroundColor:
                  MaterialStatePropertyAll<Color>(AppColors.whiteShade2),
              shape: MaterialStatePropertyAll<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                  ),
                ),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('view_all'.tr, style: AppTextStyles.viewAllTextStyle),
                const Padding(
                  padding: EdgeInsets.only(top: 2),
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 20,
                    color: AppColors.filledIconColor,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
