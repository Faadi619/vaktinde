import 'package:flutter/material.dart';

import 'package:vaqt/core/constants/colors.dart';
import 'package:vaqt/core/constants/text_styles.dart';

class QiblaDegreeDisplay extends StatelessWidget {
  const QiblaDegreeDisplay({
    required this.degreeText,
    required this.directionLabel,
    super.key,
  });

  final String degreeText;
  final String directionLabel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: Column(
        children: [
          Text(
            degreeText,
            style: AppTextStyles.size46w800.copyWith(
              color: AppColors.primaryGreen,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            directionLabel,
            style: AppTextStyles.size15w500.copyWith(
              color: AppColors.mutedText,
            ),
          ),
        ],
      ),
    );
  }
}
