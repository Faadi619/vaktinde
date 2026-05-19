import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'features/auth/providers/auth_provider.dart';
import 'features/auth/presentation/auth_onboarding_screen.dart';
import 'features/auth/presentation/login_screen.dart';
import 'features/auth/presentation/auth_register_screen.dart';
import 'features/auth/presentation/auth_forgot_password_screen.dart';
import 'features/splash/presentation/splash_screen.dart';
import 'features/home/presentation/home_screen.dart';
import 'features/stats/presentation/stats_screen.dart';
import 'features/quick_mark/presentation/quick_mark_screen.dart';
import 'features/qibla/presentation/qibla_screen.dart';
import 'features/profile/presentation/profile_screen.dart';
import 'widgets/main_shell.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

/// Routes that unauthenticated users are allowed to visit.
const _authRoutes = {'/onboarding', '/login', '/register', '/forgot-password'};

GoRouter createRouter(BuildContext context) {
  final authProvider = context.read<AuthProvider>();

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/splash',
    redirect: (context, state) {
      final isAuthenticated = authProvider.isAuthenticated;
      final loc = state.matchedLocation;

      // Always allow the splash screen — it drives its own navigation
      if (loc == '/splash') return null;

      // Unauthenticated: only allow auth routes
      if (!isAuthenticated && !_authRoutes.contains(loc)) {
        return '/onboarding';
      }

      // Authenticated: redirect away from all auth routes to home
      if (isAuthenticated && _authRoutes.contains(loc)) {
        return '/home';
      }

      return null;
    },
    refreshListenable: authProvider,
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const AuthOnboardingScreen(),
      ),
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      GoRoute(
        path: '/register',
        builder: (context, state) => const AuthRegisterScreen(),
      ),
      GoRoute(
        path: '/forgot-password',
        builder: (context, state) => const AuthForgotPasswordScreen(),
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => MainShell(child: child),
        routes: [
          GoRoute(
            path: '/home',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: HomeScreen()),
          ),
          GoRoute(
            path: '/stats',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: StatsScreen()),
          ),
          GoRoute(
            path: '/quick-mark',
            builder: (context, state) => const QuickMarkScreen(),
          ),
          GoRoute(
            path: '/qibla',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: QiblaScreen()),
          ),
          GoRoute(
            path: '/profile',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: ProfileScreen()),
          ),
        ],
      ),
    ],
  );
}
