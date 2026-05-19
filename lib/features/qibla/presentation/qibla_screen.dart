import 'dart:async';
import 'dart:math' as math;

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';

import 'package:vaqt/core/constants/colors.dart';
import 'package:vaqt/features/qibla/presentation/widgets/qibla_compass_section.dart';
import 'package:vaqt/features/qibla/presentation/widgets/qibla_degree_display.dart';
import 'package:vaqt/features/qibla/presentation/widgets/qibla_header.dart';
import 'package:vaqt/features/qibla/presentation/widgets/qibla_how_to_card.dart';
import 'package:vaqt/features/qibla/presentation/widgets/qibla_info_card.dart';
import 'package:vaqt/features/qibla/presentation/widgets/qibla_location_card.dart';
import 'package:vaqt/l10n/app_localizations.dart';

class QiblaScreen extends StatefulWidget {
  const QiblaScreen({super.key});

  @override
  State<QiblaScreen> createState() => _QiblaScreenState();
}

class _QiblaScreenState extends State<QiblaScreen> {
  StreamSubscription<CompassEvent>? _compassSubscription;
  double? _heading;
  Position? _position;
  double? _qiblaDirection;
  double? _accuracy;
  String? _locationLabel;
  bool _isLocationLoading = false;

  @override
  void initState() {
    super.initState();
    _initLocation();
    _compassSubscription = FlutterCompass.events?.listen((event) {
      setState(() {
        _heading = event.heading;
      });
    });
  }

  @override
  void dispose() {
    _compassSubscription?.cancel();
    super.dispose();
  }

  Future<void> _initLocation() async {
    if (_isLocationLoading) {
      return;
    }

    setState(() {
      _isLocationLoading = true;
    });

    try {
      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return;
      }

      Position? position;
      try {
        position = await Geolocator.getCurrentPosition();
      } catch (_) {
        position = await Geolocator.getLastKnownPosition();
      }
      if (position == null) {
        return;
      }

      setState(() {
        _position = position;
        _accuracy = position!.accuracy;
        _qiblaDirection = _calculateQiblaDirection(
          position.latitude,
          position.longitude,
        );
      });

      await _resolveLocationLabel(position.latitude, position.longitude);
    } finally {
      if (mounted) {
        setState(() {
          _isLocationLoading = false;
        });
      }
    }
  }

  Future<void> _resolveLocationLabel(double latitude, double longitude) async {
    try {
      final placemarks = await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isEmpty || !mounted) {
        return;
      }

      final placemark = placemarks.first;
      final city = placemark.locality ?? placemark.subAdministrativeArea ?? '';
      final country = placemark.country ?? '';
      final label = [
        city,
        country,
      ].where((part) => part.trim().isNotEmpty).join(', ');

      if (label.isEmpty) {
        return;
      }

      setState(() {
        _locationLabel = label;
      });
    } catch (_) {
      // Keep fallback text if reverse geocoding is unavailable.
    }
  }

  double _calculateQiblaDirection(double latitude, double longitude) {
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

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final qiblaDegreeText = l10n.qiblaDegrees(
      _qiblaDirection?.toStringAsFixed(0) ?? '--',
    );
    final cityText =
        _locationLabel ?? (_position == null ? '--' : 'Konum alınıyor...');

    final accuracyValue = _accuracy ?? 999;
    final accuracyLabel = accuracyValue <= 10
        ? l10n.qiblaAccuracyHigh
        : accuracyValue <= 30
        ? l10n.qiblaAccuracyMedium
        : l10n.qiblaAccuracyLow;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  QiblaHeader(
                    title: l10n.qiblaTitle,
                    subtitle: l10n.qiblaSubtitle,
                    mapButtonLabel: l10n.qiblaMapButton,
                    onMapTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${l10n.qiblaMapButton} TODO')),
                      );
                    },
                  ),
                  const SizedBox(height: 18),
                  QiblaLocationCard(
                    cityText: cityText,
                    locationModeLabel: l10n.qiblaLocationAuto,
                    onRefreshTap: _initLocation,
                  ),
                  const SizedBox(height: 18),
                  QiblaCompassSection(
                    heading: _heading ?? 0,
                    qiblaDirection: _qiblaDirection ?? 0,
                  ),
                  QiblaDegreeDisplay(
                    degreeText: qiblaDegreeText,
                    directionLabel: l10n.qiblaDirectionLabel,
                  ),
                  const SizedBox(height: 18),
                  QiblaInfoCard(
                    directionLabel: l10n.qiblaDirectionLabel,
                    directionValue: qiblaDegreeText,
                    accuracyLabel: l10n.qiblaAccuracyLabel,
                    accuracyValue: accuracyLabel,
                  ),
                  const SizedBox(height: 16),
                  QiblaHowToCard(
                    title: l10n.qiblaInstructionsTitle,
                    description: l10n.qiblaInstruction1,
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Nasıl kullanilir karti TODO'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            if (_isLocationLoading)
              Positioned.fill(
                child: ColoredBox(
                  color: AppColors.black.withValues(alpha: 0.12),
                  child: Center(
                    child: Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: AppColors.cardBackground,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      alignment: Alignment.center,
                      child: const SizedBox(
                        width: 26,
                        height: 26,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.8,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            AppColors.primaryGreen,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
