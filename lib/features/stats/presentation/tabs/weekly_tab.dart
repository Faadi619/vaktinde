import 'package:flutter/material.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/constants/colors.dart';
import '../../../../l10n/app_localizations.dart';
import '../widgets/stats_daily_bar_chart.dart';
import '../widgets/stats_date_range_navigator.dart';
import '../widgets/stats_hero_card.dart';
import '../widgets/stats_prayer_card.dart';
import '../widgets/stats_summary_card.dart';
import '../widgets/stats_summary_row.dart';

class WeeklyTab extends StatelessWidget {
  const WeeklyTab({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return ListView(
      padding: const EdgeInsets.only(top: 16, bottom: 32),
      children: [
        StatsHeroCard(
          kicker: l10n.statsThisWeek,
          streakText: l10n.statsDaysCount(6),
          subtitle: l10n.statsStreakSubtitle,
          ringPercent: 86,
          ringCaption: l10n.statsCompletionRatio,
          weekEngagement: const [true, true, true, true, true, true, false],
          todayIndex: 6,
        ),
        const SizedBox(height: 16),
        StatsDateRangeNavigator(
          rangeLabel: l10n.statsDateRangePlaceholder,
          onPreviousTap: () {},
          onNextTap: () {},
          onPillTap: () {},
        ),
        const SizedBox(height: 16),
        StatsDailyBarChart(
          title: l10n.statsDailyCompletionRate,
          pillLabel: l10n.statsDetailView,
          today: DateTime(2025, 5, 18),
          percentByDay: {
            DateTime(2025, 5, 12): 100,
            DateTime(2025, 5, 13): 86,
            DateTime(2025, 5, 14): 71,
            DateTime(2025, 5, 15): 100,
            DateTime(2025, 5, 16): 86,
            DateTime(2025, 5, 17): 71,
            DateTime(2025, 5, 18): 100,
          },
          onPillTap: () {},
        ),
        const SizedBox(height: 16),
        StatsPrayerCard(
          title: l10n.statsWeeklyAverages,
          titleSuffix: l10n.statsWeeklyAveragesSuffix,
          highlightThreshold: 96,
          prayers: [
            StatsPrayerCardData(
              name: l10n.prayerFajr,
              iconAsset: AppAssets.fajrIcon,
              completed: 67,
              total: 70,
              countTextOverride: '6.7/7',
            ),
            StatsPrayerCardData(
              name: l10n.prayerDhuhr,
              iconAsset: AppAssets.zuhrIcon,
              completed: 60,
              total: 70,
              countTextOverride: '6.0/7',
            ),
            StatsPrayerCardData(
              name: l10n.prayerAsr,
              iconAsset: AppAssets.asarIcon,
              completed: 61,
              total: 70,
              countTextOverride: '6.1/7',
            ),
            StatsPrayerCardData(
              name: l10n.prayerMaghrib,
              iconAsset: AppAssets.maghribIcon,
              completed: 53,
              total: 70,
              countTextOverride: '5.3/7',
            ),
            StatsPrayerCardData(
              name: l10n.prayerIsha,
              iconAsset: AppAssets.ishaIcon,
              completed: 67,
              total: 70,
              countTextOverride: '6.7/7',
            ),
          ],
        ),
        const SizedBox(height: 16),
        StatsSummaryCard(
          title: l10n.statsWeeklySummary,
          rows: [
            StatsSummaryRow(
              iconAsset: AppAssets.statsSummaryTotal,
              label: l10n.statsSummaryTotalPrayers,
              value: '42',
            ),
            StatsSummaryRow(
              iconAsset: AppAssets.statsSummaryMakeup,
              label: l10n.statsSummaryMakeupPrayers,
              value: '6',
            ),
            StatsSummaryRow(
              iconAsset: AppAssets.statsSummaryBest,
              label: l10n.statsSummaryMostConsistent,
              value: l10n.prayerFajr,
              valueColor: AppColors.primaryGreen,
            ),
            StatsSummaryRow(
              iconAsset: AppAssets.statsSummaryWorst,
              label: l10n.statsSummaryHardest,
              value: l10n.prayerMaghrib,
              valueColor: AppColors.redMutedText,
              showBottomDivider: false,
            ),
          ],
        ),
      ],
    );
  }
}
