import 'package:flutter/material.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../core/domain/prayer_slot.dart';
import '../../domain/day_state.dart';
import '../widgets/stats_calendar_card.dart';
import '../widgets/stats_calendar_legend_chip.dart';
import '../widgets/stats_date_range_navigator.dart';
import '../widgets/stats_hero_card.dart';
import '../widgets/stats_insight_cell.dart';
import '../widgets/stats_insights_card.dart';
import '../widgets/stats_kaza_pill.dart';
import '../widgets/stats_month_calendar.dart';
import '../widgets/stats_note_card.dart';
import '../widgets/stats_prayer_bar_chart.dart';
import '../widgets/stats_summary_card.dart';
import '../widgets/stats_summary_row.dart';

class MonthlyTab extends StatelessWidget {
  const MonthlyTab({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return ListView(
      padding: const EdgeInsets.only(top: 16, bottom: 32),
      children: [
        StatsHeroCard(
          kicker: l10n.statsThisMonth,
          streakText: l10n.statsDaysCount(21),
          subtitle: l10n.statsMonthSubtitle,
          ringPercent: 87,
          ringCaption: l10n.statsRingCompletedShort,
          weekEngagement: const [true, true, true, true, true, false],
          todayIndex: 5,
        ),
        const SizedBox(height: 16),
        StatsDateRangeNavigator(
          rangeLabel: l10n.statsMonthPlaceholder,
          onPreviousTap: () {},
          onNextTap: () {},
          onPillTap: () {},
        ),
        const SizedBox(height: 16),
        StatsCalendarCard(
          headerTitle: Text(
            l10n.statsMonthlyCalendarTitle,
            style: AppTextStyles.titleMedium.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          headerTrailing: StatsKazaPill(label: l10n.statsKazaDaysFormat(4)),
          legendChips: [
            StatsCalendarLegendChip(
              dotColor: AppColors.primaryGreen,
              label: l10n.statsDayStateFull,
            ),
            StatsCalendarLegendChip(
              dotColor: AppColors.amberLightBackground,
              dotBorderColor: AppColors.amberBorder,
              label: l10n.statsDayStatePartial,
            ),
            StatsCalendarLegendChip(
              dotColor: AppColors.redTintBackground,
              dotBorderColor: AppColors.redBorder,
              label: l10n.statsDayStateMissed,
            ),
            StatsCalendarLegendChip(
              dotColor: AppColors.purpleTintBackground,
              dotBorderColor: AppColors.purpleBorder,
              label: l10n.statsDayStateSpecial,
            ),
            StatsCalendarLegendChip(
              dotColor: AppColors.rowDivider,
              label: l10n.statsDayStateFuture,
            ),
          ],
          dayOfWeekLabels: [
            l10n.statsDayOfWeekMon,
            l10n.statsDayOfWeekTue,
            l10n.statsDayOfWeekWed,
            l10n.statsDayOfWeekThu,
            l10n.statsDayOfWeekFri,
            l10n.statsDayOfWeekSat,
            l10n.statsDayOfWeekSun,
          ],
          focusedMonth: DateTime(2025, 5),
          dayStates: _mayDayStates(),
          onDayTap: (_) {},
        ),
        const SizedBox(height: 16),
        StatsSummaryCard(
          title: l10n.statsMonthlyStatsTitle,
          rows: [
            StatsSummaryRow(
              iconAsset: AppAssets.statsSummaryTotal,
              label: l10n.statsMonthlyTotalPrayers,
              value: '186',
            ),
            StatsSummaryRow(
              iconAsset: AppAssets.statsSummaryMakeup,
              label: l10n.statsMonthlyMakeupPrayers,
              value: '18',
              valueColor: AppColors.amber,
            ),
            StatsSummaryRow(
              iconAsset: AppAssets.statsSummaryBest,
              label: l10n.statsMonthlyAverageDaily,
              value: '%87',
            ),
            StatsSummaryRow(
              iconAsset: AppAssets.statsSummaryBest,
              label: l10n.statsMonthlyLongestStreak,
              value: l10n.statsDaysCountUnit(12),
              valueColor: AppColors.primaryGreen,
            ),
            StatsSummaryRow(
              iconAsset: AppAssets.statsSummaryBest,
              label: l10n.statsMonthlyConsistentDays,
              value: l10n.statsDaysCountUnit(21),
              valueColor: AppColors.primaryGreen,
            ),
            StatsSummaryRow(
              iconAsset: AppAssets.statsSummaryWorst,
              label: l10n.statsMonthlyKazaRequiredDays,
              value: l10n.statsDaysCountUnit(4),
              valueColor: AppColors.redText,
            ),
            StatsSummaryRow(
              iconAsset: AppAssets.statsSummaryWorst,
              label: l10n.statsMonthlyMissedDays,
              value: l10n.statsDaysCountUnit(1),
              valueColor: AppColors.redText,
              showBottomDivider: false,
            ),
          ],
        ),
        const SizedBox(height: 16),
        StatsPrayerBarChart(
          title: l10n.statsPrayerCompletionTitle,
          pillLabel: l10n.statsThisMonth,
          percentByPrayer: const {
            PrayerSlot.fajr: 93,
            PrayerSlot.dhuhr: 89,
            PrayerSlot.asr: 84,
            PrayerSlot.maghrib: 81,
            PrayerSlot.isha: 88,
          },
          onPillTap: () {},
        ),
        const SizedBox(height: 16),
        StatsInsightsCard(
          title: l10n.statsMonthlyInsightsTitle,
          insights: [
            StatsInsightCell(
              iconAsset: AppAssets.statsInsightStreak,
              value: l10n.statsDaysCountUnit(12),
              caption: l10n.statsInsightLongestStreakCaption,
            ),
            StatsInsightCell(
              iconAsset: AppAssets.statsInsightBestPrayer,
              value: l10n.prayerFajr,
              caption: l10n.statsInsightBestPrayerCaption,
              valueColor: AppColors.primaryGreen,
            ),
            StatsInsightCell(
              iconAsset: AppAssets.statsInsightTrendUp,
              value: '%8 ↑',
              caption: l10n.statsInsightMonthOverMonthCaption,
              valueColor: AppColors.blueText,
            ),
          ],
        ),
        const SizedBox(height: 16),
        StatsNoteCard(
          title: l10n.quickMarkNoteTitle,
          subtitle: l10n.statsMonthlyNoteSubtitle,
          onTap: () {},
        ),
      ],
    );
  }

  /// May 2025 day-state preview matching the Figma frame.
  ///
  /// Partial pips: 3→2, 7→1, 17→2, 21→1. Missed pips: 14→3. Today (24)
  /// shows 2 amber pips. Days 25–31 left out of the map → fall back to
  /// `future` styling in [StatsMonthCalendar].
  Map<DateTime, CalendarDayInfo> _mayDayStates() {
    const full = CalendarDayInfo(state: DayState.full);
    const partial2 = CalendarDayInfo(state: DayState.partial, missedCount: 2);
    const partial1 = CalendarDayInfo(state: DayState.partial, missedCount: 1);
    const special = CalendarDayInfo(state: DayState.special);
    const missed3 = CalendarDayInfo(state: DayState.missed, missedCount: 3);
    const today = CalendarDayInfo(state: DayState.today, missedCount: 2);

    DateTime d(int day) => DateTime(2025, 5, day);

    return {
      d(1): full,
      d(2): full,
      d(3): partial2,
      d(4): full,
      d(5): full,
      d(6): full,
      d(7): partial1,
      d(8): full,
      d(9): full,
      d(10): special,
      d(11): full,
      d(12): full,
      d(13): full,
      d(14): missed3,
      d(15): full,
      d(16): full,
      d(17): partial2,
      d(18): full,
      d(19): full,
      d(20): full,
      d(21): partial1,
      d(22): full,
      d(23): full,
      d(24): today,
    };
  }
}
