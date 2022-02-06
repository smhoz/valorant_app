import 'package:flutter/material.dart';

import '../../constants/values/widget_values_constant.dart';

class CustomBorderRadius extends BorderRadius {
  CustomBorderRadius.allCircular()
      : super.circular(WidgetValue.instance.borderRadius);

  CustomBorderRadius.onlyTopLeftAndTopRightCircular()
      : super.only(
            topLeft: Radius.circular(WidgetValue.instance.borderRadius),
            topRight: Radius.circular(WidgetValue.instance.borderRadius));

  CustomBorderRadius.onlyBottomLeftAndBottomRightCircular()
      : super.only(
            bottomLeft: Radius.circular(WidgetValue.instance.borderRadius),
            bottomRight: Radius.circular(WidgetValue.instance.borderRadius));
}
