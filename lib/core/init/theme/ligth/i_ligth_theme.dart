

import 'package:e_commerce_app/core/init/theme/ligth/color_scheme_ligth.dart';
import 'package:e_commerce_app/core/init/theme/ligth/text_theme_ligth.dart';

abstract class ILightTheme {
  TextThemeLight? get textThemeLight => TextThemeLight.instance;
  ColorSchemeLight? get colorSchemeLight => ColorSchemeLight.instance;
}