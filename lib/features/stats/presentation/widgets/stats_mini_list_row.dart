import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';

/// One row inside a [StatsMiniListCard]: emoji leading + label/title + optional
/// subtitle below + optional trailing value on the right.
class StatsMiniListRow extends StatelessWidget {
  final String leading;
  final String label;
  final String? subtitle;
  final String? trailing;
  final Color labelColor;
  final Color trailingColor;

  const StatsMiniListRow({
    super.key,
    required this.leading,
    required this.label,
    this.subtitle,
    this.trailing,
    this.labelColor = AppColors.bodyText,
    this.trailingColor = AppColors.mutedText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(leading, style: AppTextStyles.bodySmall),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: subtitle == null
                      ? AppTextStyles.size11w600.copyWith(color: labelColor)
                      : AppTextStyles.size13w700.copyWith(color: labelColor),
                ),
                if (subtitle != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      subtitle!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.size11w500.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.mutedText,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          if (trailing != null)
            Text(
              trailing!,
              style: AppTextStyles.size15w600.copyWith(
                fontWeight: FontWeight.w700,
                color: trailingColor,
              ),
            ),
        ],
      ),
    );
  }
}
