import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../l10n/app_localizations.dart';

class ForgotPasswordSuccessView extends StatelessWidget {
  const ForgotPasswordSuccessView({
    super.key,
    required this.email,
    required this.l10n,
    required this.onBackToLogin,
    required this.onResend,
  });

  final String email;
  final AppLocalizations l10n;
  final VoidCallback onBackToLogin;
  final VoidCallback onResend;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 48, 24, 36),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Email icon
          Center(
            child: Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: AppColors.lightGreen,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.email_outlined,
                size: 36,
                color: AppColors.primaryGreen,
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Title
          Text(
            l10n.forgotPasswordSuccessTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: AppColors.bodyText,
            ),
          ),
          const SizedBox(height: 12),

          // Body with email highlighted
          Text.rich(
            TextSpan(
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.mutedText,
                height: 1.6,
              ),
              children: [
                const TextSpan(text: 'Şifre sıfırlama bağlantısı '),
                TextSpan(
                  text: email,
                  style: const TextStyle(
                    color: AppColors.primaryGreen,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const TextSpan(
                  text: ' adresine gönderildi. Gelen kutunuzu kontrol edin.',
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 36),

          // Back to login button
          SizedBox(
            height: 52,
            child: ElevatedButton.icon(
              onPressed: onBackToLogin,
              icon: const Icon(
                Icons.chevron_left,
                size: 22,
                color: AppColors.white,
              ),
              label: Text(
                l10n.backToSignIn,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryGreen,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Resend link
          Center(
            child: GestureDetector(
              onTap: onResend,
              child: Text.rich(
                TextSpan(
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.mutedText,
                  ),
                  children: [
                    TextSpan(text: '${l10n.emailNotReceived} '),
                    TextSpan(
                      text: l10n.resendEmail,
                      style: const TextStyle(
                        color: AppColors.primaryGreen,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
