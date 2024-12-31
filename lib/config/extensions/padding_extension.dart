import 'package:balance_project/config/dimensions/app_dimensions.dart';
import 'package:balance_project/imports.dart';
import 'package:flutter/material.dart';

extension EmptyPadding on num {
  SizedBox get flexPaddingHeight => SizedBox(
        height: AppDimensions.h(toDouble()),
      );
  SizedBox get flexPaddingWidth => SizedBox(
        width: AppDimensions.w(toDouble()),
      );

  SizedBox get paddingHeight => SizedBox(
        height: toDouble(),
      );
  SizedBox get paddingWidth => SizedBox(
        width: toDouble(),
      );
}
