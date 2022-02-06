import 'package:flutter/material.dart';

class AppTheme {
  static AppTheme? _instance;
  AppTheme._();
  static AppTheme get instance => _instance ??= AppTheme._();

  ThemeData get theme => ThemeData(
      primarySwatch: Colors.orange,
      iconTheme: const IconThemeData(color: Colors.white, size: 36),
      colorScheme: const ColorScheme.light(
        background: Colors.white,
        secondary: Colors.white54,
        secondaryVariant: Color(0xff878c97),
      ),
      textTheme: _textTheme());

  TextTheme _textTheme() {
    return const TextTheme(
        bodyText1: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        headline5: TextStyle(fontSize: 16, fontWeight: FontWeight.w300));
  }
}
