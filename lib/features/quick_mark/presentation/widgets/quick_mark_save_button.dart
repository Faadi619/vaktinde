import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';

class QuickMarkSaveButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const QuickMarkSaveButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 54,
          decoration: BoxDecoration(
            color: AppColors.primaryGreen,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Color(0x592A9D5C),
                blurRadius: 16,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check, size: 20, color: AppColors.white),
              const SizedBox(width: 8),
              Text(
                label,
                style: AppTextStyles.button.copyWith(color: AppColors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
