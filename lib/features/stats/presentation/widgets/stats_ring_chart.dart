import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';

/// Circular progress ring with gradient stroke, centred percentage label,
/// kicker above and caption below.
///
/// Stroke width 8, ring size 96×96 by default.
class StatsRingChart extends StatelessWidget {
  final double percent;
  final String? kicker;
  final String caption;
  final double size;

  const StatsRingChart({
    super.key,
    required this.percent,
    required this.caption,
    this.kicker,
    this.size = 96,
  });

  @override
  Widget build(BuildContext context) {
    final hasKicker = kicker != null && kicker!.isNotEmpty;
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(size, size),
            painter: _RingPainter(percent: percent),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (hasKicker) ...[
                Text(
                  kicker!,
                  style: AppTextStyles.size9w400.copyWith(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: AppColors.mutedText,
                  ),
                ),
                const SizedBox(height: 2),
              ],
              Text(
                '%${percent.round()}',
                style: AppTextStyles.size22w800.copyWith(
                  fontSize: 20,
                  height: 1.1,
                ),
              ),
              const SizedBox(height: 2),
              SizedBox(
                width:
                    size / 1.5, // caption can be multiline, so constrain width
                child: Text(
                  caption,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: AppTextStyles.size9w400.copyWith(
                    fontSize: 10,
                    color: AppColors.mutedText,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  final double percent;
  static const double _strokeWidth = 8;

  _RingPainter({required this.percent});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - _strokeWidth) / 2;

    // Track
    final trackPaint = Paint()
      ..color = AppColors.lightGreen
      ..style = PaintingStyle.stroke
      ..strokeWidth = _strokeWidth
      ..strokeCap = StrokeCap.round;
    canvas.drawCircle(center, radius, trackPaint);

    // Progress arc — solid primary green
    final progressPaint = Paint()
      ..color = AppColors.primaryGreen
      ..style = PaintingStyle.stroke
      ..strokeWidth = _strokeWidth
      ..strokeCap = StrokeCap.round;

    final sweepAngle = 2 * math.pi * (percent.clamp(0, 100) / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(_RingPainter old) => old.percent != percent;
}
