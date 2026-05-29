import 'package:flutter/material.dart';

import 'colors.dart';
import 'text_styles.dart';

abstract class AppTheme {
  static const double cardBorderRadius = 18.0;
  static const double bottomNavHeight = 83.0;
  static const String fontFamily = 'PlusJakartaSans';

  /// Maps Material's TextTheme slots to the project's [AppTextStyles] catalog.
  ///
  /// Material widgets (AppBar titles, ListTile, etc.) read from this TextTheme,
  /// so we delegate to AppTextStyles so the catalog is the single source of
  /// truth for typography.
  static TextTheme get _textTheme => TextTheme(
    displayLarge: AppTextStyles.size57w700,
    displayMedium: AppTextStyles.size45w700,
    displaySmall: AppTextStyles.displayLarge.copyWith(fontWeight: FontWeight.w700),
    headlineLarge: AppTextStyles.size32w700.copyWith(color: AppColors.darkGreen),
    headlineMedium: AppTextStyles.displayMedium.copyWith(
      fontWeight: FontWeight.w700,
      color: AppColors.darkGreen,
    ),
    headlineSmall: AppTextStyles.size24w600,
    titleLarge: AppTextStyles.h2.copyWith(fontWeight: FontWeight.w600),
    titleMedium: AppTextStyles.size16w600,
    titleSmall: AppTextStyles.buttonSmall,
    bodyLarge: AppTextStyles.size16w400,
    bodyMedium: AppTextStyles.bodyMedium,
    bodySmall: AppTextStyles.caption,
    labelLarge: AppTextStyles.buttonSmall,
    labelMedium: AppTextStyles.size12w500,
    labelSmall: AppTextStyles.overline.copyWith(color: AppColors.mutedText),
  );

  static ThemeData get light => ThemeData(
    useMaterial3: true,
    fontFamily: fontFamily,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryGreen,
      brightness: Brightness.light,
      primary: AppColors.primaryGreen,
      onPrimary: AppColors.white,
      secondary: AppColors.darkGreen,
      onSecondary: AppColors.white,
      surface: AppColors.cardBackground,
      onSurface: AppColors.bodyText,
      error: AppColors.error,
    ),
    scaffoldBackgroundColor: AppColors.background,
    textTheme: _textTheme,
    cardTheme: CardThemeData(
      color: AppColors.cardBackground,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cardBorderRadius),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryGreen,
        foregroundColor: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: AppTextStyles.buttonSmall,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primaryGreen,
        side: const BorderSide(color: AppColors.primaryGreen),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.lightGreen,
      hintStyle: AppTextStyles.bodyMedium.copyWith(color: AppColors.mutedText),
      labelStyle: AppTextStyles.bodyMedium.copyWith(color: AppColors.mutedText),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.midGreen),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.midGreen),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.primaryGreen, width: 2),
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.divider,
      space: 1,
      thickness: 1,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.background,
      foregroundColor: AppColors.bodyText,
      elevation: 0,
      titleTextStyle: AppTextStyles.h3,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.cardBackground,
      selectedItemColor: AppColors.primaryGreen,
      unselectedItemColor: AppColors.mutedText,
      elevation: 8,
    ),
  );

  static ThemeData get dark => ThemeData(
    useMaterial3: true,
    fontFamily: fontFamily,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryGreen,
      brightness: Brightness.dark,
      primary: AppColors.primaryGreen,
      onPrimary: AppColors.white,
      surface: AppColors.darkSurface,
      onSurface: AppColors.darkOnSurface,
      error: AppColors.error,
    ),
    textTheme: _textTheme.apply(
      bodyColor: AppColors.darkOnSurface,
      displayColor: AppColors.darkOnSurface,
    ),
    scaffoldBackgroundColor: AppColors.darkBackground,
    cardTheme: CardThemeData(
      color: AppColors.darkSurface,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cardBorderRadius),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryGreen,
        foregroundColor: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkBackground,
      foregroundColor: AppColors.darkOnSurface,
      elevation: 0,
      titleTextStyle: AppTextStyles.h3.copyWith(color: AppColors.darkOnSurface),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkSurface,
      selectedItemColor: AppColors.primaryGreen,
      unselectedItemColor: AppColors.mutedText,
    ),
  );
}
