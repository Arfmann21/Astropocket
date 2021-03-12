import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeChanger extends ChangeNotifier {
  // Default theme for the app is Dark
  bool _isDark = true;

  // Return the current theme
  ThemeMode currentTheme() {
    checkTheme();
    setStatusBarColor();
    return _isDark ? ThemeMode.dark : ThemeMode.light;
  }

  void setStatusBarColor() {
    print(_isDark);
    if (_isDark)
      SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light, statusBarColor: Color(0xFF041a2f)));
    else
      SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark, statusBarColor: Color(0xFFFAFAFA)));
  }

  void switchTheme() {
    _isDark = !_isDark;
    setStatusBarColor();
    saveTheme(_isDark);

    // This method will notify every listener and rebuild (like a setState)
    notifyListeners();
  }

  Future<void> saveTheme(isDark) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('isDark', isDark);
  }

  Future<void> checkTheme() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool isDarkPref = pref.getBool('isDark') ?? true;

    _isDark = isDarkPref;
  }
}
