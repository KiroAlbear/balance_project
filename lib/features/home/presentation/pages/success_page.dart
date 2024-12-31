import 'package:balance_project/imports.dart';
import 'package:flutter/material.dart';

class SuccessPage extends BaseStatelessPage {
  const SuccessPage({super.key});

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        100.flexPaddingHeight,
        SizedBox(
          width: 150,
          child: Image.asset(
            Assets.images.png.check.path,
          ),
        ),
        20.flexPaddingHeight,
        Text(
          "Payment successful",
          textAlign: TextAlign.center,
          style: CustomTextStyles.bold_20_black_appbarText(context),
        ),
        5.flexPaddingHeight,
        Text(
          "Thank you for using our service",
          textAlign: TextAlign.center,
          style: CustomTextStyles.regular_16_black(context),
        ),
        220.flexPaddingHeight,
        CustomGradientButton(
          onTap: () {
            Routes.navigateToFirstScreen(
              context,
            );
          },
          text: "Return To Home",
        ),
      ],
    );
  }
}
