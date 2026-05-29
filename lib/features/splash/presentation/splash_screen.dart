import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../auth/providers/auth_provider.dart';
import '../../../core/constants/assets.dart';
import '../../../core/constants/colors.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import '../../qibla/data/qibla_location_repository.dart';
import '../../qibla/data/qibla_location_cache_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _fadeController;
  late final Animation<double> _fadeAnimation;

  bool _minDelayPassed = false;
  bool _hasNavigated = false;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeOut,
    );
    _fadeController.forward();

    // On app launch, refresh Qibla location cache silently — only if the user
    // has already granted location permission. We never prompt from splash:
    // permission is requested only when the user opens the Qibla screen.
    _refreshQiblaLocationCacheIfPermitted();

    // Minimum display time so the splash doesn't flash away instantly
    Future.delayed(const Duration(milliseconds: 1600), () {
      if (!mounted) return;
      _minDelayPassed = true;
      _tryNavigate(context.read<AuthProvider>());
    });
  }

  Future<void> _refreshQiblaLocationCacheIfPermitted() async {
    final repo = QiblaLocationRepository();
    try {
      final permission = await Geolocator.checkPermission();
      if (permission != LocationPermission.always &&
          permission != LocationPermission.whileInUse) {
        return;
      }

      Position? position;
      try {
        position = await Geolocator.getCurrentPosition();
      } catch (_) {
        position = await Geolocator.getLastKnownPosition();
      }
      if (position == null) return;

      String cityLabel = '';
      try {
        final placemarks = await placemarkFromCoordinates(
          position.latitude,
          position.longitude,
        );
        if (placemarks.isNotEmpty) {
          final placemark = placemarks.first;
          final city =
              placemark.locality ?? placemark.subAdministrativeArea ?? '';
          final country = placemark.country ?? '';
          cityLabel = [
            city,
            country,
          ].where((part) => part.trim().isNotEmpty).join(', ');
        }
      } catch (_) {}

      final cacheModel = QiblaLocationCacheModel(
        lat: position.latitude,
        lng: position.longitude,
        cityLabel: cityLabel,
        accuracy: position.accuracy,
        cachedAt: DateTime.now(),
      );
      await repo.saveLocation(cacheModel);
    } catch (_) {}
  }

  void _tryNavigate(AuthProvider auth) {
    if (_hasNavigated || !_minDelayPassed || !auth.isInitialized) return;
    _hasNavigated = true;
    if (!mounted) return;
    if (auth.isAuthenticated) {
      context.go('/home');
    } else {
      context.go('/onboarding');
    }
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, auth, child) {
        // Trigger navigation attempt whenever auth state changes
        WidgetsBinding.instance.addPostFrameCallback((_) => _tryNavigate(auth));

        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
          child: Scaffold(
            backgroundColor: AppColors.background,
            body: Center(
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Image.asset(AppAssets.appIcon, fit: BoxFit.fitWidth),
              ),
            ),
          ),
        );
      },
    );
  }
}
