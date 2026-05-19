import 'package:hive/hive.dart';
import 'package:geolocator/geolocator.dart';
import '../data/qibla_location_cache_model.dart';

class QiblaLocationRepository {
  static const String _boxName = 'qibla_location_cache';
  static const Duration ttl = Duration(minutes: 30);
  static const double movementThresholdMeters = 10000; // 10 km

  Future<Box<QiblaLocationCacheModel>> _openBox() async {
    return await Hive.openBox<QiblaLocationCacheModel>(_boxName);
  }

  Future<QiblaLocationCacheModel?> getCachedLocation() async {
    final box = await _openBox();
    return box.get('last');
  }

  Future<void> saveLocation(QiblaLocationCacheModel model) async {
    final box = await _openBox();
    await box.put('last', model);
  }

  Future<bool> isCacheFresh() async {
    final cached = await getCachedLocation();
    if (cached == null) return false;
    final now = DateTime.now();
    return now.difference(cached.cachedAt) <= ttl;
  }

  Future<bool> isCacheStaleByMovement(Position newPosition) async {
    final cached = await getCachedLocation();
    if (cached == null) return true;
    final distance = Geolocator.distanceBetween(
      cached.lat,
      cached.lng,
      newPosition.latitude,
      newPosition.longitude,
    );
    return distance >= movementThresholdMeters;
  }

  Future<void> clearCache() async {
    final box = await _openBox();
    await box.clear();
  }
}
