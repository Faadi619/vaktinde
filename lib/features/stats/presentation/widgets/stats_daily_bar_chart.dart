import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../l10n/app_localizations.dart';
import 'stats_bar_column.dart';
import 'stats_weekly_bar_chart.dart';

/// Per-day bar chart adapter. Transforms a `Map<DateTime, int>` (date →
/// completion percent) into the low-level [StatsWeeklyBarChart] format.
///
/// Day labels are generated with `intl`'s `DateFormat('EEE', 'tr')` — so the
/// Turkish abbreviations "Pzt"/"Sal"/... are never hardcoded. The cell whose
/// date matches `today` is rendered with the bold "Bugün" styling.
class StatsDailyBarChart extends StatelessWidget {
  final String title;
  final String pillLabel;
  final Map<DateTime, int> percentByDay;
  final DateTime today;
  final VoidCallback onPillTap;

  const StatsDailyBarChart({
    super.key,
    required this.title,
    required this.pillLabel,
    required this.percentByDay,
    required this.today,
    required this.onPillTap,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final dayFormatter = DateFormat('EEE', 'tr');
    final todayKey = DateUtils.dateOnly(today);

    final orderedDates = percentByDay.keys
        .map(DateUtils.dateOnly)
        .toList()
      ..sort();

    int todayIndex = -1;
    final bars = <StatsBarColumnData>[];
    for (var i = 0; i < orderedDates.length; i++) {
      final date = orderedDates[i];
      final percent = percentByDay[date] ?? percentByDay[orderedDates[i]] ?? 0;
      final isToday = date == todayKey;
      if (isToday) todayIndex = i;
      bars.add(
        StatsBarColumnData(
          dayLabel: isToday ? l10n.statsToday : dayFormatter.format(date),
          percent: percent,
        ),
      );
    }

    return StatsWeeklyBarChart(
      title: title,
      pillLabel: pillLabel,
      bars: bars,
      todayIndex: todayIndex,
      onPillTap: onPillTap,
    );
  }
}
