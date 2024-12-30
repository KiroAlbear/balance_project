import 'package:balance_project/imports.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme(BuildContext context) => ThemeData(
      colorScheme: ThemeData().colorScheme.copyWith(
            brightness: Brightness.light,
          ),
      scaffoldBackgroundColor: StaticColors.scaffoldBackground_7F4,
      textTheme: TextTheme(
        //kiro
        titleMedium: TextStyleBlueprint.titleMediumTextStyle(context),
      ),
      drawerTheme: const DrawerThemeData(
          backgroundColor: StaticColors.drawerLightBgColor_5e5),
      textSelectionTheme: TextSelectionThemeData(
          cursorColor: StaticColors.primaryColor_55f,
          selectionHandleColor: StaticColors.primaryColor_55f,
          selectionColor: StaticColors.primaryColor_55f.withOpacity(0.4)),
      cardTheme: CustomCardTheme.getCardTheme(context).copyWith(
        color: StaticColors.blackTextColor_858,
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.all<Color>(StaticColors.appTheme_55B),
      ),
      progressIndicatorTheme: customProgressIndicatorTheme,
      elevatedButtonTheme: customElevatedButtonTheme,
      switchTheme: customSwitchLightTheme,
      checkboxTheme: customCheckBoxLightTheme,
    );
