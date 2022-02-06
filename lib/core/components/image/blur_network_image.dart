import 'dart:ui';

import 'package:flutter/material.dart';
import '../../extensions/context_extension.dart';

class BlurNetworkImage extends StatelessWidget {
  final ValueKey? valueKey;
  final String imageURL;
  final double? blurSigmaX;
  final double? blurSigmaY;
  final Color? color;
  const BlurNetworkImage(
      {Key? key,
      this.valueKey,
      required this.imageURL,
      this.blurSigmaX,
      this.blurSigmaY,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: context.normalDuration,
      child: Container(
        key: valueKey,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imageURL),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: blurSigmaX ?? 15,
            sigmaY: blurSigmaY ?? 15,
          ),
          child: Container(
            color: color ?? Colors.black.withOpacity(0.2),
          ),
        ),
      ),
    );
  }
}
