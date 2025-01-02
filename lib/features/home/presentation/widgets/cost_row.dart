import 'package:balance_project/config/font/custom_text_styles.dart';
import 'package:flutter/material.dart';

class CostRow extends StatelessWidget {
  final String title;
  final String cost;
  final bool isTotal;
  const CostRow(
      {super.key,
      required this.title,
      required this.cost,
      this.isTotal = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 0, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              title,
              style: isTotal
                  ? CustomTextStyles.bold_14_blue(context)
                  : CustomTextStyles.regular_14_black(context),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              ": AED $cost",
              style: isTotal
                  ? CustomTextStyles.bold_14_blue(context)
                  : CustomTextStyles.bold_14_black(context),
            ),
          ),
        ],
      ),
    );
  }
}
