import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';

/// Horizontal row of engagement dots. Engaged entries show a green-filled
/// circle with a white check; non-engaged entries show a light-green dot.
///
/// Length is inferred from `engagement` — typical use is 7 (week) or 6
/// (month, one dot per week of the month).
class StatsWeekDots extends StatelessWidget {
  final List<bool> engagement;
  final int todayIndex;

  const StatsWeekDots({
    super.key,
    required this.engagement,
    required this.todayIndex,
  });

  @override
  Widget build(BuildContext context) {
    final count = engagement.length;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(count, (index) {
        final isEngaged = engagement[index];
        return Padding(
          padding: EdgeInsets.only(right: index == count - 1 ? 0 : 8),
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: isEngaged ? AppColors.primaryGreen : AppColors.lightGreen,
              shape: BoxShape.circle,
            ),
            child: isEngaged
                ? const Icon(Icons.check, size: 12, color: AppColors.white)
                : null,
          ),
        );
      }),
    );
  }
}
