import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:vaqt/core/constants/colors.dart';
import 'package:vaqt/features/qibla/presentation/widgets/qibla_compass_section.dart';
import 'package:vaqt/features/qibla/presentation/widgets/qibla_degree_display.dart';
import 'package:vaqt/features/qibla/presentation/widgets/qibla_empty_state.dart';
import 'package:vaqt/features/qibla/presentation/widgets/qibla_header.dart';
import 'package:vaqt/features/qibla/presentation/widgets/qibla_how_to_card.dart';
import 'package:vaqt/features/qibla/presentation/widgets/qibla_info_card.dart';
import 'package:vaqt/features/qibla/presentation/widgets/qibla_location_card.dart';
import 'package:vaqt/l10n/app_localizations.dart';
import '../providers/qibla_provider.dart';

class QiblaScreen extends StatefulWidget {
  const QiblaScreen({super.key});

  @override
  State<QiblaScreen> createState() => _QiblaScreenState();
}

class _QiblaScreenState extends State<QiblaScreen> {
  StreamSubscription<CompassEvent>? _compassSubscription;
  late double? _heading;

  @override
  void initState() {
    super.initState();
    // Seed heading from provider so the compass starts at the last known angle,
    // not 0, avoiding the Kaaba/needle jump on every tab revisit.
    _heading = context.read<QiblaProvider>().lastHeading;
    // Trigger a load only if the provider hasn't loaded yet — no-op on revisits.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) context.read<QiblaProvider>().ensureLoaded();
    });
    _compassSubscription = FlutterCompass.events?.listen((event) {
      if (event.heading == null) return;
      context.read<QiblaProvider>().updateHeading(event.heading!);
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

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final qibla = context.watch<QiblaProvider>();

    final qiblaDegreeText = l10n.qiblaDegrees(
      qibla.qiblaDirection?.toStringAsFixed(0) ?? '--',
    );
    final cityText =
        qibla.locationLabel ?? (qibla.isLoading ? 'Konum alınıyor...' : '--');

    final accuracyValue = qibla.accuracy ?? 999;
    final accuracyLabel = accuracyValue <= 10
        ? l10n.qiblaAccuracyHigh
        : accuracyValue <= 30
        ? l10n.qiblaAccuracyMedium
        : l10n.qiblaAccuracyLow;

    final hasLocation = qibla.qiblaDirection != null;
    final showEmptyState =
        qibla.isInitialized && !qibla.isLoading && !hasLocation;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: QiblaHeader(
                      title: l10n.qiblaTitle,
                      subtitle: l10n.qiblaSubtitle,
                      mapButtonLabel: l10n.qiblaMapButton,
                      onMapTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${l10n.qiblaMapButton} TODO'),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 18),
                  if (showEmptyState)
                    QiblaEmptyState(
                      title: l10n.qiblaLocationNeededTitle,
                      body: l10n.qiblaLocationNeededBody,
                      selectCityLabel: l10n.qiblaSelectCity,
                      useGpsLabel: l10n.qiblaUseGps,
                      onSelectCity: () => context.push('/city-picker'),
                      onUseGps: () => context
                          .read<QiblaProvider>()
                          .requestGpsOrOpenSettings(),
                    )
                  else ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: QiblaLocationCard(
                        cityText: cityText,
                        locationModeLabel: l10n.qiblaLocationAuto,
                        onCityTap: () => context.push('/city-picker'),
                        onRefreshTap: () => context
                            .read<QiblaProvider>()
                            .requestGpsOrOpenSettings(),
                      ),
                    ),
                    const SizedBox(height: 18),
                    QiblaCompassSection(
                      heading: _heading ?? 0,
                      qiblaDirection: qibla.qiblaDirection ?? 0,
                    ),
                    QiblaDegreeDisplay(
                      degreeText: qiblaDegreeText,
                      directionLabel: l10n.qiblaDirectionLabel,
                    ),
                    const SizedBox(height: 18),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: QiblaInfoCard(
                        directionLabel: l10n.qiblaDirectionLabel,
                        directionValue: qiblaDegreeText,
                        accuracyLabel: l10n.qiblaAccuracyLabel,
                        accuracyValue: accuracyLabel,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: QiblaHowToCard(
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
                    ),
                  ],
                ],
              ),
            ),
            if (qibla.isLoading)
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
