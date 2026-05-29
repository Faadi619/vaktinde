import 'package:flutter/material.dart';

import 'colors.dart';
import 'themes.dart';

/// Centralised typography for the app.
///
/// Two ways to use this:
///
/// 1. **Semantic styles** (preferred): pick the one that matches the UI role
///    — `AppTextStyles.h1`, `AppTextStyles.bodyMedium`, etc. These encode the
///    project's design conventions; if the design system changes, every call
///    site updates automatically.
///
/// 2. **Size+weight shortcuts**: when no semantic role fits (rare), use
///    `AppTextStyles.size14w600` etc. These are escape hatches — prefer a
///    semantic style first.
///
/// To override colour, weight, or size on a per-site basis, use `.copyWith()`:
///
/// ```dart
/// Text('x', style: AppTextStyles.bodyMedium.copyWith(color: AppColors.amber))
/// ```
///
/// All styles inherit the project font from [AppTheme.fontFamily]. Change
/// that single constant to swap the font globally.
abstract class AppTextStyles {
  // Single source of truth for the project font lives in [AppTheme.fontFamily].

  // ─── Internal helper ─────────────────────────────────────────────────────
  static TextStyle _make({
    required double size,
    required FontWeight weight,
    Color color = AppColors.bodyText,
    double? height,
    double? letterSpacing,
  }) {
    return TextStyle(
      fontFamily: AppTheme.fontFamily,
      fontSize: size,
      fontWeight: weight,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  // ─── Semantic display & headings ────────────────────────────────────────
  /// 57 / w700 — only used for the very largest hero text.
  static TextStyle get displayHuge => _make(
    size: 57,
    weight: FontWeight.w700,
  );

  /// 36 / w800 — onboarding hero "Vaqt".
  static TextStyle get displayLarge => _make(
    size: 36,
    weight: FontWeight.w800,
    height: 1.1,
  );

  /// 28 / w800 — major numerics (streak count, big stats).
  static TextStyle get displayMedium => _make(
    size: 28,
    weight: FontWeight.w800,
  );

  /// 26 / w800 — primary screen titles ("Hızlı İşaretle", "Profil").
  static TextStyle get h1 => _make(
    size: 26,
    weight: FontWeight.w800,
    height: 1.15,
  );

  /// 22 / w700 — section heroes / dialog titles.
  static TextStyle get h2 => _make(
    size: 22,
    weight: FontWeight.w700,
    height: 1.25,
  );

  /// 18 / w700 — subsection titles.
  static TextStyle get h3 => _make(
    size: 18,
    weight: FontWeight.w700,
    height: 1.25,
  );

  // ─── Semantic titles (cards, list rows) ─────────────────────────────────
  /// 16 / w800 — card / section header titles ("Son İşaretlemeler").
  static TextStyle get titleLarge => _make(
    size: 16,
    weight: FontWeight.w800,
  );

  /// 15 / w700 — list-row titles (prayer names).
  static TextStyle get titleMedium => _make(
    size: 15,
    weight: FontWeight.w700,
  );

  /// 14 / w700 — small titles (date pill, recent-entry date).
  static TextStyle get titleSmall => _make(
    size: 14,
    weight: FontWeight.w700,
  );

  // ─── Semantic body ──────────────────────────────────────────────────────
  /// 15 / w400 — primary body / paragraph text.
  static TextStyle get bodyLarge => _make(
    size: 15,
    weight: FontWeight.w400,
    height: 1.5,
  );

  /// 14 / w400 — default body / form input text.
  static TextStyle get bodyMedium => _make(
    size: 14,
    weight: FontWeight.w400,
    height: 1.4,
  );

  /// 13 / w400 — secondary body / subtitle text.
  static TextStyle get bodySmall => _make(
    size: 13,
    weight: FontWeight.w400,
    color: AppColors.mutedText,
    height: 1.5,
  );

  // ─── Semantic supporting ────────────────────────────────────────────────
  /// 13 / w600 — actionable labels ("Tüm Geçmiş", inline links).
  static TextStyle get label => _make(
    size: 13,
    weight: FontWeight.w600,
    color: AppColors.primaryGreen,
  );

  /// 12 / w400 — captions, helper subtitles (muted by default).
  static TextStyle get caption => _make(
    size: 12,
    weight: FontWeight.w400,
    color: AppColors.mutedText,
  );

  /// 11 / w500 — overline-like labels (sub-time tags, nav labels).
  static TextStyle get overline => _make(
    size: 11,
    weight: FontWeight.w500,
  );

  /// 16 / w800 — primary buttons.
  static TextStyle get button => _make(
    size: 16,
    weight: FontWeight.w800,
  );

  /// 14 / w600 — secondary / smaller buttons.
  static TextStyle get buttonSmall => _make(
    size: 14,
    weight: FontWeight.w600,
  );

  // ─── Size+weight shortcuts (escape hatch) ───────────────────────────────
  // Use these only when no semantic style fits. They preserve the project
  // font family but don't carry design intent.
  static TextStyle get size9w400 => _make(size: 9, weight: FontWeight.w400);
  static TextStyle get size11w500 => _make(size: 11, weight: FontWeight.w500);
  static TextStyle get size11w600 => _make(size: 11, weight: FontWeight.w600);
  static TextStyle get size11w700 => _make(size: 11, weight: FontWeight.w700);
  static TextStyle get size12w500 => _make(size: 12, weight: FontWeight.w500);
  static TextStyle get size12w600 => _make(size: 12, weight: FontWeight.w600);
  static TextStyle get size12w700 => _make(size: 12, weight: FontWeight.w700);
  static TextStyle get size12_5w500 => _make(size: 12.5, weight: FontWeight.w500);
  static TextStyle get size13w500 => _make(size: 13, weight: FontWeight.w500);
  static TextStyle get size13w600 => _make(size: 13, weight: FontWeight.w600);
  static TextStyle get size13w700 => _make(size: 13, weight: FontWeight.w700);
  static TextStyle get size14w500 => _make(size: 14, weight: FontWeight.w500);
  static TextStyle get size14w600 => _make(size: 14, weight: FontWeight.w600);
  static TextStyle get size15w500 => _make(size: 15, weight: FontWeight.w500);
  static TextStyle get size15w600 => _make(size: 15, weight: FontWeight.w600);
  static TextStyle get size16w600 => _make(size: 16, weight: FontWeight.w600);
  static TextStyle get size16w700 => _make(size: 16, weight: FontWeight.w700);
  static TextStyle get size22w300 => _make(size: 22, weight: FontWeight.w300);
  static TextStyle get size22w700 => _make(size: 22, weight: FontWeight.w700);
  static TextStyle get size22w800 => _make(size: 22, weight: FontWeight.w800);
  static TextStyle get size24w700 => _make(size: 24, weight: FontWeight.w700);
  static TextStyle get size16w400 => _make(size: 16, weight: FontWeight.w400, height: 1.5);
  static TextStyle get size24w600 => _make(size: 24, weight: FontWeight.w600);
  static TextStyle get size32w700 => _make(size: 32, weight: FontWeight.w700);
  static TextStyle get size32w800 => _make(size: 32, weight: FontWeight.w800);
  static TextStyle get size45w700 => _make(size: 45, weight: FontWeight.w700);
  static TextStyle get size45w800 => _make(size: 45, weight: FontWeight.w800);
  static TextStyle get size46w800 => _make(size: 46, weight: FontWeight.w800);
  static TextStyle get size57w700 => _make(size: 57, weight: FontWeight.w700);
}
