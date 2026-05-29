/// Visual state of a day cell in the monthly calendar.
enum DayState {
  /// All prayers completed.
  full,

  /// At least one prayer missed but some completed. `missedCount` indicates
  /// how many were missed (renders that many pip dots).
  partial,

  /// All prayers missed.
  missed,

  /// User marked the day as a special day (travel, illness, etc.).
  special,

  /// Today, with partial completion (visual focus ring around amber cell).
  today,

  /// Future day in the visible month.
  future,
}
