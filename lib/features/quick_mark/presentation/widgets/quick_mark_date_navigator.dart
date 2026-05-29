import 'package:flutter/material.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../widgets/app_circle_arrow_button.dart';

class QuickMarkDateNavigator extends StatelessWidget {
  final String dateText;
  final VoidCallback onPreviousTap;
  final VoidCallback onNextTap;
  final VoidCallback onDatePillTap;

  const QuickMarkDateNavigator({
    super.key,
    required this.dateText,
    required this.onPreviousTap,
    required this.onNextTap,
    required this.onDatePillTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 38,
        child: Row(
          children: [
            AppCircleArrowButton(
              icon: Icons.chevron_left,
              onTap: onPreviousTap,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: GestureDetector(
                onTap: onDatePillTap,
                child: Container(
                  height: 38,
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
                        width: 16,
                        height: 16,
                      ),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          dateText,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.titleSmall,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.expand_more,
                        size: 16,
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
              onTap: onNextTap,
            ),
          ],
        ),
      ),
    );
  }
}
