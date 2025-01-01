import 'package:balance_project/config/colors/static_colors.dart';
import 'package:balance_project/config/font/custom_text_styles.dart';
import 'package:flutter/material.dart';

class ChooseBeneficiaryCard extends StatelessWidget {
  final String text;
  final void Function() onTap;
  const ChooseBeneficiaryCard(
      {super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: StaticColors.greyColor_5fb,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                text,
                textAlign: TextAlign.center,
                style: CustomTextStyles.regular_16_grey(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
