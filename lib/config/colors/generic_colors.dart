import 'package:balance_project/imports.dart';
import 'package:flutter/material.dart';
// import '../index.dart';

class abdModel {}

class LightDarkColor {
  final Color lightColor;
  final Color darkColor;
  LightDarkColor({required this.lightColor, required this.darkColor});
}

class GenericColors {
  GenericColors._();

  static String black_white_textColor = "black_white_textColor";
  static String black_03E_white_textColor = "black_03E_white_textColor";
  static String black_858_white_textColor = "black_858_white_textColor";
  static String black_D35_white_textColor = "black_D35_white_textColor";

  static String blueblack_03E_white_headerTextColor =
      "blueblack_03E_white_headerTextColor";

  static String grey_3F5_grey_3F5_seperatorColor =
      "grey_3F5_grey_3F5_seperatorColor";

  static String grey_672_white_subHeaderTextColor =
      "grey_672_white_subHeaderTextColor";
  static String white_3F5_black_62E_scaffolBackgroundColor =
      "white_3F5_black_62E_scaffolBackgroundColor";

  static final Map<String, LightDarkColor> _lightDarkColorsMap =
      <String, LightDarkColor>{
    black_white_textColor: LightDarkColor(
      lightColor: StaticColors.black_735,
      darkColor: Colors.white,
    ),
  };

  static Color getColors(BuildContext context, String colorKey) {
    final ThemeMode themeMode = Theme.of(context).brightness == Brightness.dark
        ? ThemeMode.dark
        : ThemeMode.light;

    if (themeMode == ThemeMode.dark) {
      return _lightDarkColorsMap[colorKey]!.darkColor;
    } else {
      return _lightDarkColorsMap[colorKey]!.lightColor;
    }
  }
}
