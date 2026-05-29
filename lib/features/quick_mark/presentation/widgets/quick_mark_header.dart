import 'package:flutter/material.dart';

import '../../../../core/constants/text_styles.dart';
import 'quick_mark_info_button.dart';

class QuickMarkHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final String infoButtonLabel;
  final VoidCallback onInfoTap;

  const QuickMarkHeader({
    super.key,
    required this.title,
    required this.subtitle,
    required this.infoButtonLabel,
    required this.onInfoTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 16, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.h1,
                ),
                const SizedBox(height: 8),
                Text(
                  subtitle,
                  style: AppTextStyles.bodySmall,
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          QuickMarkInfoButton(label: infoButtonLabel, onTap: onInfoTap),
        ],
      ),
    );
  }
}
