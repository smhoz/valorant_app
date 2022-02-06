import 'package:flutter/material.dart';
import '../border/border_radius.dart';
import '../../extensions/context_extension.dart';

class TransformScaleNetworkImage extends StatelessWidget {
  final double? widthFactor;
  final double scale;
  final String imageURL;
  final BoxShadow? boxShadow;
  final BorderRadius? borderRadius;
  const TransformScaleNetworkImage(
      {Key? key,
      required this.scale,
      this.boxShadow,
      this.widthFactor,
      required this.imageURL,
      this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: widthFactor,
      child: Transform.scale(
        scale: scale,
        child: Container(
          margin: context.paddingLow,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageURL),
                fit: BoxFit.cover,
              ),
              borderRadius: borderRadius ?? CustomBorderRadius.allCircular(),
              boxShadow: [boxShadow ?? const BoxShadow()]),
        ),
      ),
    );
  }
}
