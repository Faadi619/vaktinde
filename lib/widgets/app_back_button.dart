import 'package:flutter/material.dart';

import '../core/constants/colors.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: AppColors.divider),
      ),
      child: IconButton(
        onPressed: () => Navigator.of(context).maybePop(),
        icon: const Icon(Icons.chevron_left),
        color: AppColors.mutedText,
        padding: EdgeInsets.zero,
      ),
    );
  }
}
