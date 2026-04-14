import 'package:flutter/material.dart';

/// ------------------------
/// 隐式动画封装
/// ------------------------

class FadeInWidget extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final Curve curve;

  const FadeInWidget({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeIn,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: 1.0,
      duration: duration,
      curve: curve,
      child: child,
    );
  }
}

class ScaleWidget extends StatelessWidget {
  final Widget child;
  final bool visible;
  final Duration duration;
  final Curve curve;

  const ScaleWidget({
    super.key,
    required this.child,
    this.visible = true,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeInOut,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: visible ? 1.0 : 0.0,
      duration: duration,
      curve: curve,
      child: child,
    );
  }
}

class SlideWidget extends StatelessWidget {
  final Widget child;
  final Offset offset;
  final Duration duration;
  final Curve curve;

  const SlideWidget({
    super.key,
    required this.child,
    this.offset = const Offset(0, 0.1),
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeOut,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      offset: offset,
      duration: duration,
      curve: curve,
      child: child,
    );
  }
}

/// ------------------------
/// 显式动画封装（可组合）
/// ------------------------

class AnimatedBox extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final bool animate;
  final Curve curve;
  final Offset? beginOffset;
  final double? beginScale;
  final double? beginOpacity;

  const AnimatedBox({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
    this.animate = true,
    this.curve = Curves.easeInOut,
    this.beginOffset,
    this.beginScale,
    this.beginOpacity,
  });

  @override
  State<AnimatedBox> createState() => _AnimatedBoxState();
}

class _AnimatedBoxState extends State<AnimatedBox> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scale;
  late Animation<double> _opacity;
  late Animation<Offset> _offset;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _scale = Tween<double>(
      begin: widget.beginScale ?? 0.5,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: widget.curve));

    _opacity = Tween<double>(
      begin: widget.beginOpacity ?? 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: widget.curve));

    _offset = Tween<Offset>(
      begin: widget.beginOffset ?? const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: widget.curve));

    if (widget.animate) _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offset,
      child: ScaleTransition(
        scale: _scale,
        child: FadeTransition(
          opacity: _opacity,
          child: widget.child,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

/// ------------------------
/// Hero 动画封装
/// ------------------------

class HeroWidget extends StatelessWidget {
  final String tag;
  final Widget child;

  const HeroWidget({super.key, required this.tag, required this.child});

  @override
  Widget build(BuildContext context) {
    return Hero(tag: tag, child: child);
  }
}

/// ------------------------
/// 弹性 / 物理动画
/// ------------------------

class BounceWidget extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final double bounceScale;

  const BounceWidget({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 400),
    this.bounceScale = 1.2,
  });

  @override
  State<BounceWidget> createState() => _BounceWidgetState();
}

class _BounceWidgetState extends State<BounceWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);

    _animation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: widget.bounceScale).chain(CurveTween(curve: Curves.easeOut)), weight: 50),
      TweenSequenceItem(tween: Tween(begin: widget.bounceScale, end: 1.0).chain(CurveTween(curve: Curves.easeIn)), weight: 50),
    ]).animate(_controller);

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(scale: _animation, child: widget.child);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}