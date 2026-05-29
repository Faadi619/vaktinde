# Vaqt Project Documentation

## Quick Start (Developer)
- Requirements: Flutter SDK (stable), Dart SDK, Android Studio/Xcode, and a connected simulator or device.
- Install packages:
  - `flutter pub get`
- Run the app:
  - `flutter run`
- Check code quality:
  - `flutter analyze`
- Run tests:
  - `flutter test`

## Project Layout (At a Glance)
- `lib/main.dart`: app entry, providers, router wiring.
- `lib/core/`: shared constants, utilities, and extensions.
- `lib/features/`: feature-first modules (auth, home, prayers, stats, qibla, etc.).
- `lib/l10n/`: localization files (`app_tr.arb` and generated localization classes).
- `lib/widgets/`: shared reusable UI components.
- `assets/`: fonts, images, icons, and animations.
- `test/`: widget and unit tests.

## Purpose
Vaqt is a mobile application for Turkish-speaking users to support daily prayer consistency.

The app is being built with Flutter and Firebase, with a clear focus on:
- Simple daily use
- Reliable prayer tracking
- Clean and accessible interface
- Long-term habit support through streaks and insights

## Current Progress
The following work is completed so far.

### 1. Core App Setup
- Flutter project structure is ready.
- Project dependencies are configured for Firebase, Provider, routing, local storage, notifications, and localization.
- Theme and color system is centralized.
- Local PlusJakartaSans font is configured from bundled asset files.

### 2. Localization Base
- Turkish localization files are included and connected.
- App-level localization delegate usage is wired.
- Shared text keys are available for UI usage.

### 3. Authentication Foundation
- Authentication architecture has been implemented with separate data, domain, and presentation layers.
- Google Sign-In flow is integrated at service level.
- User profile creation/read flow is prepared through Firestore repository logic.
- Authentication provider now manages:
  - current auth state
  - loading state
  - error state
  - sign-in and sign-out actions

### 4. Login Experience
- Login screen has been replaced from placeholder to a localized and themed screen.
- Reusable Google sign-in button widget is implemented.

### 5. Router and Provider Wiring
- Root providers are configured for authentication services and auth stream listening.
- Router redirect behavior is active for:
  - unauthenticated users to login
  - authenticated users to home

### 6. Build Health
- Static analysis currently passes with no issues.

## Location Permission Policy
Location permission is **never** requested on app launch or right after sign-in. The OS prompt only appears the first time the user opens the Qibla screen. Reasoning: prompting on install feels like tracking and erodes trust before the user has seen any value. The splash screen silently uses the cached location only when permission was already granted in a previous session.

If the user denies permission on the Qibla screen, the app falls back to **manual city selection** — a search screen that resolves city names to coordinates via geocoding. The user can also edit the location anytime by tapping the location card on the Qibla screen. If the user previously selected "Never" / "Don't allow", tapping the GPS button opens the OS app settings page so they can re-enable manually.

## Location Storage Policy
Location (`{ lat, lng, cityLabel, accuracy }`) is stored **only locally** in a Hive box (`QiblaLocationRepository`). It is **never** written to Firestore. Reasoning: privacy — user coordinates should not leave the device. Per-device re-selection on new installs is acceptable since location is inherently per-device anyway.

## Next Planned Work
- Phase 2: Diyanet + Aladhan prayer-times integration, Hive caching layer

## Documentation Update Rule
This file will be updated throughout development so project progress remains visible and easy to follow for client review.
