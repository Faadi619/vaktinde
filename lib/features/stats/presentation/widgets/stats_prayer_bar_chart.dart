import 'package:flutter/material.dart';

import '../../../../core/domain/prayer_slot.dart';
import '../../../../l10n/app_localizations.dart';
import 'stats_bar_column.dart';
import 'stats_weekly_bar_chart.dart';

/// Per-prayer bar chart adapter. Takes a `Map<PrayerSlot, int>` (slot →
/// completion percent) and renders one bar per prayer in canonical order
/// (Sabah / Öğle / İkindi / Akşam / Yatsı), with localized labels.
///
/// Pass only the slots you have data for — missing slots render at 0%.
class StatsPrayerBarChart extends StatelessWidget {
  final String title;
  final String pillLabel;
  final Map<PrayerSlot, int> percentByPrayer;
  final VoidCallback onPillTap;

  const StatsPrayerBarChart({
    super.key,
    required this.title,
    required this.pillLabel,
    required this.percentByPrayer,
    required this.onPillTap,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final bars = PrayerSlot.values.map((slot) {
      return StatsBarColumnData(
        dayLabel: slot.localizedName(l10n),
        percent: percentByPrayer[slot] ?? 0,
      );
    }).toList();

    return StatsWeeklyBarChart(
      title: title,
      pillLabel: pillLabel,
      bars: bars,
      todayIndex: -1,
      onPillTap: onPillTap,
    );
  }
}
