import '../../l10n/app_localizations.dart';

/// The five obligatory daily prayers, in chronological order.
///
/// Names match the Turkish localization keys (Sabah / Öğle / İkindi / Akşam
/// / Yatsı). Firestore stores prayers as string keys — see [firestoreKey] for
/// the canonical string form.
enum PrayerSlot {
  fajr,
  dhuhr,
  asr,
  maghrib,
  isha,
}

extension PrayerSlotX on PrayerSlot {
  /// Stable string key used in Firestore documents (e.g.
  /// `users/{uid}/days/{date}.completed = ['fajr', 'dhuhr']`).
  String get firestoreKey => name;

  /// Localized display name pulled from the app's l10n bundle.
  String localizedName(AppLocalizations l10n) {
    switch (this) {
      case PrayerSlot.fajr:
        return l10n.prayerFajr;
      case PrayerSlot.dhuhr:
        return l10n.prayerDhuhr;
      case PrayerSlot.asr:
        return l10n.prayerAsr;
      case PrayerSlot.maghrib:
        return l10n.prayerMaghrib;
      case PrayerSlot.isha:
        return l10n.prayerIsha;
    }
  }
}
