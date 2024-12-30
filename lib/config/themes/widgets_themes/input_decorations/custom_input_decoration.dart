import 'package:balance_project/imports.dart';
import 'package:flutter/material.dart';

class CustomInputDecoration {
  CustomInputDecoration._();
  static InputDecoration getMultipleLinesInputDecoration(BuildContext context) {
    const Color focusedBorderColor = StaticColors.textfieldBorderColor_55f;
    const Color initialBorderColor = StaticColors.initialBorderColor_EE4;
    const double borderWidth = 1;
    const BorderRadius borderRadius = BorderRadius.all(Radius.circular(12));
    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.all(10),
      counterText: "",
      border: const OutlineInputBorder(
        borderSide: BorderSide(
          width: borderWidth,
          color: focusedBorderColor,
          style: BorderStyle.solid,
        ),
        borderRadius: borderRadius,
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          width: borderWidth,
          color: focusedBorderColor,
          style: BorderStyle.solid,
        ),
        borderRadius: borderRadius,
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          width: borderWidth,
          color: initialBorderColor,
          style: BorderStyle.solid,
        ),
        borderRadius: borderRadius,
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          width: borderWidth,
          color: StaticColors.errorColor_353,
          style: BorderStyle.solid,
        ),
        borderRadius: borderRadius,
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          width: borderWidth,
          color: focusedBorderColor,
          style: BorderStyle.solid,
        ),
        borderRadius: borderRadius,
      ),
      errorStyle: TextStyleBlueprint.style(
        context,
        fontSize: AppDimensions.getFonTSize16,
        fontWeight: TextStyleBlueprint.regularFontWeight,
        height: 1,
        color: StaticColors.errorColor_353,
      ),
      hintStyle: TextStyle(
          fontSize: AppDimensions.getFonTSize14,
          fontWeight: TextStyleBlueprint.regularFontWeight,
          color: StaticColors.black_735),
      helperStyle: TextStyleBlueprint.style(
        context,
        fontSize: AppDimensions.getFonTSize16,
        fontWeight: TextStyleBlueprint.regularFontWeight,
        color: GenericColors.getColors(
          context,
          GenericColors.black_03E_white_textColor,
        ),
      ),
    );
  }

  static InputDecoration getInputDecoration(BuildContext context) {
    const Color focusedBorderColor = StaticColors.textfieldBorderColor_55f;
    const Color initialBorderColor = StaticColors.initialBorderColor_EE4;
    const double borderWidth = 1;
    const BorderRadius borderRadius = BorderRadius.all(Radius.circular(50));
    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.all(10),
      border: const OutlineInputBorder(
        borderSide: BorderSide(
          width: borderWidth,
          color: focusedBorderColor,
          style: BorderStyle.solid,
        ),
        borderRadius: borderRadius,
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          width: borderWidth,
          color: focusedBorderColor,
          style: BorderStyle.solid,
        ),
        borderRadius: borderRadius,
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          width: borderWidth,
          color: initialBorderColor,
          style: BorderStyle.solid,
        ),
        borderRadius: borderRadius,
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          width: borderWidth,
          color: StaticColors.errorColor_353,
          style: BorderStyle.solid,
        ),
        borderRadius: borderRadius,
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          width: borderWidth,
          color: focusedBorderColor,
          style: BorderStyle.solid,
        ),
        borderRadius: borderRadius,
      ),
      errorStyle: TextStyleBlueprint.style(
        context,
        fontSize: AppDimensions.getFonTSize16,
        fontWeight: TextStyleBlueprint.regularFontWeight,
        height: 1,
        color: StaticColors.errorColor_353,
      ),
      hintStyle: TextStyle(
          fontSize: AppDimensions.getFonTSize14,
          fontWeight: TextStyleBlueprint.regularFontWeight,
          color: StaticColors.black_735),
      counter: const SizedBox(),
      helperStyle: TextStyleBlueprint.style(
        context,
        fontSize: AppDimensions.getFonTSize16,
        fontWeight: TextStyleBlueprint.regularFontWeight,
        color: StaticColors.lightTextColor_03E,
      ),
    );
  }

  static InputDecorationTheme getHomeSearchDecoration(BuildContext context) {
    const Color focusedBorderColor = StaticColors.textfieldBorderColor_55f;
    const Color initialBorderColor = StaticColors.initialBorderColor_EE4;
    const double borderWidth = 1;
    const BorderRadius borderRadius = BorderRadius.all(Radius.circular(50));
    return Theme.of(context).inputDecorationTheme.copyWith(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.only(bottom: 0),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              width: borderWidth,
              color: focusedBorderColor,
              style: BorderStyle.solid,
            ),
            borderRadius: borderRadius,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: borderWidth,
              color: focusedBorderColor,
              style: BorderStyle.solid,
            ),
            borderRadius: borderRadius,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: borderWidth,
              color: initialBorderColor,
              style: BorderStyle.solid,
            ),
            borderRadius: borderRadius,
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: borderWidth,
              color: StaticColors.errorColor_353,
              style: BorderStyle.solid,
            ),
            borderRadius: borderRadius,
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: borderWidth,
              color: StaticColors.errorColor_353,
              style: BorderStyle.solid,
            ),
            borderRadius: borderRadius,
          ),
          errorStyle: TextStyleBlueprint.style(
            context,
            fontSize: AppDimensions.getFonTSize16,
            fontWeight: TextStyleBlueprint.regularFontWeight,
            height: AppDimensions.textHeight,
            color: StaticColors.errorColor_353,
          ),
          hintStyle: TextStyle(
              fontSize: AppDimensions.getFonTSize14,
              fontWeight: TextStyleBlueprint.regularFontWeight,
              color: StaticColors.black_735),
          helperStyle: TextStyleBlueprint.style(
            context,
            fontSize: AppDimensions.getHelperFonTSize,
            fontWeight: TextStyleBlueprint.regularFontWeight,
            color: GenericColors.getColors(
              context,
              GenericColors.black_03E_white_textColor,
            ),
          ),
        );
  }
}
