import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';

/// Light-green motivational card on the Yıllık tab. Two-line bold title +
/// dark-green body paragraph + heart emoji at bottom-left + decorative
/// sprouts at bottom-right (50% opacity).
class StatsMotivationalCard extends StatelessWidget {
  final String titleLine1;
  final String titleLine2;
  final String body;

  const StatsMotivationalCard({
    super.key,
    required this.titleLine1,
    required this.titleLine2,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 14),
        decoration: BoxDecoration(
          color: AppColors.lightGreen,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  titleLine1,
                  style: AppTextStyles.titleSmall.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  titleLine2,
                  style: AppTextStyles.titleSmall.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  body,
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.darkGreenText,
                  ),
                ),
                const SizedBox(height: 10),
                Text('💚', style: AppTextStyles.bodySmall),
              ],
            ),
            const Positioned(
              right: 4,
              bottom: 4,
              child: Opacity(
                opacity: 0.5,
                child: Text('🌱', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
