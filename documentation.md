# Vaktinde Project Documentation

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
Vaktinde is a mobile application for Turkish-speaking users to support daily prayer consistency.

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

## Next Planned Work
The next implementation step is to complete post-login onboarding for location:
- request location permission
- store location data for prayer times
- provide manual city selection fallback when permission is denied

## Documentation Update Rule
This file will be updated throughout development so project progress remains visible and easy to follow for client review.
