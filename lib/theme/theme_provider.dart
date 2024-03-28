import 'package:flutter/material.dart';
import 'light_theme.dart';
import 'dark_theme.dart';

enum ThemeType { light, dark }

class ThemeProvider extends ChangeNotifier {
  ThemeData _currentTheme = lightTheme;

  ThemeData get currentTheme => _currentTheme;

  void setTheme(ThemeType themeType) {
    switch (themeType) {
      case ThemeType.light:
        _currentTheme = lightTheme;
        break;
      case ThemeType.dark:
        _currentTheme = darkTheme;
        break;
    }
    notifyListeners();
  }

  toggleTheme() {
    if (_currentTheme == lightTheme) {
      setTheme(ThemeType.dark);
    } else {
      setTheme(ThemeType.light);
    }
  }
}
