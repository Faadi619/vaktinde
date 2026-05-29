import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../domain/day_state.dart';
import 'stats_calendar_pips.dart';

/// Single cell in the monthly calendar grid. Empty when [day] is null
/// (used for layout padding before the first-of-month).
class StatsCalendarDayCell extends StatelessWidget {
  final int? day;
  final DayState? state;

  /// Number of missed prayers to render as pips. Only used for
  /// [DayState.partial], [DayState.missed], and [DayState.today].
  final int missedCount;

  final VoidCallback? onTap;

  const StatsCalendarDayCell({
    super.key,
    required this.day,
    required this.state,
    this.missedCount = 0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (day == null || state == null) {
      return const AspectRatio(aspectRatio: 1, child: SizedBox());
    }

    final colors = _colorsFor(state!);

    return AspectRatio(
      aspectRatio: 1,
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Container(
          decoration: BoxDecoration(
            color: colors.background,
            shape: BoxShape.circle,
            border: colors.borderColor != null
                ? Border.all(
                    color: colors.borderColor!,
                    width: state == DayState.today ? 2 : 1,
                  )
                : null,
            boxShadow: state == DayState.today
                ? [
                    const BoxShadow(
                      color: AppColors.amberLightBackground,
                      blurRadius: 0,
                      spreadRadius: 3,
                    ),
                  ]
                : null,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text(
                '$day',
                style: AppTextStyles.size11w700.copyWith(
                  color: colors.textColor,
                  height: 1.0,
                ),
              ),
              if (missedCount > 0 && _hasPips(state!))
                Positioned(
                  bottom: 3,
                  child: StatsCalendarPips(
                    count: missedCount,
                    color: colors.pipColor ?? colors.textColor,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  bool _hasPips(DayState s) =>
      s == DayState.partial || s == DayState.missed || s == DayState.today;

  _CellColors _colorsFor(DayState s) {
    switch (s) {
      case DayState.full:
        return const _CellColors(
          background: AppColors.primaryGreen,
          textColor: AppColors.white,
        );
      case DayState.partial:
        return const _CellColors(
          background: AppColors.amberLightBackground,
          borderColor: AppColors.amberBorder,
          textColor: AppColors.amber,
          pipColor: AppColors.amber,
        );
      case DayState.missed:
        return const _CellColors(
          background: AppColors.redTintBackground,
          borderColor: AppColors.redBorder,
          textColor: AppColors.redText,
          pipColor: AppColors.redText,
        );
      case DayState.special:
        return const _CellColors(
          background: AppColors.purpleTintBackground,
          borderColor: AppColors.purpleBorder,
          textColor: AppColors.purpleStrongText,
        );
      case DayState.today:
        return const _CellColors(
          background: AppColors.amberLightBackground,
          borderColor: AppColors.amber,
          textColor: AppColors.amber,
          pipColor: AppColors.amber,
        );
      case DayState.future:
        return const _CellColors(
          background: AppColors.rowDivider,
          textColor: AppColors.disabledText,
        );
    }
  }
}

class _CellColors {
  final Color background;
  final Color? borderColor;
  final Color textColor;
  final Color? pipColor;

  const _CellColors({
    required this.background,
    required this.textColor,
    this.borderColor,
    this.pipColor,
  });
}

