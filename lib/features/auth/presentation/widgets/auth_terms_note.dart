import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../l10n/app_localizations.dart';

class AuthTermsNote extends StatelessWidget {
  const AuthTermsNote({super.key, required this.l10n});

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: const TextStyle(
          fontSize: 11,
          color: AppColors.mutedText,
          height: 1.5,
        ),
        children: [
          const TextSpan(text: 'Devam ederek '),
          TextSpan(
            text: l10n.termsOfService,
            style: const TextStyle(
              color: AppColors.primaryGreen,
              fontWeight: FontWeight.w600,
            ),
          ),
          const TextSpan(text: ' ve '),
          TextSpan(
            text: l10n.privacyPolicy,
            style: const TextStyle(
              color: AppColors.primaryGreen,
              fontWeight: FontWeight.w600,
            ),
          ),
          const TextSpan(text: "'nı kabul etmiş olursunuz."),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
