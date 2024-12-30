import 'package:balance_project/imports.dart';
import 'package:flutter/material.dart';

ThemeData appTheme(ThemeMode? mode, BuildContext context) =>
    _appTheme(mode, context);

ThemeData _appTheme(ThemeMode? mode, BuildContext context) {
  if (mode == ThemeMode.light) {
    return lightTheme(context);
  } else if (mode == ThemeMode.dark) {
    return darkTheme(context);
  } else if (mode == ThemeMode.system &&
      WidgetsBinding.instance.platformDispatcher.platformBrightness ==
          Brightness.dark) {
    return darkTheme(context);
  } else {
    return lightTheme(context);
  }
}
