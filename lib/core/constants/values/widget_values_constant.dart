class WidgetValue {
  static WidgetValue? _instance;
  WidgetValue._();
  static WidgetValue get instance => _instance ??= WidgetValue._();

  final double borderRadius = 32;
}
