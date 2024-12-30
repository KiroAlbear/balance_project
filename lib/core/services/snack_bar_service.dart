import 'package:balance_project/config/colors/static_colors.dart';
import 'package:balance_project/config/dimensions/app_dimensions.dart';
import 'package:balance_project/config/font/custom_text_styles.dart';
import 'package:flutter/material.dart';

class SnackBarService {
  void showSnackBar(BuildContext context, String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 100,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        content: Padding(
          padding: EdgeInsets.all(AppDimensions.h(20)),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: CustomTextStyles.bold_20_black_appbarText(context).copyWith(
              fontSize: AppDimensions.getFonTSize16,
              color: StaticColors.black_735,
            ),
          ),
        ),
      ),
    );
  }
}
