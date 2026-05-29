import 'package:flutter/material.dart';

import '../../../../core/constants/text_styles.dart';

class QuickMarkSectionHeader extends StatelessWidget {
  final String title;
  final String trailingLabel;
  final VoidCallback onTrailingTap;

  const QuickMarkSectionHeader({
    super.key,
    required this.title,
    required this.trailingLabel,
    required this.onTrailingTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyles.titleLarge,
          ),
          GestureDetector(
            onTap: onTrailingTap,
            child: Text(
              trailingLabel,
              style: AppTextStyles.label,
            ),
          ),
        ],
      ),
    );
  }
}
