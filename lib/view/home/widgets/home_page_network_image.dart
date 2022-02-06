import 'package:flutter/material.dart';

import '../../../core/components/image/transform_scale_network_image.dart';

class HomeViewNetworkImage extends StatelessWidget {
  final String imageURL;
  final double scale;
  final double? widthFactor;
  const HomeViewNetworkImage({
    Key? key,
    required this.imageURL,
    required this.scale,
    this.widthFactor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TransformScaleNetworkImage(
      scale: scale,
      imageURL: imageURL,
      boxShadow: _boxShadow(),
      widthFactor: widthFactor,
    );
  }

  BoxShadow _boxShadow() {
    return BoxShadow(
      color: Colors.black.withOpacity(0.0),
      spreadRadius: 5,
      blurRadius: 10,
      offset: const Offset(0, 5),
    );
  }
}
