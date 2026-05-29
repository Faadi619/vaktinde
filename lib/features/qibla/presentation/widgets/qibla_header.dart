import 'package:flutter/material.dart';

import 'package:vaqt/core/constants/colors.dart';
import 'package:vaqt/core/constants/text_styles.dart';

class QiblaHeader extends StatelessWidget {
  const QiblaHeader({
    required this.title,
    required this.subtitle,
    required this.mapButtonLabel,
    required this.onMapTap,
    super.key,
  });

  final String title;
  final String subtitle;
  final String mapButtonLabel;
  final VoidCallback onMapTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.h1,
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: AppTextStyles.bodySmall,
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: onMapTap,
          child: Container(
            width: 61,
            height: 59,
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(14),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.cardShadow,
                  blurRadius: 10,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.map_outlined,
                  color: AppColors.primaryGreen,
                  size: 22,
                ),
                const SizedBox(height: 3),
                Text(
                  mapButtonLabel,
                  style: AppTextStyles.size11w600.copyWith(
                    color: AppColors.primaryGreen,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
