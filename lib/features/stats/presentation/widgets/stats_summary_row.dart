import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';

/// One row inside the Haftalık Özeti card: tinted-circle icon, label, value.
class StatsSummaryRow extends StatelessWidget {
  final String iconAsset;
  final String label;
  final String value;
  final Color valueColor;
  final bool showBottomDivider;

  const StatsSummaryRow({
    super.key,
    required this.iconAsset,
    required this.label,
    required this.value,
    this.valueColor = AppColors.bodyText,
    this.showBottomDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: showBottomDivider
            ? const Border(
                bottom: BorderSide(color: AppColors.rowDivider, width: 1),
              )
            : null,
      ),
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          SizedBox(
            width: 32,
            height: 32,
            child: SvgPicture.asset(iconAsset, fit: BoxFit.contain),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.bodySmall.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.mutedText,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            value,
            style: AppTextStyles.titleSmall.copyWith(
              fontWeight: FontWeight.w800,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }
}
