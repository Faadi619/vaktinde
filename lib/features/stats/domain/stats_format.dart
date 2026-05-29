import 'package:intl/intl.dart';

/// Formatting helpers shared across all stats screens.
///
/// Centralised so that future tweaks to display rules (locale, decimal
/// separator, percent sign placement, etc.) live in one place.
abstract class StatsFormat {
  /// Format a number with thousand separators (Turkish convention: `.`).
  static String integer(num value) =>
      NumberFormat.decimalPattern('tr').format(value);

  /// Format a value with **exactly two** decimal places (used for averages,
  /// per-prayer ratios like `6.71/7`, etc.).
  static String decimal(num value) =>
      NumberFormat('#,##0.00', 'tr').format(value);

  /// Format a 0..100 integer as a Turkish percent: `%87`.
  static String percentInt(int percent) => '%$percent';

  /// Format a 0..100 double as a Turkish percent rounded to the nearest int:
  /// `%87`. Use this when working with computed averages.
  static String percentDouble(double percent) =>
      '%${percent.round()}';
}
