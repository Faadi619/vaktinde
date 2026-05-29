import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';

class QuickMarkKazaButton extends StatelessWidget {
  final String label;
  final bool isChecked;
  final VoidCallback onTap;

  const QuickMarkKazaButton({
    super.key,
    required this.label,
    required this.isChecked,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final foregroundColor = isChecked
        ? AppColors.amberDarkText
        : AppColors.amber;
    return GestureDetector(
      onTap: onTap,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 80, maxWidth: 110),
        child: Container(
          height: 42,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: isChecked
                ? AppColors.amberLightBackground
                : AppColors.cardBackground,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.amberBorder, width: 1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.access_time, size: 16, color: foregroundColor),
              const SizedBox(width: 6),
              Flexible(
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.size13w700.copyWith(
                    color: foregroundColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
