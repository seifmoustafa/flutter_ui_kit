import 'package:flutter/material.dart';

/// Signature for building animated splash children.
typedef SplashChildBuilder = Widget Function(
  BuildContext context,
  Animation<double> animation,
);

/// Tween that interpolates between two [LinearGradient]s.
class GradientTween extends Tween<LinearGradient> {
  GradientTween({required super.begin, required super.end});

  @override
  LinearGradient lerp(double t) => LinearGradient.lerp(begin, end, t)!;
}

/// A generic widget that animates a series of background gradients while also
/// animating any number of custom child widgets.
///
/// The animation runs for [duration] and cycles through the provided
/// [gradients]. Each transition is weighted by [weights] and follows the curve
/// defined by [gradientCurve]. Child widgets are built by
/// [childrenBuilders] and receive the same animation controller so they can
/// coordinate their own animations. [onFinished] is called when the sequence
/// completes.
class AnimatedSplashScreen extends StatefulWidget {
  const AnimatedSplashScreen({
    super.key,
    required this.gradients,
    required this.duration,
    required this.childrenBuilders,
    this.weights,
    this.gradientCurve = Curves.easeInOut,
    this.onFinished,
  });

  /// Sequence of background gradients.
  final List<LinearGradient> gradients;

  /// Weight for each gradient transition.
  ///
  /// When provided, must have the same length as [gradients]. If omitted all
  /// phases receive equal weight.
  final List<double>? weights;

  /// Curve used when interpolating between gradients.
  final Curve gradientCurve;

  /// Total duration of the animation.
  final Duration duration;

  /// Builders for the animated children.
  ///
  /// Each builder is given the [AnimationController] driving the splash so it
  /// can create arbitrary animations using `animate()`.
  final List<SplashChildBuilder> childrenBuilders;

  /// Callback when the animation completes.
  final VoidCallback? onFinished;

  @override
  State<AnimatedSplashScreen> createState() => _AnimatedSplashScreenState();
}

class _AnimatedSplashScreenState extends State<AnimatedSplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<LinearGradient> _background;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _background = _createGradientAnimation();
    _controller.forward();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onFinished?.call();
      }
    });
  }

  /// Builds the background gradient animation.
  Animation<LinearGradient> _createGradientAnimation() {
    final grads = widget.gradients;
    assert(grads.length >= 2, 'At least two gradients required');
    final weights = widget.weights ?? List<double>.filled(grads.length, 1);
    assert(
        weights.length == grads.length, 'weights length must match gradients');

    final items = <TweenSequenceItem<LinearGradient>>[];
    for (var i = 0; i < grads.length - 1; i++) {
      items.add(
        TweenSequenceItem(
          tween: GradientTween(begin: grads[i], end: grads[i + 1])
              .chain(CurveTween(curve: widget.gradientCurve)),
          weight: weights[i],
        ),
      );
    }
    items.add(TweenSequenceItem(
        tween: ConstantTween(grads.last), weight: weights.last));
    return TweenSequence(items).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(gradient: _background.value),
          child: Stack(
            alignment: Alignment.center,
            children: widget.childrenBuilders
                .map((b) => b(context, _controller))
                .toList(),
          ),
        );
      },
    );
  }
}
