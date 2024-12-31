import 'package:balance_project/config/colors/static_colors.dart';
import 'package:balance_project/config/font/custom_text_styles.dart';
import 'package:flutter/material.dart';

class AvailableBalanceWidget extends StatelessWidget {
  const AvailableBalanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: StaticColors.themeColor,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "Total Available Balance",
              style: CustomTextStyles.regular_14_white(context)
                  .copyWith(height: 1.2),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "AED",
                  style: CustomTextStyles.regular_14_white(context)
                      .copyWith(height: 1.5),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "1000",
                  style: CustomTextStyles.bold_20_white(context)
                      .copyWith(height: 1.5),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
