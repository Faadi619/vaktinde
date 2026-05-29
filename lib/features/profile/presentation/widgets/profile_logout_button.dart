import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';

class ProfileLogoutButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool isLoading;

  const ProfileLogoutButton({
    super.key,
    required this.label,
    required this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: isLoading ? null : onTap,
        behavior: HitTestBehavior.opaque,
        child: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isLoading)
                const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: AppColors.redText,
                  ),
                )
              else
                SvgPicture.asset(
                  AppAssets.profileLogout,
                  width: 18,
                  height: 18,
                ),
              const SizedBox(width: 8),
              Text(
                label,
                style: AppTextStyles.titleMedium.copyWith(
                  color: AppColors.redText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
