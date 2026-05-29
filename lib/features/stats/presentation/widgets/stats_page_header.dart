import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/constants/text_styles.dart';

class StatsPageHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onCalendarTap;

  const StatsPageHeader({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onCalendarTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 16, 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.h1),
                const SizedBox(height: 4),
                Text(subtitle, style: AppTextStyles.bodySmall),
              ],
            ),
          ),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: onCalendarTap,
            child: SvgPicture.asset(
              AppAssets.statsCalendarButton,
              width: 42,
              height: 42,
            ),
          ),
        ],
      ),
    );
  }
}
