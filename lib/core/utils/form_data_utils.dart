import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';

class FormDataUtils {

  static String titleKey = "title";
  static String subtitleKey = "subtitle";
  static String descriptionKey = "description";
  static String imageKey = "image";
  static String iconKey = "icon";
  static String button_textKey = "button_text";
  static String other_titleKey = "other_title";
  static String other_descriptionKey = "other_description";
  static String route_pathKey = "route_path";
  static String linkKey = "link";

  static FormData createFormData(
    Map<String, dynamic> data,
  ) {
    FormData formData = FormData();
    data.forEach((key, value) {
      if (value is MultipartFile) {
        formData.files.add(MapEntry(key, value as MultipartFile));
      } else {
        formData.fields.add(MapEntry(key, value));
      }
    });

    // if (imageKey != null && image != null && imageType != null) {
    //   formData.files
    //       .add(MapEntry(imageKey, createMultipartFile(image, imageType)));
    // }

    return formData;
  }

  static MultipartFile createMultipartFile(Uint8List image, String imageType) {
    return MultipartFile.fromBytes(image,
        filename: "test.${imageType}",
        contentType: DioMediaType('image', imageType));
  }
}
