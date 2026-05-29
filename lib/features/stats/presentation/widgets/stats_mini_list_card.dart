import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import 'stats_mini_list_row.dart';

/// Compact mini-card used in pairs on Yıllık: header title + list of
/// [StatsMiniListRow]s + a footer "see more" link with chevron-right.
class StatsMiniListCard extends StatelessWidget {
  final String title;
  final List<StatsMiniListRow> rows;
  final String footerLabel;
  final VoidCallback onFooterTap;

  const StatsMiniListCard({
    super.key,
    required this.title,
    required this.rows,
    required this.footerLabel,
    required this.onFooterTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 12),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: AppTextStyles.titleMedium.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 10),
          ...rows,
          const SizedBox(height: 6),
          GestureDetector(
            onTap: onFooterTap,
            child: Row(
              children: [
                Text(
                  footerLabel,
                  style: AppTextStyles.size9w400.copyWith(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryGreen,
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(
                  Icons.chevron_right,
                  size: 14,
                  color: AppColors.primaryGreen,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
