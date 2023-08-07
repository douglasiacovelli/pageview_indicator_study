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

  final maxItems = 7;
  final visibleReducedDots = 2;
  // The first dot in the position to be reduced
  int get minDistanceRange => maxItems - visibleReducedDots - 2;

  @override
  void paint(Canvas canvas, Size size) {
    for (var i = 0; i < itemsCount; i++) {
      final circlePainter = _getColorPainter(i);

      final diameter = _getDiameter(i);
      canvas.drawCircle(
        Offset(
          diameter / 2 + (selectedDiameter + space) * i,
          selectedDiameter / 2,
        ),
        _getDiameter(i) / 2,
        circlePainter,
      );
    }
  }

  double _getDiameter(int i) {
    final double distance = _calculateDistance(i);
    final double diameter = lerpDouble(unselectedDiameter, selectedDiameter, distance.clamp(0, 1))!;

    final absDistance = distance.abs();

    // Verify if the dots are too far away from the current position
    if (absDistance >= minDistanceRange) {
      debugPrint('i: $i | distance: $distance');
      //5, 6, 7
      // 7 - 5 = 2
      // 2/2 = 1
      // 6 -5 = 1
      // 1/2
      final proportion = (absDistance - minDistanceRange).abs() / (visibleReducedDots + 1);

      return lerpDouble(unselectedDiameter, 0, proportion.clamp(0, 1))!;
    }

    // if (distance == 0 && i > currentPosition && i >= maxItems) {
    //   debugPrint('i >= maxItems | distance: $distance');
    //   return 0;
    // }
    return diameter;
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
