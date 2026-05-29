# Vaqt

A Flutter app that helps Turkish-speaking Muslims build and maintain a consistent daily prayer habit through gentle tracking, meaningful streaks, and personal insights — without guilt or pressure.

## Stack

- **Frontend:** Flutter (single codebase for Android + iOS)
- **State management:** Provider
- **Navigation:** go_router
- **Backend:** Firebase (Auth + Firestore + FCM)
- **Local cache:** Hive
- **Prayer times API:** Diyanet (primary), Aladhan (fallback)
- **Localization:** flutter_localizations + intl (Turkish, with RTL/English groundwork)
- **Charts:** fl_chart
- **Calendar:** table_calendar
- **Compass:** sensors_plus + flutter_compass

## Project structure

Feature-first MVVM under `lib/features/{feature}/{data,domain,presentation}/`:

```
lib/
  core/
    constants/        # colors, themes, assets, text_styles
    domain/           # cross-feature domain types (PrayerSlot, etc.)
    services/         # app-wide services (AppPreferences, …)
  l10n/               # app_tr.arb + generated AppLocalizations
  features/
    auth/             # Firebase Auth + Google Sign-In + user repository
    home/             # Ana Sayfa — prayer tracking for today
    quick_mark/       # Hızlı İşaretle — backfill past prayers
    qibla/            # Compass + manual city selection fallback
    stats/            # 4-tab statistics (Overview / Weekly / Monthly / Yearly)
    profile/          # Profile + settings menu + logout
    location/         # City search/picker via geocoding
    splash/           # Decides splash → onboarding | login | home
  widgets/            # Shared widgets reused across features
  router.dart         # GoRouter with first-timer vs returning-user redirect
  main.dart
```

## Setup

### 1. Prerequisites

- Flutter SDK (stable channel)
- Xcode + CocoaPods (for iOS)
- Android Studio / Android SDK (for Android)
- A Firebase project — create one at <https://console.firebase.google.com>

### 2. Clone & install

```bash
git clone https://github.com/Faadi619/vaktinde.git vaqt
cd vaqt
flutter pub get
```

### 3. Configure Firebase (per developer)

Firebase config files are **not committed** — each developer points the app at their own Firebase project during dev (and the production keys are managed separately by the owner). Run:

```bash
# Install the FlutterFire CLI once
dart pub global activate flutterfire_cli

# Generate config for your Firebase project
flutterfire configure
```

This creates / overwrites:

- `lib/firebase_options.dart`
- `firebase.json`
- `android/app/google-services.json`
- `ios/Runner/GoogleService-Info.plist`
- `macos/Runner/GoogleService-Info.plist`

In Firebase Console for your project:

1. **Authentication → Sign-in method → Google** — enable
2. **Firestore Database** — create one (production mode, `europe-west1`)
3. **Project settings → Your apps → Android** — add your debug SHA-1 (run `cd android && ./gradlew signingReport` to get it)

Deploy Firestore security rules (rules live in `firestore.rules` after `flutterfire configure`):

```bash
firebase deploy --only firestore:rules
```

### 4. iOS only — pod install

```bash
cd ios && pod install && cd ..
```

### 5. Run

```bash
flutter run
```

## Common commands

```bash
flutter analyze              # static analysis
flutter pub get              # install deps
flutter gen-l10n             # regenerate l10n classes after editing app_tr.arb
dart run build_runner build  # codegen (Hive adapters, json_serializable)
flutter run                  # launch on connected device
flutter clean                # nuke build/ when things get weird
```

## Privacy + data policies (worth knowing before contributing)

- **Location is local-only.** GPS coordinates and city selection live in a Hive box on-device — never in Firestore. Permission is requested only when the user opens the Qibla screen for the first time, never on app launch or right after sign-in.
- **Notification permission** is requested **after** the first marked prayer, not on first launch.
- **All user-facing strings live in `lib/l10n/app_tr.arb`.** Zero hardcoded Turkish strings in widget code.
- **Streak system** is engagement-based: marking any prayer (including kaza/makeup) keeps the streak alive. Special days (travel / illness) never break it. Streak-evaluation runs at 6 AM, not midnight, to give night-owls time to mark late Isha.

## Project policy

- Feature-first MVVM (`features/{feature}/{data,domain,presentation}`)
- All colors via `AppColors`, all typography via `AppTextStyles`, all assets via `AppAssets` — never inline hex values, raw asset paths, or inline `TextStyle(...)`.
- No private `_Widget` classes returning Widgets — extract into public widget files. Helper methods returning Widgets are also out.
- Card border-radius is **18px**; Plus Jakarta Sans is bundled in `assets/fonts/`.

## Developer notes

There's a `documentation.md` in the repo that tracks current implementation progress at a higher level — read it for a snapshot of what's done vs. what's next.

## License

Private — not currently licensed for redistribution.
