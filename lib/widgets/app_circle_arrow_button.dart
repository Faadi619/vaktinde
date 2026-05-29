import 'package:flutter/material.dart';

import '../core/constants/colors.dart';

/// Small circular button with an outlined border and a centred icon — used
/// for prev/next arrows in date navigators across the app.
class AppCircleArrowButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final double size;

  const AppCircleArrowButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.size = 36,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.rowDivider),
        ),
        child: Icon(icon, size: size * 0.5, color: AppColors.bodyText),
      ),
    );
  }
}
