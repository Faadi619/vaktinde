import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../widgets/app_surface_card.dart';
import 'stats_bar_column.dart';
import 'stats_section_pill.dart';

class StatsWeeklyBarChart extends StatelessWidget {
  final String title;
  final String? pillLabel;
  final List<StatsBarColumnData> bars;
  final int todayIndex;
  final VoidCallback? onPillTap;

  /// Width of each bar in logical pixels. Default 22 fits 7-day charts; pass
  /// a smaller value (12–14) for denser 12-month charts.
  final double barWidth;

  const StatsWeeklyBarChart({
    super.key,
    required this.title,
    required this.bars,
    required this.todayIndex,
    this.pillLabel,
    this.onPillTap,
    this.barWidth = 22,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AppSurfaceCard(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: AppTextStyles.titleMedium.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                if (pillLabel != null)
                  StatsSectionPill(
                    label: pillLabel!,
                    onTap: onPillTap ?? () {},
                  ),
              ],
            ),
            const SizedBox(height: 18),
            SizedBox(
              height: 140,
              child: BarChart(
                BarChartData(
                  maxY: 100,
                  minY: 0,
                  alignment: BarChartAlignment.spaceBetween,
                  groupsSpace: 6,
                  barTouchData: BarTouchData(
                    enabled: false,
                    touchTooltipData: BarTouchTooltipData(
                      tooltipRoundedRadius: 0,
                      tooltipPadding: EdgeInsets.zero,
                      tooltipMargin: -2,
                      getTooltipColor: (_) => Colors.transparent,
                      getTooltipItem: (group, _, rod, __) {
                        final index = group.x;
                        if (index < 0 || index >= bars.length) return null;
                        final bar = bars[index];
                        final isFull = bar.percent >= 100;
                        final isToday = index == todayIndex;
                        final color = isFull || isToday
                            ? AppColors.primaryGreen
                            : AppColors.mutedText;
                        return BarTooltipItem(
                          '%${bar.percent}',
                          AppTextStyles.size9w400.copyWith(
                            fontWeight: FontWeight.w700,
                            color: color,
                          ),
                        );
                      },
                    ),
                  ),
                  gridData: const FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                  titlesData: FlTitlesData(
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 36,
                        interval: 25,
                        getTitlesWidget: _buildLeftTitle,
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 28,
                        getTitlesWidget: (value, meta) =>
                            _buildBottomTitle(value, meta, bars, todayIndex),
                      ),
                    ),
                  ),
                  barGroups: List.generate(bars.length, (index) {
                    final bar = bars[index];
                    final isToday = index == todayIndex;
                    final gradientColors = isToday
                        ? const [AppColors.darkGreen, AppColors.primaryGreen]
                        : const [
                            AppColors.barGradientLight,
                            AppColors.primaryGreen,
                          ];
                    return BarChartGroupData(
                      x: index,
                      showingTooltipIndicators: const [0],
                      barRods: [
                        BarChartRodData(
                          toY: bar.percent.toDouble(),
                          width: barWidth,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: gradientColors,
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildLeftTitle(double value, TitleMeta meta) {
  // fl_chart calls this for every interval (0/25/50/75/100).
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 6,
    child: Text(
      '%${value.toInt()}',
      maxLines: 1,
      softWrap: false,
      overflow: TextOverflow.visible,
      style: AppTextStyles.size9w400.copyWith(
        fontWeight: FontWeight.w500,
        height: 1.0,
        color: AppColors.mutedText,
      ),
    ),
  );
}

Widget _buildBottomTitle(
  double value,
  TitleMeta meta,
  List<StatsBarColumnData> bars,
  int todayIndex,
) {
  final index = value.toInt();
  if (index < 0 || index >= bars.length) return const SizedBox.shrink();
  final isToday = index == todayIndex;
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 6,
    child: Text(
      bars[index].dayLabel,
      style: AppTextStyles.size9w400.copyWith(
        fontSize: 10,
        fontWeight: isToday ? FontWeight.w800 : FontWeight.w600,
        color: isToday ? AppColors.primaryGreen : AppColors.mutedText,
      ),
    ),
  );
}
