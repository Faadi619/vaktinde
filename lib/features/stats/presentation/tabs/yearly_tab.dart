import 'package:flutter/material.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/constants/colors.dart';
import '../../../../l10n/app_localizations.dart';
import '../widgets/stats_date_range_navigator.dart';
import '../widgets/stats_hero_card.dart';
import '../widgets/stats_mini_list_card.dart';
import '../widgets/stats_mini_list_row.dart';
import '../widgets/stats_monthly_bar_chart.dart';
import '../widgets/stats_motivational_card.dart';
import '../widgets/stats_note_card.dart';
import '../widgets/stats_prayer_card.dart';
import '../widgets/stats_total_cell.dart';
import '../widgets/stats_totals_card.dart';

class YearlyTab extends StatelessWidget {
  const YearlyTab({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return ListView(
      padding: const EdgeInsets.only(top: 16, bottom: 32),
      children: [
        // Hero
        StatsHeroCard(
          kicker: l10n.statsThisYear,
          streakText: l10n.statsDaysCount(318),
          subtitle: l10n.statsYearSubtitle,
          ringPercent: 87,
          ringCaption: l10n.statsRingCompletedShort,
          weekEngagement: const [true, true, true, true, true],
          todayIndex: 4,
        ),
        const SizedBox(height: 16),
        // Year nav
        StatsDateRangeNavigator(
          rangeLabel: l10n.statsYearPlaceholder,
          onPreviousTap: () {},
          onNextTap: () {},
          onPillTap: () {},
        ),
        const SizedBox(height: 16),
        // 5-stat row
        StatsTotalsCard(
          title: l10n.statsYearlyStatsTitle,
          cells: [
            StatsTotalCell(
              iconAsset: AppAssets.statsYearlyTotal,
              iconBackgroundColor: AppColors.lightGreen,
              value: '2.219',
              caption: l10n.statsYearlyStatTotal,
            ),
            StatsTotalCell(
              iconAsset: AppAssets.statsYearlyMakeup,
              iconBackgroundColor: AppColors.amberLightBackground,
              value: '213',
              caption: l10n.statsYearlyStatMakeup,
            ),
            StatsTotalCell(
              iconAsset: AppAssets.statsYearlyAvg,
              iconBackgroundColor: AppColors.blueTintBackground,
              value: '%87',
              caption: l10n.statsYearlyStatAverage,
            ),
            StatsTotalCell(
              iconAsset: AppAssets.statsYearlyStreak,
              iconBackgroundColor: AppColors.purpleTintBackground,
              value: l10n.statsDaysCountUnit(29),
              caption: l10n.statsYearlyStatLongestStreak,
            ),
            StatsTotalCell(
              iconAsset: AppAssets.statsYearlyConsistent,
              iconBackgroundColor: AppColors.lightGreen,
              value: l10n.statsDaysCountUnit(318),
              caption: l10n.statsYearlyStatConsistent,
            ),
          ],
        ),
        const SizedBox(height: 16),
        // 12-month bar chart
        StatsMonthlyBarChart(
          title: l10n.statsMonthlyCompletionTitle,
          currentMonth: DateTime(2025, 12),
          percentByMonth: {
            DateTime(2025, 1): 42,
            DateTime(2025, 2): 73,
            DateTime(2025, 3): 28,
            DateTime(2025, 4): 95,
            DateTime(2025, 5): 56,
            DateTime(2025, 6): 81,
            DateTime(2025, 7): 14,
            DateTime(2025, 8): 67,
            DateTime(2025, 9): 100,
            DateTime(2025, 10): 38,
            DateTime(2025, 11): 89,
            DateTime(2025, 12): 49,
          },
        ),
        const SizedBox(height: 16),
        // 5-prayer yearly averages — percent-only (no count)
        StatsPrayerCard(
          title: l10n.statsPrayerCompletionTitleYearly,
          titleSuffix: l10n.statsYearlyAverageSuffix,
          showCountText: false,
          stackTitleSuffix: true,
          highlightThreshold: 93,
          prayers: [
            StatsPrayerCardData(
              name: l10n.prayerFajr,
              iconAsset: AppAssets.fajrIcon,
              completed: 93,
              total: 100,
            ),
            StatsPrayerCardData(
              name: l10n.prayerDhuhr,
              iconAsset: AppAssets.zuhrIcon,
              completed: 90,
              total: 100,
            ),
            StatsPrayerCardData(
              name: l10n.prayerAsr,
              iconAsset: AppAssets.asarIcon,
              completed: 87,
              total: 100,
            ),
            StatsPrayerCardData(
              name: l10n.prayerMaghrib,
              iconAsset: AppAssets.maghribIcon,
              completed: 85,
              total: 100,
            ),
            StatsPrayerCardData(
              name: l10n.prayerIsha,
              iconAsset: AppAssets.ishaIcon,
              completed: 88,
              total: 100,
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Two-column: best months + achievements
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: StatsMiniListCard(
                    title: l10n.statsMostConsistentMonths,
                    rows: [
                      StatsMiniListRow(
                        leading: '🥇',
                        label: l10n.statsMonthFullJun,
                        trailing: '%93',
                      ),
                      StatsMiniListRow(
                        leading: '🥈',
                        label: l10n.statsMonthFullJan,
                        trailing: '%92',
                      ),
                      StatsMiniListRow(
                        leading: '🥉',
                        label: l10n.statsMonthFullDec,
                        trailing: '%91',
                      ),
                    ],
                    footerLabel: l10n.statsSeeAllMonths,
                    onFooterTap: () {},
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: StatsMiniListCard(
                    title: l10n.statsYearlyAchievements,
                    rows: [
                      StatsMiniListRow(
                        leading: '🏅',
                        label: l10n.statsBadgeStreakMasterTitle,
                        subtitle: l10n.statsBadgeStreakMasterSubtitle,
                      ),
                      StatsMiniListRow(
                        leading: '🎖️',
                        label: l10n.statsBadgeDisciplinedTitle,
                        subtitle: l10n.statsBadgeDisciplinedSubtitle,
                      ),
                      StatsMiniListRow(
                        leading: '⭐',
                        label: l10n.statsBadgeDevotedTitle,
                        subtitle: l10n.statsBadgeDevotedSubtitle,
                      ),
                    ],
                    footerLabel: l10n.statsSeeAllAchievements,
                    onFooterTap: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        // Motivational card
        StatsMotivationalCard(
          titleLine1: l10n.statsMotivationalLine1,
          titleLine2: l10n.statsMotivationalLine2,
          body: l10n.statsMotivationalBody,
        ),
        const SizedBox(height: 16),
        // Note prompt
        StatsNoteCard(
          title: l10n.quickMarkNoteTitle,
          subtitle: l10n.statsYearlyNoteSubtitle,
          onTap: () {},
        ),
      ],
    );
  }
}
