import 'package:flutter/material.dart';

class ProfileViewmodel with ChangeNotifier {
  bool _darkMode = false;
  bool get darkMode => _darkMode;
  set darkMode(bool darkMode) {
    _darkMode = darkMode;
    notifyListeners();
  }

  int _checkLanguage = 0;
  int get checkLanguage => _checkLanguage;
  set checkLanguage(int checkLanguage) {
    _checkLanguage = checkLanguage;
    notifyListeners();
  }
}
