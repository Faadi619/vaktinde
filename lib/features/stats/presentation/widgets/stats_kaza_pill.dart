import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';

/// Small amber pill showing the kaza-day count on the calendar card header.
class StatsKazaPill extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;

  const StatsKazaPill({super.key, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 24,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: AppColors.amberLightBackground,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.amberBorder, width: 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              AppAssets.statsKazaPillIcon,
              width: 12,
              height: 12,
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: AppTextStyles.size11w700.copyWith(color: AppColors.amber),
            ),
          ],
        ),
      ),
    );
  }
}
