import 'package:flutter/material.dart';

class TargetPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    canvas.drawCircle(const Offset(200, 200), 200, Paint()..color = Colors.red);
    canvas.drawCircle(
        const Offset(200, 200), 150, Paint()..color = Colors.white);
    canvas.drawCircle(const Offset(200, 200), 100, Paint()..color = Colors.red);
    canvas.drawCircle(
        const Offset(200, 200), 50, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
