import 'package:flutter/material.dart';

import '../../imports.dart';

class CustomTextStyles {
  CustomTextStyles._();

  static TextStyle bold_20_black_appbarText(BuildContext context) {
    return TextStyleBlueprint.style(context,
        fontSize: AppDimensions.getFonTSize20,
        fontWeight: TextStyleBlueprint.boldFontWeight,
        height: 1,
        color: Colors.black)!;
  }

  static TextStyle bold_18_td_color(BuildContext context) {
    return TextStyleBlueprint.style(context,
        fontSize: AppDimensions.getFonTSize18,
        fontWeight: TextStyleBlueprint.boldFontWeight,
        height: 1,
        color: StaticColors.td_color)!;
  }

  static TextStyle bold_24_orange_appbarText(BuildContext context) {
    return TextStyleBlueprint.style(context,
        fontSize: AppDimensions.getFonTSize24,
        fontWeight: TextStyleBlueprint.boldFontWeight,
        height: 1,
        color: StaticColors.td_color)!;
  }

  static TextStyle regular_20_black_appbarText(BuildContext context) {
    return TextStyleBlueprint.style(context,
        fontSize: AppDimensions.getFonTSize20,
        fontWeight: TextStyleBlueprint.regularFontWeight,
        height: 1,
        color: Colors.black)!;
  }

  static TextStyle regular_15_black_appbarText(BuildContext context) {
    return TextStyleBlueprint.style(context,
        fontSize: AppDimensions.getFonTSize15,
        fontWeight: TextStyleBlueprint.regularFontWeight,
        height: 1,
        color: Colors.black)!;
  }

  static TextStyle bold_18_white_saveButton(BuildContext context) {
    return TextStyleBlueprint.style(context,
        fontSize: AppDimensions.getFonTSize18,
        fontWeight: TextStyleBlueprint.boldFontWeight,
        height: 2.1,
        color: Colors.white)!;
  }

  static TextStyle bold_14_black_appbarText(BuildContext context) {
    return TextStyleBlueprint.style(context,
        fontSize: AppDimensions.getFonTSize16,
        fontWeight: TextStyleBlueprint.boldFontWeight,
        height: 1,
        color: Colors.black)!;
  }
}
