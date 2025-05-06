import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

class RippleAnimation extends StatefulWidget {
  const RippleAnimation({
    super.key,
    required this.child,
    required this.size,
    required this.onPress,
    required this.minRadius,
    this.color = Colors.teal,
    this.repeat = false,
    this.delay = const Duration(milliseconds: 0),
    this.duration = const Duration(milliseconds: 1500),
    this.ripplesCount = 60,
  });

  final Widget child;
  final Function() onPress;
  final Size size;
  final Duration delay;
  final double minRadius;
  final Color color;
  final int ripplesCount;
  final Duration duration;
  final bool repeat;

  @override
  State<RippleAnimation> createState() => _RippleAnimationState();
}

class _RippleAnimationState extends State<RippleAnimation>
    with TickerProviderStateMixin {
  Widget get child => widget.child;

  double get radius => widget.minRadius;

  Duration get delay => widget.delay;

  Duration get duration => widget.duration;

  bool get repeat => widget.repeat;

  Color get color => widget.color;

  int get rippleCount => widget.ripplesCount;
  late AnimationController _animationController;

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      scaleFactor: 0.6,
      onTap: () {
        widget.onPress();
        if (_animationController.isCompleted) {
          _animationController.reset();
          _animationController.forward();
        } else {
          _animationController.forward();
        }
      },
      child: SizedBox(
        width: widget.size.width,
        height: widget.size.height,
        child: CustomPaint(
          painter: AnimatedCircle(
            _animationController,
            minRadius: radius,
            wavesCount: rippleCount + 2,
            color: color,
          ),
          child: child,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: duration);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class AnimatedCircle extends CustomPainter {
  AnimatedCircle(
    this.animation, {
    this.color = Colors.teal,
    this.minRadius = 50,
    this.wavesCount = 2,
  }) : super(repaint: animation);

  final Color color;
  final double minRadius;
  final int wavesCount;
  final Animation<double>? animation;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTRB(0.0, 0.0, size.width, size.height);
    for (int wave = 0; wave <= wavesCount; wave++) {
      circle(
        canvas: canvas,
        rect: rect,
        wave: wave,
        value: animation!.value,
        length: wavesCount,
        minRadius: minRadius,
      );
    }
  }

  void circle({
    required Canvas canvas,
    required Rect rect,
    double? minRadius,
    required int wave,
    required double value,
    int? length,
  }) {
    if (wave != 0) {
      final opacity = (1 - ((wave - 1) / length!) - value).clamp(0.0, 1.0);
      final colorWithOpacity = color.withOpacity(opacity);
      final r = minRadius! * (1 + ((wave * value))) * value;
      final Paint paint = Paint()..color = colorWithOpacity;
      canvas.drawCircle(rect.center, r, paint);
    }
  }

  @override
  bool shouldRepaint(AnimatedCircle oldDelegate) => true;
}
