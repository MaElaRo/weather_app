import 'package:flutter/material.dart';

abstract class MyColor {
  static MyColor? current;
  Color get primaryColor;
  Color get secondaryColor;
  Color get tertiaryColor;
  Color get textColor;
  Color get accentColor;
  Color get backgroundColor;
}

class LightTheme extends MyColor {
  @override
  Color get accentColor => const Color(0xFFedf3fd);

  @override
  Color get primaryColor => const Color(0xFF512ee4);

  @override
  Color get secondaryColor => const Color(0xFF5c3ce9);

  @override
  Color get textColor => const Color(0xFF293967);

  @override
  Color get backgroundColor => accentColor;

  @override
  Color get tertiaryColor => primaryColor;
}

class DarkTheme extends MyColor {
  @override
  Color get accentColor => const Color(0xFFFFFFFF);

  @override
  Color get primaryColor => const Color(0xFF0d1c25);

  @override
  Color get secondaryColor => const Color(0xFF1b2c38);

  @override
  Color get textColor => accentColor;

  @override
  Color get backgroundColor => primaryColor;

  @override
  Color get tertiaryColor => const Color(0xFF5c3ce9);
}
