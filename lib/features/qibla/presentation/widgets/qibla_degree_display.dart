import 'package:flutter/material.dart';

import 'package:vaqt/core/constants/colors.dart';

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
            style: const TextStyle(
              fontSize: 46,
              fontWeight: FontWeight.w800,
              color: AppColors.primaryGreen,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            directionLabel,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: AppColors.mutedText,
            ),
          ),
        ],
      ),
    );
  }
}
