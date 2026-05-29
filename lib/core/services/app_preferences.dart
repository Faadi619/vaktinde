import 'package:hive/hive.dart';

/// Lightweight, synchronous local prefs backed by Hive.
///
/// Used for ephemeral device-level flags (e.g. "has the user finished
/// onboarding once"). NOT for user data — that belongs in Firestore.
class AppPreferences {
  static const String _boxName = 'app_prefs';
  static const String _hasSeenOnboardingKey = 'hasSeenOnboarding';

  static Box<dynamic>? _box;

  /// Open the box once at app startup (called from main.dart).
  static Future<void> init() async {
    _box = await Hive.openBox<dynamic>(_boxName);
  }

  static Box<dynamic> get _requireBox {
    final box = _box;
    if (box == null) {
      throw StateError('AppPreferences.init() must be called before use');
    }
    return box;
  }

  static bool get hasSeenOnboarding =>
      _requireBox.get(_hasSeenOnboardingKey, defaultValue: false) as bool;

  static Future<void> setHasSeenOnboarding(bool value) =>
      _requireBox.put(_hasSeenOnboardingKey, value);
}
