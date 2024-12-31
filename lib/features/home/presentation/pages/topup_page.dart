import 'package:balance_project/core/widgets/custom_appbar.dart';
import 'package:balance_project/imports.dart';
import 'package:flutter/material.dart';

class TopupPage extends BaseStatelessPage {
  const TopupPage({super.key});

  @override
  Widget? appbarWidget() => CustomAppbar(title: "Payment Details");

  @override
  Widget body(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        10.flexPaddingHeight,
        // Text(
        //   'Payment Details',
        //   style: CustomTextStyles.bold_20_black_appbarText(context),
        // ),
        12.flexPaddingHeight,
        Text(
          'Beneficiaries Details',
          style: CustomTextStyles.regular_14_black(context),
        ),
        ChooseBeneficiaryCard(
          text: 'Select Beneficiary',
        ),
        12.flexPaddingHeight,
        Text(
          'Amount Details',
          style: CustomTextStyles.regular_14_black(context),
        ),
        ChooseBeneficiaryCard(
          text: 'Select Amount',
        ),
        20.flexPaddingHeight,
        LineSeparatorWidget(
          paddingHeight: AppDimensions.h(10),
        ),
        CostRow(title: "Transaction Amount", cost: "10"),
        CostRow(title: "Transaction Fees", cost: "2"),
        LineSeparatorWidget(
          paddingHeight: 10,
        ),
        25.flexPaddingHeight,
        CustomGradientButton(
            text: "Pay",
            onTap: () {
              Routes.navigateToScreen(
                  Routes.successScreen, NavigateType.pushNamed, context);
            })
      ],
    );
  }
}
