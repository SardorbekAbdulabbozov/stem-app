import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team_project/src/utils/app_colors.dart';
import 'package:team_project/src/utils/app_text_styles.dart';
import 'package:team_project/src/utils/pie_chart/chart_values_options.dart';
import 'package:team_project/src/utils/pie_chart/degree_options.dart';
import 'package:team_project/src/utils/pie_chart/pie_chart.dart';
import 'package:team_project/src/utils/pie_chart/legend_options.dart';

class GoalPieChart extends StatelessWidget {
  const GoalPieChart({super.key, required this.percentages});

  final Map<String, double> percentages;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
        percentages.length,
        (i) => Column(
          children: [
            Goal(
              dataMap: {
                'uncompleted': 100 - percentages.values.toList()[i],
                'completed': percentages.values.toList()[i],
              },
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                percentages.keys.toList()[i],
                style: AppTextStyles.goalTitleIndicatorTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Goal extends StatelessWidget {
  const Goal({
    super.key,
    required this.dataMap,
  });

  final Map<String, double> dataMap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: SizedBox(
        width: (Get.width - 64) / 3,
        child: PieChart(
          dataMap: dataMap,
          ringStrokeWidth: 16,
          chartType: ChartType.ring,
          animationDuration: Duration.zero,
          centerText: '${dataMap.entries.last.value.toInt()}%',
          centerTextStyle: AppTextStyles.goalIndicatorTextStyle
              .copyWith(backgroundColor: Colors.transparent),
          legendOptions: const LegendOptions(showLegends: false),
          chartValuesOptions: const ChartValuesOptions(
            showChartValues: false,
            decimalPlaces: 0,
          ),
          gradientList: const [
            [
              AppColors.whiteShade3,
              AppColors.whiteShade3,
              AppColors.whiteShade3,
            ],
            [
              AppColors.goalIndicatorColor1,
              AppColors.goalIndicatorColor2,
              AppColors.goalIndicatorColor3,
            ],
          ],
          degreeOptions: const DegreeOptions(initialAngle: -90),
        ),
      ),
    );
  }
}
