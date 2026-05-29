import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../data/qibla_location_cache_model.dart';
import '../data/qibla_location_repository.dart';

class QiblaProvider extends ChangeNotifier {
  final QiblaLocationRepository _repo = QiblaLocationRepository();

  double? _qiblaDirection;
  double? _accuracy;
  String? _locationLabel;
  bool _isLoading = false;
  bool _isInitialized = false;
  double? _lastHeading;

  double? get qiblaDirection => _qiblaDirection;
  double? get accuracy => _accuracy;
  String? get locationLabel => _locationLabel;
  bool get isLoading => _isLoading;
  bool get isInitialized => _isInitialized;

  /// Last compass heading received from the screen — persists across tab switches.
  double? get lastHeading => _lastHeading;

  void updateHeading(double heading) {
    _lastHeading = heading;
    // No notifyListeners() — heading updates are driven by the screen's setState.
  }

  /// Call on first visit to QiblaScreen. No-ops if already initialized.
  Future<void> ensureLoaded() async {
    if (_isInitialized || _isLoading) return;
    await _loadFromCacheOrFetch();
  }

  /// Force-fetch fresh location and update cache. Used by manual refresh button.
  Future<void> refresh() async {
    if (_isLoading) return;
    await _fetchAndCache();
  }

  /// Try to use GPS. Handles all permission states:
  /// - granted → fetch fresh coords
  /// - denied → request, then fetch if granted
  /// - deniedForever → open the OS app settings (can't reprompt programmatically)
  ///
  /// Returns true if the OS settings page was opened (caller may want to wait
  /// for resume to re-check), false otherwise.
  Future<bool> requestGpsOrOpenSettings() async {
    if (_isLoading) return false;
    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.deniedForever) {
      await Geolocator.openAppSettings();
      return true;
    }
    if (permission == LocationPermission.denied) {
      return false;
    }
    await _fetchAndCache();
    return false;
  }

  /// Apply a manually-picked location (from the city picker). Skips GPS
  /// entirely — used when the user denies the OS prompt or wants to override.
  Future<void> setManualLocation({
    required double lat,
    required double lng,
    required String cityLabel,
  }) async {
    _isLoading = true;
    notifyListeners();

    final model = QiblaLocationCacheModel(
      lat: lat,
      lng: lng,
      cityLabel: cityLabel,
      accuracy: 0,
      cachedAt: DateTime.now(),
    );
    await _repo.saveLocation(model);
    _applyCache(model);

    _isLoading = false;
    _isInitialized = true;
    notifyListeners();
  }

  Future<void> _loadFromCacheOrFetch() async {
    _isLoading = true;
    notifyListeners();

    final cache = await _repo.getCachedLocation();
    final isFresh = await _repo.isCacheFresh();

    if (cache != null && isFresh) {
      _applyCache(cache);
      _isLoading = false;
      _isInitialized = true;
      notifyListeners();
      return;
    }

    await _fetchAndCache();
  }

  Future<void> _fetchAndCache() async {
    _isLoading = true;
    notifyListeners();

    try {
      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        _isLoading = false;
        _isInitialized = true;
        notifyListeners();
        return;
      }

      Position? position;
      try {
        position = await Geolocator.getCurrentPosition();
      } catch (_) {
        position = await Geolocator.getLastKnownPosition();
      }
      if (position == null) {
        _isLoading = false;
        _isInitialized = true;
        notifyListeners();
        return;
      }

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
      await _repo.saveLocation(cacheModel);
      _applyCache(cacheModel);
    } catch (_) {}

    _isLoading = false;
    _isInitialized = true;
    notifyListeners();
  }

  void _applyCache(QiblaLocationCacheModel cache) {
    _qiblaDirection = _calculateQiblaDirection(cache.lat, cache.lng);
    _accuracy = cache.accuracy;
    _locationLabel = cache.cityLabel;
  }

  static double _calculateQiblaDirection(double latitude, double longitude) {
    const kaabaLat = 21.4225;
    const kaabaLng = 39.8262;
    final deltaLongitude = (kaabaLng - longitude) * (math.pi / 180.0);
    final latitudeRad = latitude * (math.pi / 180.0);
    final kaabaLatRad = kaabaLat * (math.pi / 180.0);
    final y = math.sin(deltaLongitude);
    final x =
        math.cos(latitudeRad) * math.tan(kaabaLatRad) -
        math.sin(latitudeRad) * math.cos(deltaLongitude);
    final bearing = math.atan2(y, x) * (180.0 / math.pi);
    return (bearing + 360) % 360;
  }
}
