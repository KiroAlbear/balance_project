import 'package:flutter/material.dart';

import 'localization_controller.dart';

class Localizer {
  static String tr(String textKey, BuildContext context) {
    String text =
        LocalizationController.getInstance().translate(context, textKey);
    return text;
  }
}
