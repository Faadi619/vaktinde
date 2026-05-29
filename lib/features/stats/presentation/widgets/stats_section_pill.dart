import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';

/// Small white pill with a label + chevron-down. Used in stats section headers
/// to indicate a selectable date range ("Son 7 Gün", "Bu Hafta", etc.).
class StatsSectionPill extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const StatsSectionPill({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 26,
        padding: const EdgeInsets.symmetric(horizontal: 11),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.rowDivider),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: AppTextStyles.size12w600.copyWith(
                color: AppColors.mutedText,
              ),
            ),
            const SizedBox(width: 6),
            SvgPicture.asset(
              AppAssets.statsChevronDown,
              width: 13,
              height: 13,
            ),
          ],
        ),
      ),
    );
  }
}
