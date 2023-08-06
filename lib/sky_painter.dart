import 'package:flutter/material.dart';

class SkyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    const gradient = RadialGradient(
      colors: [Color(0xFFFFFF00), Color(0xFF0099FF)],
      center: Alignment(0.7, -0.6),
      radius: 0.2,
      stops: [0.4, 1.0],
    );

    canvas.drawRect(
      rect,
      Paint()..shader = gradient.createShader(rect),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
