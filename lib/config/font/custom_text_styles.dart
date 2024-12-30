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

  static TextStyle regular_12_red_noSpacing(BuildContext context) {
    return TextStyleBlueprint.style(context,
        fontSize: 14, fontWeight: FontWeight.w400, color: Colors.red)!
        .copyWith(letterSpacing: 0);
  }

  static TextStyle semiBold_14_black_noSpacing(BuildContext context) {
    return TextStyleBlueprint.style(context,
        fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black)!
        .copyWith(letterSpacing: 0);
  }

  static TextStyle regular_14_black_noSpacing(BuildContext context) {
    return TextStyleBlueprint.style(context, fontSize: 14, color: Colors.black)!
        .copyWith(letterSpacing: 0);
  }













}
