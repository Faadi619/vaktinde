import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';

/// One cell of the 4-column totals grid: tinted-circle icon, big number,
/// caption.
class StatsTotalCell extends StatelessWidget {
  final String iconAsset;
  final Color iconBackgroundColor;
  final String value;
  final String caption;

  const StatsTotalCell({
    super.key,
    required this.iconAsset,
    required this.iconBackgroundColor,
    required this.value,
    required this.caption,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: iconBackgroundColor,
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(3),
          child: SvgPicture.asset(iconAsset, fit: BoxFit.contain),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.h3.copyWith(fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 4),
        Text(
          caption,
          textAlign: TextAlign.center,
          style: AppTextStyles.size9w400.copyWith(
            fontSize: 10,
            height: 1.3,
            color: AppColors.mutedText,
          ),
        ),
      ],
    );
  }
}
