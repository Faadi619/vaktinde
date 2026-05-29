import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../widgets/app_surface_card.dart';
import 'stats_month_calendar.dart';

/// Monthly calendar card: header (title + kaza pill) + legend + day-of-week
/// row + the calendar grid (powered by `table_calendar`).
class StatsCalendarCard extends StatelessWidget {
  final Widget headerTitle;
  final Widget headerTrailing;
  final List<Widget> legendChips;
  final List<String> dayOfWeekLabels;
  final DateTime focusedMonth;
  final Map<DateTime, CalendarDayInfo> dayStates;
  final ValueChanged<DateTime>? onDayTap;

  const StatsCalendarCard({
    super.key,
    required this.headerTitle,
    required this.headerTrailing,
    required this.legendChips,
    required this.dayOfWeekLabels,
    required this.focusedMonth,
    required this.dayStates,
    this.onDayTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AppSurfaceCard(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(child: headerTitle),
                const SizedBox(width: 8),
                headerTrailing,
              ],
            ),
            const SizedBox(height: 14),
            Wrap(spacing: 12, runSpacing: 8, children: legendChips),
            const SizedBox(height: 16),
            Row(
              children: dayOfWeekLabels
                  .map(
                    (label) => Expanded(
                      child: Center(
                        child: Text(
                          label,
                          style: AppTextStyles.size9w400.copyWith(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: AppColors.mutedText,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 4),
            StatsMonthCalendar(
              focusedMonth: focusedMonth,
              dayStates: dayStates,
              onDayTap: onDayTap,
            ),
          ],
        ),
      ),
    );
  }
}
