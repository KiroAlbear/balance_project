import 'package:flutter/material.dart';

import 'cache_service/secure_storage_service.dart';

class ThemeManager {
  static bool _isDarkMode = false;
  static ThemeMode _themeMode = ThemeMode.light;
  static ThemeMode get themeMode => _themeMode;

  static Future<void> setThemeMode(ThemeMode value) async {
    setThemeValues(value);
    await SecureStorageService.getInstance()
        .setValue(SecureStorageService.themeModeKey, value.index.toString());
    // emit(ThemeState(themeMode: value));
  }

  static void setThemeValues(ThemeMode value) {
    _themeMode = value;
    _isDarkMode = value == ThemeMode.dark;
  }

  static bool isDarkMode(BuildContext context) {
    return _themeMode == ThemeMode.dark;
  }
}
