import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';

class StatsTabBar extends StatelessWidget {
  final List<String> labels;
  final int activeIndex;
  final ValueChanged<int> onTabSelected;

  const StatsTabBar({
    super.key,
    required this.labels,
    required this.activeIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(14),
          boxShadow: const [
            BoxShadow(
              color: Color(0x12000000),
              blurRadius: 6,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          children: List.generate(labels.length, (index) {
            final isActive = index == activeIndex;
            return Expanded(
              child: GestureDetector(
                onTap: () => onTabSelected(index),
                behavior: HitTestBehavior.opaque,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Center(
                      child: Text(
                        labels[index],
                        style: AppTextStyles.size12w600.copyWith(
                          color: isActive
                              ? AppColors.primaryGreen
                              : AppColors.mutedText,
                        ),
                      ),
                    ),
                    if (isActive)
                      Positioned(
                        bottom: 6,
                        child: Container(
                          width: 50,
                          height: 2,
                          decoration: BoxDecoration(
                            color: AppColors.primaryGreen,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
