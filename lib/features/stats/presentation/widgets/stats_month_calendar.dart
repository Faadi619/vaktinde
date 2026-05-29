import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../domain/day_state.dart';
import 'stats_calendar_day_cell.dart';

/// Per-day metadata used by the monthly calendar grid.
class CalendarDayInfo {
  final DayState state;
  final int missedCount;

  const CalendarDayInfo({required this.state, this.missedCount = 0});
}

/// Renders a single month grid using `table_calendar` under the hood, but
/// every cell is built with our [StatsCalendarDayCell] so the visual
/// styling (full / partial / missed / special / today / future) stays
/// completely under our control.
///
/// [dayStates] is keyed by a date-only DateTime (use [DateUtils.dateOnly]).
/// Days in `focusedMonth` that aren't in the map are treated as future days.
class StatsMonthCalendar extends StatelessWidget {
  final DateTime focusedMonth;
  final Map<DateTime, CalendarDayInfo> dayStates;
  final ValueChanged<DateTime>? onDayTap;

  const StatsMonthCalendar({
    super.key,
    required this.focusedMonth,
    required this.dayStates,
    this.onDayTap,
  });

  @override
  Widget build(BuildContext context) {
    final firstOfMonth = DateTime(focusedMonth.year, focusedMonth.month);
    final lastOfMonth = DateTime(focusedMonth.year, focusedMonth.month + 1, 0);

    return TableCalendar<void>(
      firstDay: firstOfMonth,
      lastDay: lastOfMonth,
      focusedDay: firstOfMonth,
      startingDayOfWeek: StartingDayOfWeek.monday,
      headerVisible: false,
      daysOfWeekVisible: false,
      sixWeekMonthsEnforced: false,
      rowHeight: 44,
      onDaySelected: (selected, _) => onDayTap?.call(selected),
      calendarBuilders: CalendarBuilders<void>(
        defaultBuilder: (context, day, focusedDay) => _buildCell(day),
        todayBuilder: (context, day, focusedDay) => _buildCell(day),
        outsideBuilder: (context, day, focusedDay) => const SizedBox.shrink(),
        disabledBuilder: (context, day, focusedDay) =>
            const SizedBox.shrink(),
      ),
    );
  }

  Widget _buildCell(DateTime day) {
    final key = DateUtils.dateOnly(day);
    final info = dayStates[key];
    final state = info?.state ?? DayState.future;
    return Padding(
      padding: const EdgeInsets.all(2),
      child: StatsCalendarDayCell(
        day: day.day,
        state: state,
        missedCount: info?.missedCount ?? 0,
      ),
    );
  }
}
