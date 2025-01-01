import 'package:balance_project/imports.dart';
import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  final double bottomSheetHeight;
  final String title;
  final Widget child;
  const CustomBottomSheet(
      {super.key,
      required this.title,
      required this.child,
      this.bottomSheetHeight = 300});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: bottomSheetHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          20.flexPaddingHeight,
          Text(
            title,
            textAlign: TextAlign.center,
            style: CustomTextStyles.bold_20_black_appbarText(context),
          ),
          20.flexPaddingHeight,
          Expanded(child: child),
        ],
      ),
    );
    ;
  }
}
