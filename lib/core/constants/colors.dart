import 'package:flutter/material.dart';

abstract class AppColors {
  // Primary palette
  static const Color primaryGreen = Color(0xFF2A9D5C);
  static const Color lightGreen = Color(0xFFE8F5EE);
  static const Color midGreen = Color(0xFFA8D5B5);
  static const Color darkGreen = Color(0xFF1F7A45);

  // Accent (amber — used for kaza state)
  static const Color amber = Color(0xFFC8852A);
  static const Color amberLightBackground = Color(0xFFFFF4E0);
  static const Color amberBorder = Color(0xFFF5CCA0);
  static const Color amberDarkText = Color(0xFFA75C0D);
  static const Color darkGreenText = Color(0xFF2A6640);

  // Backgrounds & surfaces
  static const Color background = Color(0xFFF4F4F0);
  static const Color cardBackground = Color(0xFFFFFFFF);

  // Text
  static const Color bodyText = Color(0xFF1A1A1A);
  static const Color mutedText = Color(0xFF888888);

  // Utility
  static const Color transparent = Colors.transparent;
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color divider = Color(0xFFE0E0E0);
  static const Color rowDivider = Color(0xFFEFEFEF);
  static const Color error = Color(0xFFD32F2F);
  static const Color inactiveNav = Color(0xFFBBBBBB);

  // Shadows
  static const Color cardShadow = Color(0x0F000000);
  static const Color shadowLight = Color(0x33000000);

  // UI components
  static const Color toggleInactive = Color(0xFFD0D0D0);

  // Stats — chart + accent
  static const Color barGradientLight = Color(0xFF4DB87A);
  static const Color blueTintBackground = Color(0xFFE6F1FF);
  static const Color blueText = Color(0xFF3A7BD5);
  static const Color purpleTintBackground = Color(0xFFEDE9FE);
  static const Color purpleText = Color(0xFF8B5CF6);
  static const Color redTintBackground = Color(0xFFFDE8E8);
  static const Color redMutedText = Color(0xFFC97B7B);
  static const Color redText = Color(0xFFE05252);
  static const Color redBorder = Color(0xFFF5C2C2);
  static const Color purpleStrongText = Color(0xFF7C3AED);
  static const Color purpleBorder = Color(0xFFC4B5FD);
  static const Color disabledText = Color(0xFFCCCCCC);

  // Dark mode
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkOnSurface = Color(0xFFE8E8E8);
  static const Color darkBackground = Color(0xFF121212);
}
