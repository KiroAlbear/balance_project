import 'package:balance_project/imports.dart';
import 'package:flutter/material.dart';

class CustomTextFormFieldErrorWidget extends StatelessWidget {
  const CustomTextFormFieldErrorWidget({super.key, required this.errorMessage});
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Icon(
          Icons.info_outline_rounded,
          color: StaticColors.logoutRedColor_846,
        ),
        Text(
          errorMessage,
          style: TextStyle(
              fontSize: AppDimensions.getFonTSize14,
              fontWeight: TextStyleBlueprint.regularFontWeight,
              color: StaticColors.black_735),
        ),
      ],
    );
  }
}
