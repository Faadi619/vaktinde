import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:vaqt/core/constants/colors.dart';
import 'package:vaqt/features/qibla/presentation/widgets/qibla_compass_painter.dart';

class QiblaCompassSection extends StatelessWidget {
  const QiblaCompassSection({
    required this.heading,
    required this.qiblaDirection,
    super.key,
  });

  final double heading;
  final double qiblaDirection;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: LayoutBuilder(
        builder: (context, constraints) {
          const compassSize = 280.0;
          const markerBubbleRadius = 26.0;
          const markerLabelOffset = 36.0;
          const orbitRadius = 170.0;

          // Marker orbits according to Qibla direction
          final markerAngle = (qiblaDirection - heading) * math.pi / 180;
          final centerX = constraints.maxWidth / 2;
          final centerY = 170.0;
          final markerCenter = Offset(
            centerX + orbitRadius * math.sin(markerAngle),
            centerY - orbitRadius * math.cos(markerAngle),
          );

          return Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: compassSize,
                height: compassSize,
                child: CustomPaint(
                  painter: QiblaCompassPainter(
                    heading: heading,
                    qibla: qiblaDirection,
                  ),
                ),
              ),
              Positioned(
                left: markerCenter.dx - markerBubbleRadius,
                top: markerCenter.dy - markerLabelOffset,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 52,
                      height: 52,
                      decoration: const BoxDecoration(
                        color: AppColors.cardBackground,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.cardShadow,
                            blurRadius: 12,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: const Text('🕋', style: TextStyle(fontSize: 28)),
                    ),
                    // Transform.rotate(
                    //   angle: triangleAngle,
                    //   child: CustomPaint(
                    //     size: const Size(16, 12),
                    //     painter: QiblaTrianglePainter(),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
