import 'package:flutter/material.dart';

import '../../extensions/context_extension.dart';

class AnimationTranslate extends StatelessWidget {
  final Widget child;
  final Tween<double>? tween;
  final Curve? curve;
  final Offset? offset;

  const AnimationTranslate({
    Key? key,
    required this.child,
    this.tween,
    this.curve,
    this.offset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: tween ?? Tween(begin: 1, end: 0),
      duration: context.longDuration,
      curve: curve ?? Curves.easeInOutBack,
      builder: (context, value, child) {
        return Transform.translate(
          offset: offset ?? Offset(0, 400 * value),
          child: child,
        );
      },
      child: child,
    );
  }
}
