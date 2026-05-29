import 'package:flutter/material.dart';

import '../../../../core/constants/text_styles.dart';

class ProfilePageHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const ProfilePageHeader({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.h1),
          const SizedBox(height: 6),
          Text(subtitle, style: AppTextStyles.bodySmall),
        ],
      ),
    );
  }
}
