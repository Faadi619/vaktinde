import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';

class QuickMarkOnTimeButton extends StatelessWidget {
  final bool isChecked;
  final VoidCallback onTap;

  const QuickMarkOnTimeButton({
    super.key,
    required this.isChecked,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 56, maxWidth: 100),
        child: Container(
          height: 42,
          decoration: BoxDecoration(
            color: isChecked ? AppColors.lightGreen : AppColors.cardBackground,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.primaryGreen, width: 2),
          ),
          alignment: Alignment.center,
          child: isChecked
              ? const Icon(
                  Icons.check,
                  size: 20,
                  color: AppColors.primaryGreen,
                )
              : const SizedBox.shrink(),
        ),
      ),
    );
  }
}
