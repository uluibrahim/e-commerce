import 'package:e_commerce_app/core/init/theme/ligth/i_ligth_theme.dart';
import 'package:e_commerce_app/core/init/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AppThemeLight extends AppTheme with ILightTheme {
  static AppThemeLight? _instance;
  static AppThemeLight get instance => _instance ??= AppThemeLight._init();

  AppThemeLight._init();
  @override
  ThemeData get theme => ThemeData.light().copyWith(
        colorScheme: _appColorScheme,
        textTheme: _textTheme,
        appBarTheme: _appBarTheme,
        tabBarTheme: _tabbarTheme,
        bottomNavigationBarTheme: _bottomNavigationBarTheme,
        scaffoldBackgroundColor: const Color(0xfff3f3f3),
      );

  TextTheme get _textTheme => ThemeData.light().textTheme.copyWith();

  ColorScheme get _appColorScheme =>
      ThemeData.light().colorScheme.copyWith(brightness: Brightness.light);

  AppBarTheme get _appBarTheme => ThemeData.light().appBarTheme.copyWith(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      foregroundColor: Colors.black);

  TabBarTheme get _tabbarTheme => ThemeData.light().tabBarTheme.copyWith(
        labelColor: Colors.black,
        labelStyle:
            _textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(width: 2, color: Colors.black),
            insets: EdgeInsets.symmetric(horizontal: 10)),
        indicatorSize: TabBarIndicatorSize.tab,
      );

  BottomNavigationBarThemeData get _bottomNavigationBarTheme =>
      ThemeData.light().bottomNavigationBarTheme.copyWith(
          selectedItemColor: const Color(0xff212120),
          unselectedItemColor: const Color(0xffbdbdbd));
}
