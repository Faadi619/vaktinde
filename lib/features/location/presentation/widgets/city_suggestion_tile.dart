import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../domain/city_suggestion.dart';

class CitySuggestionTile extends StatelessWidget {
  final CitySuggestion suggestion;
  final VoidCallback onTap;

  const CitySuggestionTile({
    super.key,
    required this.suggestion,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.cardBackground,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                color: AppColors.primaryGreen,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  suggestion.label,
                  style: AppTextStyles.size15w600,
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: AppColors.mutedText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
