import 'package:hive/hive.dart';

part 'qibla_location_cache_model.g.dart';

@HiveType(typeId: 11)
class QiblaLocationCacheModel extends HiveObject {
  @HiveField(0)
  final double lat;
  @HiveField(1)
  final double lng;
  @HiveField(2)
  final String cityLabel;
  @HiveField(3)
  final double accuracy;
  @HiveField(4)
  final DateTime cachedAt;

  QiblaLocationCacheModel({
    required this.lat,
    required this.lng,
    required this.cityLabel,
    required this.accuracy,
    required this.cachedAt,
  });
}
