import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';

/// One of the 3 cards in the monthly insights row: icon + value + caption.
class StatsInsightCell extends StatelessWidget {
  final String iconAsset;
  final String value;
  final String caption;
  final Color valueColor;

  const StatsInsightCell({
    super.key,
    required this.iconAsset,
    required this.value,
    required this.caption,
    this.valueColor = AppColors.bodyText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 30,
            height: 30,
            child: SvgPicture.asset(iconAsset, fit: BoxFit.contain),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.titleLarge.copyWith(color: valueColor),
          ),
          const SizedBox(height: 4),
          Text(
            caption,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.size9w400.copyWith(
              fontSize: 10,
              color: AppColors.mutedText,
              height: 1.25,
            ),
          ),
        ],
      ),
    );
  }
}
