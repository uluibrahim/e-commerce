import 'package:flutter/material.dart';

class ColorSchemeLight {
  static ColorSchemeLight? _instance;
  static ColorSchemeLight get instance =>
      _instance ??= ColorSchemeLight._init();
  ColorSchemeLight._init();

  final white = Colors.white;
  final purple = const Color(0xffD11770);
  final indigo = const Color(0xff6A47B1);
}