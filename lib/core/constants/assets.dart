abstract class AppAssets {
  // Base paths
  static const String _imagePath = 'assets/images';
  static const String _iconPath = 'assets/icons';
  static const String _animationPath = 'assets/animations';

  // Images
  static const String logo = '$_imagePath/logo.png';
  static const String appIcon = '$_imagePath/app_icon.png';
  static const String onboardingBackground = '$_imagePath/onboarding_bg.png';
  static const String profilePlaceholder =
      '$_imagePath/profile_placeholder.png';

  // Icons (SVG)
  static const String qiblaCompass = '$_iconPath/compass.svg';
  static const String mosqueIcon = '$_iconPath/mosque.svg';

  // Animations (Lottie JSON)
  static const String badgeCelebration =
      '$_animationPath/badge_celebration.json';
  static const String streakCelebration =
      '$_animationPath/streak_celebration.json';
  static const String checkmarkAnimation = '$_animationPath/checkmark.json';
}
