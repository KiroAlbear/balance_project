import 'package:flutter/material.dart';

import '../../imports.dart';

class CustomElevatedButton extends StatelessWidget {
  final Widget child;
  final double? width;
  final bool isEnabled;
  final bool isBordered;
  final void Function()? onPressed;

  ElevatedButtonThemeData get _disabledElevatedButton =>
      ElevatedButtonThemeData(
        style: customElevatedButtonTheme.style!.copyWith(
          foregroundColor: WidgetStateProperty.all<Color>(
              StaticColors.buttonDimmedTextColor_fef),
          backgroundColor: WidgetStateProperty.all<Color>(
            StaticColors.td_color,
          ),
          overlayColor: WidgetStateProperty.all<Color>(Colors.transparent),
        ),
      );

  final ElevatedButtonThemeData _borderedElevatedButtonTheme =
      ElevatedButtonThemeData(
          style: customElevatedButtonTheme.style!.copyWith(
    elevation: WidgetStateProperty.all(0),
    side: WidgetStateProperty.all<BorderSide>(
      const BorderSide(
        color: StaticColors.td_color,
        width: 1,
      ),
    ),
    foregroundColor: WidgetStateProperty.all<Color>(StaticColors.td_color),
    // transparent background
    backgroundColor: WidgetStateProperty.all<Color>(StaticColors.td_color),
    overlayColor: WidgetStateProperty.all<Color>(StaticColors.td_color),
  ));

  CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.width,
    this.isEnabled = true,
    this.isBordered = false,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        elevatedButtonTheme: isBordered
            ? _borderedElevatedButtonTheme
            : isEnabled
                ? customElevatedButtonTheme
                : _disabledElevatedButton,
      ),
      child: SizedBox(
        width: width,
        height: AppDimensions.buttonHeight,
        child: ElevatedButton(
          onPressed: isEnabled ? onPressed : null,
          child: child,
        ),
      ),
    );
  }
}
