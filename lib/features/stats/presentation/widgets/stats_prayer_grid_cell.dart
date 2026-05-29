import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';

/// One column of the 5-prayer grid: name → icon → (count → percent | percent
/// only) → divider bar.
///
/// When [showCountText] is true (default, used by Genel Bakış + Haftalık),
/// the layout shows the count text ("7/7" or "6.7/7") prominently and the
/// percent below it as a small label.
///
/// When [showCountText] is false (used by Yıllık), the count is suppressed
/// and the percent itself is promoted to the big-number slot.
class StatsPrayerGridCell extends StatelessWidget {
  final String prayerName;
  final String iconAsset;
  final String countText;
  final int percent;

  /// Percent at or above which the cell renders with green text + divider.
  final int highlightThreshold;

  /// Toggle the count text row. When false, only the percent (large) +
  /// divider render — no `X/7` line.
  final bool showCountText;

  const StatsPrayerGridCell({
    super.key,
    required this.prayerName,
    required this.iconAsset,
    required this.countText,
    required this.percent,
    this.highlightThreshold = 100,
    this.showCountText = true,
  });

  @override
  Widget build(BuildContext context) {
    final isHighlighted = percent >= highlightThreshold;
    final percentColor = isHighlighted
        ? AppColors.primaryGreen
        : AppColors.mutedText;
    final dividerColor = isHighlighted
        ? AppColors.primaryGreen
        : AppColors.lightGreen;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          prayerName,
          style: AppTextStyles.size11w600.copyWith(color: AppColors.mutedText),
        ),
        const SizedBox(height: 8),
        Image.asset(iconAsset, width: 28, height: 28),
        const SizedBox(height: 6),
        if (showCountText) ...[
          Text(
            countText,
            style: AppTextStyles.titleSmall.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '%$percent',
            style: AppTextStyles.size11w600.copyWith(color: percentColor),
          ),
        ] else
          Text(
            '%$percent',
            style: AppTextStyles.h3.copyWith(
              fontWeight: FontWeight.w800,
              color: AppColors.bodyText,
            ),
          ),
        const SizedBox(height: 8),
        Container(
          width: 44,
          height: 2.5,
          decoration: BoxDecoration(
            color: dividerColor,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }
}
