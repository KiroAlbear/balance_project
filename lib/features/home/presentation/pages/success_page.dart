import 'package:balance_project/config/font/custom_text_styles.dart';
import 'package:balance_project/core/widgets/custom_gradient_button.dart';
import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 100),
        Icon(
          Icons.check_circle_sharp,
          color: Colors.blue.withOpacity(0.7),
          size: 150,
        ),
        const SizedBox(height: 20),
        Text(
          "Payment successful",
          textAlign: TextAlign.center,
          style: CustomTextStyles.bold_20_black_appbarText(context),
        ),
        const SizedBox(height: 5),
        Text(
          "Thank you for using our service",
          textAlign: TextAlign.center,
          style: CustomTextStyles.regular_16_black(context),
        ),
        const SizedBox(height: 200),
        CustomGradientButton(
          onTap: () {},
          text: "Return To Home",
        ),
      ],
    );
  }
}
