import 'package:balance_project/imports.dart';
import 'package:balance_project/core/models/custom_list_item_converter.dart';

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
