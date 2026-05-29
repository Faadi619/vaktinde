import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:vaqt/core/constants/colors.dart';
import 'package:vaqt/core/constants/text_styles.dart';

class QiblaCompassPainter extends CustomPainter {
  const QiblaCompassPainter({required this.heading, required this.qibla});

  final double heading;
  final double qibla;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final outerRadius = (size.width / 2) - 4;
    final ringRadius = outerRadius - 20;
    final innerRadius = ringRadius - 22;

    final outerPaint = Paint()
      ..color = AppColors.lightGreen
      ..style = PaintingStyle.fill;
    final outerBoundaryPaint = Paint()
      ..color = AppColors.midGreen
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.6;
    final ringPaint = Paint()
      ..color = AppColors.cardBackground
      ..style = PaintingStyle.fill;
    final middleBorder = Paint()
      ..color = AppColors.divider
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    final innerBorder = Paint()
      ..color = AppColors.rowDivider
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    canvas.drawCircle(center, outerRadius, outerPaint);
    canvas.drawCircle(center, outerRadius, outerBoundaryPaint);
    canvas.drawCircle(center, ringRadius, ringPaint);
    canvas.drawCircle(center, ringRadius, middleBorder);
    canvas.drawCircle(center, innerRadius, ringPaint);
    canvas.drawCircle(center, innerRadius, innerBorder);

    _drawTicks(canvas, center, ringRadius);
    _drawDegreeLabels(canvas, center, ringRadius);
    _drawCardinals(canvas, center, ringRadius);
    _drawTopMarker(canvas, center, ringRadius);
    _drawNeedle(canvas, center, ringRadius);
  }

  void _drawDegreeLabels(Canvas canvas, Offset center, double radius) {
    final labelStyle = AppTextStyles.size9w400.copyWith(
      color: AppColors.inactiveNav,
      fontWeight: FontWeight.w600,
    );

    for (final deg in [30, 60, 120, 150, 210, 240, 300, 330]) {
      final rad = (deg - 90) * math.pi / 180;
      final labelRadius = radius - 19;
      final pos = Offset(
        center.dx + labelRadius * math.cos(rad),
        center.dy + labelRadius * math.sin(rad),
      );
      final textPainter = TextPainter(
        text: TextSpan(text: '$deg', style: labelStyle),
        textDirection: TextDirection.ltr,
      )..layout();
      textPainter.paint(
        canvas,
        pos - Offset(textPainter.width / 2, textPainter.height / 2),
      );
    }
  }

  void _drawTicks(Canvas canvas, Offset center, double radius) {
    final tickPaintMajor = Paint()
      ..color = AppColors.inactiveNav
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round;
    final tickPaintMinor = Paint()
      ..color = AppColors.divider
      ..strokeWidth = 0.8
      ..strokeCap = StrokeCap.round;

    for (int deg = 0; deg < 360; deg += 2) {
      final rad = (deg - 90) * math.pi / 180;
      final isMajor = deg % 30 == 0;
      final isMedium = !isMajor && deg % 10 == 0;
      final len = isMajor ? 10.0 : (isMedium ? 6.0 : 3.0);
      final start = Offset(
        center.dx + radius * math.cos(rad),
        center.dy + radius * math.sin(rad),
      );
      final end = Offset(
        center.dx + (radius - len) * math.cos(rad),
        center.dy + (radius - len) * math.sin(rad),
      );
      canvas.drawLine(start, end, isMajor ? tickPaintMajor : tickPaintMinor);
    }
  }

  void _drawCardinals(Canvas canvas, Offset center, double radius) {
    final labelStyle = AppTextStyles.titleMedium;

    void drawLabel(String label, Offset offset) {
      final textPainter =
          TextPainter(
              text: TextSpan(style: labelStyle, text: ''),
              textDirection: TextDirection.ltr,
            )
            ..text = TextSpan(style: labelStyle, text: label)
            ..layout();
      textPainter.paint(
        canvas,
        offset - Offset(textPainter.width / 2, textPainter.height / 2),
      );
    }

    final top = Offset(center.dx, center.dy - radius + 22);
    final right = Offset(center.dx + radius - 22, center.dy);
    final bottom = Offset(center.dx, center.dy + radius - 22);
    final left = Offset(center.dx - radius + 22, center.dy);

    drawLabel('N', top);
    drawLabel('E', right);
    drawLabel('S', bottom);
    drawLabel('W', left);
  }

  void _drawTopMarker(Canvas canvas, Offset center, double radius) {
    final markerPaint = Paint()
      ..color = AppColors.primaryGreen
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;
    final y1 = center.dy - radius + 3;
    final y2 = y1 + 15;
    canvas.drawLine(Offset(center.dx, y1), Offset(center.dx, y2), markerPaint);
  }

  void _drawNeedle(Canvas canvas, Offset center, double radius) {
    final qiblaAngle = (qibla - heading) * (math.pi / 180);
    final tipLength = radius - 30;

    final headPaint = Paint()
      ..color = AppColors.primaryGreen
      ..style = PaintingStyle.fill;
    final tailPaint = Paint()
      ..color = AppColors.divider
      ..style = PaintingStyle.fill;

    final tip = Offset(
      center.dx + tipLength * math.sin(qiblaAngle),
      center.dy - tipLength * math.cos(qiblaAngle),
    );
    final tail = Offset(
      center.dx - (tipLength - 10) * math.sin(qiblaAngle),
      center.dy + (tipLength - 10) * math.cos(qiblaAngle),
    );

    final perp = Offset(math.cos(qiblaAngle), math.sin(qiblaAngle));

    final headPath = Path()
      ..moveTo(tip.dx, tip.dy)
      ..lineTo(center.dx + perp.dx * 7, center.dy + perp.dy * 7)
      ..lineTo(center.dx - perp.dx * 7, center.dy - perp.dy * 7)
      ..close();

    final tailPath = Path()
      ..moveTo(tail.dx, tail.dy)
      ..lineTo(center.dx + perp.dx * 7, center.dy + perp.dy * 7)
      ..lineTo(center.dx - perp.dx * 7, center.dy - perp.dy * 7)
      ..close();

    canvas.drawPath(tailPath, tailPaint);
    canvas.drawPath(headPath, headPaint);

    final centerOuter = Paint()
      ..color = AppColors.cardBackground
      ..style = PaintingStyle.fill;
    final centerBorder = Paint()
      ..color = AppColors.primaryGreen
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    final centerInner = Paint()
      ..color = AppColors.primaryGreen
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, 12, centerOuter);
    canvas.drawCircle(center, 12, centerBorder);
    canvas.drawCircle(center, 5, centerInner);
  }

  @override
  bool shouldRepaint(covariant QiblaCompassPainter oldDelegate) {
    return oldDelegate.heading != heading || oldDelegate.qibla != qibla;
  }
}
