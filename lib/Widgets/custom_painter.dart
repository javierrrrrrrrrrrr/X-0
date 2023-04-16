import 'dart:math';

import 'package:flutter/material.dart';

class CircularProgressPainter extends CustomPainter {
  final double progress;

  CircularProgressPainter({
    required this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 20
      ..style = PaintingStyle.stroke;

    double center = size.width / 2;
    double radius = center;

    canvas.drawCircle(
        Offset(center, center), radius, paint); // Dibuja el círculo exterior

    double angle = 2 * pi * (progress / 100);
    paint.color = Colors.blue;
    canvas.drawArc(
        Rect.fromCircle(center: Offset(center, center), radius: radius),
        -pi / 2,
        angle,
        false,
        paint); // Dibuja el área circular progresiva
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
