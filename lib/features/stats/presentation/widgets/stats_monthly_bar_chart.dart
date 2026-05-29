import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'stats_bar_column.dart';
import 'stats_weekly_bar_chart.dart';

/// Per-month bar chart adapter. Transforms a `Map<DateTime, int>` (first-
/// of-month → completion percent) into the low-level [StatsWeeklyBarChart].
///
/// Month labels are generated with `intl`'s `DateFormat('MMM', 'tr')` — so
/// Turkish abbreviations "Oca"/"Şub"/... are never hardcoded. The bar whose
/// (year, month) matches `currentMonth` is rendered with the bold "current"
/// styling.
class StatsMonthlyBarChart extends StatelessWidget {
  final String title;
  final String? pillLabel;
  final Map<DateTime, int> percentByMonth;
  final DateTime currentMonth;
  final VoidCallback? onPillTap;

  const StatsMonthlyBarChart({
    super.key,
    required this.title,
    required this.percentByMonth,
    required this.currentMonth,
    this.pillLabel,
    this.onPillTap,
  });

  @override
  Widget build(BuildContext context) {
    final monthFormatter = DateFormat('MMM', 'tr');

    final orderedMonths =
        percentByMonth.keys.map((d) => DateTime(d.year, d.month)).toList()
          ..sort();

    int currentIndex = -1;
    final bars = <StatsBarColumnData>[];
    for (var i = 0; i < orderedMonths.length; i++) {
      final month = orderedMonths[i];
      final percent =
          percentByMonth[month] ??
          percentByMonth.entries
              .firstWhere(
                (e) => e.key.year == month.year && e.key.month == month.month,
                orElse: () => MapEntry(month, 0),
              )
              .value;
      final isCurrent =
          month.year == currentMonth.year && month.month == currentMonth.month;
      if (isCurrent) currentIndex = i;
      bars.add(
        StatsBarColumnData(
          dayLabel: monthFormatter.format(month),
          percent: percent,
        ),
      );
    }

    return StatsWeeklyBarChart(
      title: title,
      pillLabel: pillLabel,
      bars: bars,
      todayIndex: currentIndex,
      onPillTap: onPillTap,
      barWidth: 20,
    );
  }
}
