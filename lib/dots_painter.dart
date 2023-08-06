import 'dart:ui';

import 'package:flutter/material.dart';

class DotsPainter extends CustomPainter {
  DotsPainter({
    required this.itemsCount,
    required this.previousPosition,
    required this.currentPosition,
    required this.space,
    required this.selectedDiameter,
    required this.unselectedDiameter,
  });

  final double previousPosition;
  final double currentPosition;
  final int itemsCount;
  final double space;
  final double selectedDiameter;
  final double unselectedDiameter;

  final int maxItems = 7;

  @override
  void paint(Canvas canvas, Size size) {
    final clamppedMaxItems = itemsCount.clamp(0, maxItems);

    for (var i = 0; i < clamppedMaxItems; i++) {
      final circlePainter = _getColorPainter(i);

      canvas.drawCircle(
        Offset(
          selectedDiameter / 2 + (selectedDiameter + space) * i,
          selectedDiameter / 2,
        ),
        _getDiameter(i) / 2,
        circlePainter,
      );
    }
  }

  double _getDiameter(int i) {
    final double distance = _calculateDistance(i).clamp(-0.5, 1);
    return lerpDouble(unselectedDiameter, selectedDiameter, distance)!;
  }

  @override
  bool shouldRepaint(DotsPainter oldDelegate) {
    return oldDelegate.currentPosition != currentPosition;
  }

  Paint _getColorPainter(int i) {
    final double distance = _calculateDistance(i).clamp(0, 1);
    final color = Color.lerp(Colors.black26, Colors.blue, distance);

    return Paint()..color = color!;
  }

  double _calculateDistance(int i) {
    return 1 - (i - currentPosition).abs();
  }
}
