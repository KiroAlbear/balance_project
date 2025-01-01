import 'package:flutter/material.dart';

import '../../imports.dart';

class CustomElevatedButton extends StatelessWidget {
  final Widget child;
  final double? width;
  final void Function()? onPressed;

  CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(elevatedButtonTheme: customElevatedButtonTheme),
      child: SizedBox(
        width: width,
        height: AppDimensions.buttonHeight,
        child: ElevatedButton(
          onPressed: onPressed,
          child: child,
        ),
      ),
    );
  }
}
