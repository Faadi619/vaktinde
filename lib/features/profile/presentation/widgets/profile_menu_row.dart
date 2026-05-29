import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';

/// One row inside a [ProfileMenuSection]: light-green icon tile + two-line
/// text + trailing chevron. Tappable.
class ProfileMenuRow extends StatelessWidget {
  final String iconAsset;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final bool showBottomDivider;

  const ProfileMenuRow({
    super.key,
    required this.iconAsset,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.showBottomDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: showBottomDivider
              ? const Border(
                  bottom: BorderSide(color: AppColors.rowDivider, width: 1),
                )
              : null,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Container(
              width: 34,
              height: 34,
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: AppColors.lightGreen,
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(iconAsset, fit: BoxFit.contain),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.titleSmall,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.caption,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            const Icon(
              Icons.chevron_right,
              size: 18,
              color: AppColors.disabledText,
            ),
          ],
        ),
      ),
    );
  }
}
