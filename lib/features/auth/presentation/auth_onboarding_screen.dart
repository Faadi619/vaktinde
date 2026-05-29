import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/text_styles.dart';
import '../../../core/services/app_preferences.dart';
import '../../../l10n/app_localizations.dart';
import 'widgets/auth_feature_row.dart';
import 'widgets/auth_terms_note.dart';

class AuthOnboardingScreen extends StatelessWidget {
  const AuthOnboardingScreen({super.key});

  Future<void> _exitTo(BuildContext context, String route) async {
    await AppPreferences.setHasSeenOnboarding(true);
    if (!context.mounted) return;
    context.go(route);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          // ── Hero section ──────────────────────────────────────────────
          Expanded(
            flex: 5,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [AppColors.primaryGreen, AppColors.darkGreen],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
              ),
              child: SafeArea(
                bottom: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 16),
                    // Mosque icon illustration
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: AppColors.white.withValues(alpha: 0.13),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: const Icon(
                        Icons.mosque_rounded,
                        size: 60,
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Vaqt',
                      style: AppTextStyles.displayLarge.copyWith(
                        color: AppColors.white,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      l10n.onboardingAppTagline,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.bodyLarge.copyWith(
                        color: AppColors.white.withValues(alpha: 0.80),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),

          // ── Feature list + CTAs ───────────────────────────────────────
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 28),
                  AuthFeatureRow(
                    icon: Icons.access_time_rounded,
                    title: l10n.onboardingFeature1Title,
                    subtitle: l10n.onboardingFeature1Sub,
                  ),
                  const SizedBox(height: 20),
                  AuthFeatureRow(
                    icon: Icons.local_fire_department_rounded,
                    title: l10n.onboardingFeature2Title,
                    subtitle: l10n.onboardingFeature2Sub,
                  ),
                  const SizedBox(height: 20),
                  AuthFeatureRow(
                    icon: Icons.explore_rounded,
                    title: l10n.onboardingFeature3Title,
                    subtitle: l10n.onboardingFeature3Sub,
                  ),
                  const Spacer(),
                  // Primary CTA
                  SizedBox(
                    height: 52,
                    child: ElevatedButton.icon(
                      onPressed: () => _exitTo(context, '/register'),
                      icon: const Icon(
                        Icons.person_add_rounded,
                        size: 20,
                        color: AppColors.white,
                      ),
                      label: Text(
                        l10n.onboardingCreateAccount,
                        style: AppTextStyles.size16w600.copyWith(
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
                  const SizedBox(height: 12),
                  // Secondary CTA
                  SizedBox(
                    height: 52,
                    child: OutlinedButton(
                      onPressed: () => _exitTo(context, '/login'),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: AppColors.divider,
                          width: 1.5,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        l10n.onboardingSignIn,
                        style: AppTextStyles.size16w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Terms note
                  AuthTermsNote(l10n: l10n),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
