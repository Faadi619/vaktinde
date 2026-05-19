import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/colors.dart';
import '../../../l10n/app_localizations.dart';
import '../../../widgets/app_back_button.dart';
import '../providers/auth_provider.dart';
import 'widgets/forgot_password_form_view.dart';
import 'widgets/forgot_password_success_view.dart';

class AuthForgotPasswordScreen extends StatefulWidget {
  const AuthForgotPasswordScreen({super.key});

  @override
  State<AuthForgotPasswordScreen> createState() =>
      _AuthForgotPasswordScreenState();
}

class _AuthForgotPasswordScreenState extends State<AuthForgotPasswordScreen> {
  final _emailController = TextEditingController();
  bool _emailSent = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _sendResetLink(AuthProvider authProvider) async {
    final success = await authProvider.sendPasswordResetEmail(
      _emailController.text,
    );
    if (success && mounted) {
      setState(() => _emailSent = true);
    }
  }

  String _errorMessage(AppLocalizations l10n, String? code) {
    switch (code) {
      case 'invalid_email':
        return l10n.errorInvalidEmail;
      default:
        return l10n.errorSignInFailed;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final authProvider = context.watch<AuthProvider>();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                          l10n.forgotPasswordTitle,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            color: AppColors.bodyText,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          l10n.forgotPasswordSubtitle,
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.mutedText,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: _emailSent
                    ? ForgotPasswordSuccessView(
                        key: const ValueKey('success'),
                        email: _emailController.text.trim(),
                        l10n: l10n,
                        onBackToLogin: () => context.go('/login'),
                        onResend: () => _sendResetLink(authProvider),
                      )
                    : ForgotPasswordFormView(
                        key: const ValueKey('form'),
                        emailController: _emailController,
                        authProvider: authProvider,
                        l10n: l10n,
                        onSend: () => _sendResetLink(authProvider),
                        errorMessage: authProvider.errorCode != null
                            ? _errorMessage(l10n, authProvider.errorCode)
                            : null,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
