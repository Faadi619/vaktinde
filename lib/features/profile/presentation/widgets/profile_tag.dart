import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';

/// Small rounded green pill chip used on the profile card (e.g. "Müslüman",
/// "Türkiye"). Optional leading icon.
class ProfileTag extends StatelessWidget {
  final String label;
  final IconData? icon;

  const ProfileTag({super.key, required this.label, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.lightGreen,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 11, color: AppColors.primaryGreen),
            const SizedBox(width: 4),
          ],
          Text(
            label,
            style: AppTextStyles.size11w600.copyWith(
              color: AppColors.primaryGreen,
            ),
          ),
        ],
      ),
    );
  }
}
