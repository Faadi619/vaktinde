import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';

/// Dot + label legend chip used under the calendar title.
class StatsCalendarLegendChip extends StatelessWidget {
  final Color dotColor;
  final Color? dotBorderColor;
  final String label;

  const StatsCalendarLegendChip({
    super.key,
    required this.dotColor,
    required this.label,
    this.dotBorderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 11,
          height: 11,
          decoration: BoxDecoration(
            color: dotColor,
            shape: BoxShape.circle,
            border: dotBorderColor != null
                ? Border.all(color: dotBorderColor!, width: 1)
                : null,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: AppTextStyles.size9w400.copyWith(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: AppColors.mutedText,
          ),
        ),
      ],
    );
  }
}
