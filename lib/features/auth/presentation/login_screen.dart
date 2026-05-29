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

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String _errorMessage(AppLocalizations localizations, String? code) {
    switch (code) {
      case 'invalid_email':
        return localizations.errorInvalidEmail;
      case 'invalid_credentials':
        return localizations.errorInvalidCredentials;
      case 'sign_in_failed':
        return localizations.errorSignInFailed;
      default:
        return localizations.errorGeneric;
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final authProvider = context.watch<AuthProvider>();

    return Scaffold(
      body: Container(
        color: AppColors.background,
        child: SafeArea(
          child: Column(
            children: [
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
                            localizations.loginTitle,
                            style: AppTextStyles.h2,
                          ),
                          const SizedBox(height: 3),
                          Text(
                            localizations.loginSubtitle,
                            style: AppTextStyles.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 36),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      GoogleSignInButton(
                        text: localizations.continueWithGoogle,
                        onPressed: authProvider.isLoading
                            ? null
                            : authProvider.signInWithGoogle,
                        isLoading: authProvider.isLoading,
                      ),
                      const SizedBox(height: 20),
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
                              localizations.orEmailDivider,
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
                      AuthFieldLabel(localizations.emailLabel),
                      const SizedBox(height: 7),
                      AppTextField(
                        controller: _emailController,
                        hint: localizations.emailHint,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 16),
                      AuthFieldLabel(localizations.passwordLabel),
                      const SizedBox(height: 7),
                      AppTextField(
                        controller: _passwordController,
                        hint: localizations.passwordHint,
                        obscureText: _obscurePassword,
                        suffix: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: AppColors.mutedText,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () => context.push('/forgot-password'),
                          child: Text(
                            localizations.forgotPassword,
                            style: AppTextStyles.label,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 52,
                        child: FilledButton(
                          onPressed: authProvider.isLoading
                              ? null
                              : () => authProvider.signInWithEmailPassword(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                ),
                          style: FilledButton.styleFrom(
                            backgroundColor: AppColors.primaryGreen,
                            foregroundColor: AppColors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: authProvider.isLoading
                              ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: AppColors.white,
                                  ),
                                )
                              : Text(
                                  localizations.signIn,
                                  style: AppTextStyles.button,
                                ),
                        ),
                      ),
                      if (authProvider.errorCode != null) ...[
                        const SizedBox(height: 12),
                        Text(
                          _errorMessage(localizations, authProvider.errorCode),
                          style: AppTextStyles.size12w600.copyWith(
                            color: AppColors.error,
                          ),
                        ),
                      ],
                      const SizedBox(height: 16),
                      Center(
                        child: GestureDetector(
                          onTap: () => context.push('/register'),
                          child: Text.rich(
                            TextSpan(
                              style: AppTextStyles.bodySmall,
                              children: [
                                const TextSpan(text: 'Hesabın yok mu? '),
                                TextSpan(
                                  text: 'Kayıt ol',
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
      ),
    );
  }
}
