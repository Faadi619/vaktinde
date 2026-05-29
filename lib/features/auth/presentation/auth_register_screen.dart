import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/text_styles.dart';
import '../../../l10n/app_localizations.dart';
import '../../../widgets/app_back_button.dart';
import '../providers/auth_provider.dart';
import 'widgets/auth_field_label.dart';
import '../../../widgets/app_text_field.dart';
import 'widgets/google_sign_in_button.dart';
import 'widgets/password_strength_bar.dart';

class AuthRegisterScreen extends StatefulWidget {
  const AuthRegisterScreen({super.key});

  @override
  State<AuthRegisterScreen> createState() => _AuthRegisterScreenState();
}

class _AuthRegisterScreenState extends State<AuthRegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _termsAccepted = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Password strength: 0 = none, 1 = weak, 2 = medium, 3 = strong
  int _passwordStrength(String password) {
    if (password.isEmpty) return 0;
    int score = 0;
    if (password.length >= 8) {
      score++;
    }
    if (password.contains(RegExp(r'[A-Z]')) ||
        password.contains(RegExp(r'[0-9]'))) {
      score++;
    }
    if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      score++;
    }
    return score.clamp(1, 3);
  }

  String _errorMessage(AppLocalizations l10n, String? code) {
    switch (code) {
      case 'email_already_in_use':
        return l10n.errorEmailAlreadyInUse;
      case 'invalid_email':
        return l10n.errorInvalidEmail;
      case 'weak_password':
        return l10n.errorWeakPassword;
      default:
        return l10n.errorSignInFailed;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final authProvider = context.watch<AuthProvider>();
    final strength = _passwordStrength(_passwordController.text);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // ── Header ────────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 14, 20, 0),
              child: Row(
                children: [
                  const AppBackButton(),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.registerTitle,
                          style: AppTextStyles.h2,
                        ),
                        const SizedBox(height: 3),
                        Text(
                          l10n.registerSubtitle,
                          style: AppTextStyles.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // ── Form ──────────────────────────────────────────────────
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 36),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Google register button
                    GoogleSignInButton(
                      text: l10n.registerWithGoogle,
                      onPressed: authProvider.isLoading
                          ? null
                          : authProvider.signInWithGoogle,
                      isLoading: authProvider.isLoading,
                    ),
                    const SizedBox(height: 20),

                    // OR divider
                    Row(
                      children: [
                        const Expanded(
                          child: Divider(
                            color: AppColors.divider,
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            l10n.orEmailDivider,
                            style: AppTextStyles.size12w600.copyWith(
                              color: AppColors.mutedText,
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Divider(
                            color: AppColors.divider,
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Name field
                    AuthFieldLabel(l10n.fullNameLabel),
                    const SizedBox(height: 7),
                    AppTextField(
                      controller: _nameController,
                      hint: l10n.fullNameHint,
                      keyboardType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                    ),
                    const SizedBox(height: 16),

                    // Email field
                    AuthFieldLabel(l10n.emailLabel),
                    const SizedBox(height: 7),
                    AppTextField(
                      controller: _emailController,
                      hint: l10n.emailHint,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 16),

                    // Password field
                    AuthFieldLabel(l10n.passwordLabel),
                    const SizedBox(height: 7),
                    AppTextField(
                      controller: _passwordController,
                      hint: l10n.passwordHint,
                      obscureText: _obscurePassword,
                      onChanged: (_) => setState(() {}),
                      suffix: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: AppColors.mutedText,
                          size: 20,
                        ),
                        onPressed: () => setState(
                          () => _obscurePassword = !_obscurePassword,
                        ),
                      ),
                    ),

                    // Password strength indicator
                    if (_passwordController.text.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      PasswordStrengthBar(
                        strength: strength,
                        label: strength == 1
                            ? l10n.passwordStrengthWeak
                            : strength == 2
                            ? l10n.passwordStrengthMedium
                            : l10n.passwordStrengthStrong,
                      ),
                    ],

                    const SizedBox(height: 16),

                    // Terms checkbox
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: _termsAccepted,
                          onChanged: (v) =>
                              setState(() => _termsAccepted = v ?? false),
                          activeColor: AppColors.primaryGreen,
                          visualDensity: VisualDensity.compact,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text.rich(
                              TextSpan(
                                style: AppTextStyles.caption.copyWith(
                                  height: 1.4,
                                ),
                                children: [
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
                                  TextSpan(text: l10n.termsCheckboxText),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Error message
                    if (authProvider.errorCode != null) ...[
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.error.withValues(alpha: 0.08),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          _errorMessage(l10n, authProvider.errorCode),
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.error,
                          ),
                        ),
                      ),
                    ],

                    const SizedBox(height: 24),

                    // Create account button
                    SizedBox(
                      height: 52,
                      child: ElevatedButton(
                        onPressed:
                            (authProvider.isLoading ||
                                _nameController.text.trim().isEmpty ||
                                _emailController.text.trim().isEmpty ||
                                _passwordController.text.isEmpty ||
                                !_termsAccepted)
                            ? null
                            : () async {
                                await authProvider.registerWithEmailPassword(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                  displayName: _nameController.text,
                                );
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryGreen,
                          disabledBackgroundColor: AppColors.primaryGreen
                              .withValues(alpha: 0.5),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: authProvider.isLoading
                            ? const SizedBox(
                                width: 22,
                                height: 22,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.5,
                                  color: AppColors.white,
                                ),
                              )
                            : Text(
                                l10n.createAccount,
                                style: AppTextStyles.size16w600.copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Already have account
                    Center(
                      child: GestureDetector(
                        onTap: () => context.go('/login'),
                        child: Text.rich(
                          TextSpan(
                            style: AppTextStyles.bodySmall,
                            children: [
                              const TextSpan(text: 'Zaten hesabın var mı? '),
                              TextSpan(
                                text: 'Giriş yap',
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
