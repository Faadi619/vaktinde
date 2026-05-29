import 'package:flutter/material.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../widgets/app_circle_arrow_button.dart';

class StatsDateRangeNavigator extends StatelessWidget {
  final String rangeLabel;
  final VoidCallback onPreviousTap;
  final VoidCallback onNextTap;
  final VoidCallback onPillTap;

  const StatsDateRangeNavigator({
    super.key,
    required this.rangeLabel,
    required this.onPreviousTap,
    required this.onNextTap,
    required this.onPillTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 36,
        child: Row(
          children: [
            AppCircleArrowButton(
              icon: Icons.chevron_left,
              size: 34,
              onTap: onPreviousTap,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: GestureDetector(
                onTap: onPillTap,
                child: Container(
                  height: 36,
                  decoration: BoxDecoration(
                    color: AppColors.cardBackground,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.rowDivider),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppAssets.calenderIcon,
                        width: 15,
                        height: 15,
                      ),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          rangeLabel,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.titleSmall,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.expand_more,
                        size: 14,
                        color: AppColors.bodyText,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            AppCircleArrowButton(
              icon: Icons.chevron_right,
              size: 34,
              onTap: onNextTap,
            ),
          ],
        ),
      ),
    );
  }
}
