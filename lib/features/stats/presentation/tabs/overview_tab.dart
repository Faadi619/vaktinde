import 'package:flutter/material.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/constants/colors.dart';
import '../../../../l10n/app_localizations.dart';
import '../widgets/stats_daily_bar_chart.dart';
import '../widgets/stats_hero_card.dart';
import '../widgets/stats_note_card.dart';
import '../widgets/stats_prayer_card.dart';
import '../widgets/stats_total_cell.dart';
import '../widgets/stats_totals_card.dart';

class OverviewTab extends StatelessWidget {
  const OverviewTab({super.key});

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
          ringKicker: l10n.statsThisWeek,
          ringCaption: l10n.statsRingCompleted,
          weekEngagement: const [true, true, true, true, true, true, false],
          todayIndex: 6,
        ),
        const SizedBox(height: 16),
        StatsPrayerCard(
          title: l10n.statsPrayerStats,
          pillLabel: l10n.statsThisWeek,
          prayers: [
            StatsPrayerCardData(
              name: l10n.prayerFajr,
              iconAsset: AppAssets.fajrIcon,
              completed: 7,
              total: 7,
            ),
            StatsPrayerCardData(
              name: l10n.prayerDhuhr,
              iconAsset: AppAssets.zuhrIcon,
              completed: 6,
              total: 7,
            ),
            StatsPrayerCardData(
              name: l10n.prayerAsr,
              iconAsset: AppAssets.asarIcon,
              completed: 6,
              total: 7,
            ),
            StatsPrayerCardData(
              name: l10n.prayerMaghrib,
              iconAsset: AppAssets.maghribIcon,
              completed: 5,
              total: 7,
            ),
            StatsPrayerCardData(
              name: l10n.prayerIsha,
              iconAsset: AppAssets.ishaIcon,
              completed: 7,
              total: 7,
            ),
          ],
          onPillTap: () {},
        ),
        const SizedBox(height: 16),
        StatsDailyBarChart(
          title: l10n.statsWeeklyCompletionRate,
          pillLabel: l10n.statsLastSevenDays,
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
        StatsTotalsCard(
          title: l10n.statsTotalStats,
          cells: [
            StatsTotalCell(
              iconAsset: AppAssets.statsTotalCalendarCheck,
              iconBackgroundColor: AppColors.lightGreen,
              value: '42',
              caption: l10n.statsTotalDaysPrayed,
            ),
            StatsTotalCell(
              iconAsset: AppAssets.statsTotalFlame,
              iconBackgroundColor: AppColors.amberLightBackground,
              value: '6',
              caption: l10n.statsLongestStreakDays,
            ),
            StatsTotalCell(
              iconAsset: AppAssets.statsTotalTarget,
              iconBackgroundColor: AppColors.blueTintBackground,
              value: '%82',
              caption: l10n.statsAverageSuccessRate,
            ),
            StatsTotalCell(
              iconAsset: AppAssets.statsTotalChart,
              iconBackgroundColor: AppColors.purpleTintBackground,
              value: '215',
              caption: l10n.statsTotalCompletion,
            ),
          ],
        ),
        const SizedBox(height: 16),
        StatsNoteCard(
          title: l10n.quickMarkNoteTitle,
          subtitle: l10n.quickMarkNoteSubtitle,
          onTap: () {},
        ),
      ],
    );
  }
}
