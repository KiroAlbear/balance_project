import 'package:balance_project/imports.dart';
import 'package:balance_project/config/dimensions/app_dimensions.dart';
import 'package:balance_project/core/models/custom_list_item_converter.dart';
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

extension CustomListItemConversion on BaseModelListItem {
  CustomListItemModel toCustomListItemModel({
    required int id,
    required String title,
    required String imageUrl,
  }) {
    return CustomListItemModel(
      id: id,
      title: title,
      imageUrl: imageUrl,
    );
  }
}
