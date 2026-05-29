import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';

class QuickMarkRecentEntry extends StatelessWidget {
  final String dateText;
  final String summaryText;
  final bool showBottomDivider;
  final VoidCallback onTap;

  const QuickMarkRecentEntry({
    super.key,
    required this.dateText,
    required this.summaryText,
    required this.onTap,
    this.showBottomDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: showBottomDivider
              ? const Border(
                  bottom: BorderSide(color: AppColors.rowDivider, width: 1),
                )
              : null,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: AppColors.lightGreen,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.calendar_today_outlined,
                size: 18,
                color: AppColors.primaryGreen,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dateText,
                    style: AppTextStyles.size13w700,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    summaryText,
                    style: AppTextStyles.caption,
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right,
              size: 20,
              color: AppColors.mutedText,
            ),
          ],
        ),
      ),
    );
  }
}
