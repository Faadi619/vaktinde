import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';

/// One cell of the 4-stat strip on the profile card.
class ProfileStatCell extends StatelessWidget {
  final String iconAsset;
  final String value;
  final String label;
  final bool showTrailingDivider;

  const ProfileStatCell({
    super.key,
    required this.iconAsset,
    required this.value,
    required this.label,
    this.showTrailingDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              child: Row(
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    decoration: const BoxDecoration(
                      color: AppColors.lightGreen,
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(iconAsset, fit: BoxFit.contain),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          value,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.titleSmall.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          label,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.caption.copyWith(
                            fontSize: 9,
                            color: AppColors.mutedText,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (showTrailingDivider)
            const VerticalDivider(
              width: 1,
              thickness: 1,
              color: AppColors.rowDivider,
            ),
        ],
      ),
    );
  }
}
