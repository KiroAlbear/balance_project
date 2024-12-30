import 'package:balance_project/imports.dart';
import 'package:flutter/material.dart';

SwitchThemeData customSwitchLightTheme = SwitchThemeData(
  splashRadius: 10.0,
// trackOutlineWidth: MaterialStateProperty.all<double>(22.0),
  thumbColor: WidgetStateProperty.all<Color>(Colors.white),
  trackColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) =>
      states.contains(WidgetState.selected)
          ? StaticColors.primaryColor_55f
          : StaticColors.lightBgColor_3F5),
);
