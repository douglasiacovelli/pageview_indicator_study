import 'package:custom_painter/dots_painter.dart';
import 'package:flutter/widgets.dart';

class DotsWidget extends ImplicitlyAnimatedWidget {
  const DotsWidget({
    Key? key,
    required this.itemsCount,
    this.currentPosition = 0,
    this.space = 4,
    Duration duration = const Duration(milliseconds: 300),
  }) : super(key: key, duration: duration, curve: Curves.ease);

  final double currentPosition;
  final int itemsCount;
  final double space;
  final selectedDiameter = 20.0;
  final unselectedDiameter = 15.0;

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() {
    return _DotsWidgetState();
  }
}

class _DotsWidgetState extends AnimatedWidgetBaseState<DotsWidget> {
  Tween<double>? _tween;
  double? previousPosition;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DotsPainter(
        itemsCount: widget.itemsCount,
        previousPosition: previousPosition ?? widget.currentPosition,
        currentPosition: _tween?.evaluate(animation) ?? widget.currentPosition,
        space: widget.space,
        selectedDiameter: widget.selectedDiameter,
        unselectedDiameter: widget.unselectedDiameter,
      ),
    );
  }

  @override
  void didUpdateWidget(covariant DotsWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    previousPosition = oldWidget.currentPosition;
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    debugPrint('forEachTween');
    _tween = visitor(
      _tween,
      widget.currentPosition,
      (value) => Tween<double>(begin: value as double?),
    ) as Tween<double>?;
  }
}
