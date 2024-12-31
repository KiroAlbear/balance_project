import 'package:balance_project/config/font/custom_text_styles.dart';
import 'package:balance_project/core/base_pages/base_stateless_page.dart';
import 'package:balance_project/core/widgets/custom_appbar.dart';
import 'package:balance_project/core/widgets/custom_gradient_button.dart';
import 'package:balance_project/core/widgets/line_seperator_widget.dart';
import 'package:balance_project/features/home/presentation/widgets/choose_beneficiary_card.dart';
import 'package:balance_project/features/home/presentation/widgets/cost_row.dart';
import 'package:flutter/material.dart';

class TopupPage extends BaseStatelessPage {
  const TopupPage({super.key});

  @override
  Widget? appbarWidget() => CustomAppbar(title: "PaymentDetails");

  @override
  Widget body(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 12,
        ),
        // Text(
        //   'Payment Details',
        //   style: CustomTextStyles.bold_20_black_appbarText(context),
        // ),
        const SizedBox(
          height: 12,
        ),
        Text(
          'Beneficiaries Details',
          style: CustomTextStyles.regular_14_black(context),
        ),
        ChooseBeneficiaryCard(
          text: 'Select Beneficiary',
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          'Amount Details',
          style: CustomTextStyles.regular_14_black(context),
        ),
        ChooseBeneficiaryCard(
          text: 'Select Amount',
        ),
        SizedBox(
          height: 25,
        ),
        LineSeparatorWidget(
          paddingHeight: 10,
        ),
        CostRow(title: "Transaction Amount", cost: "10"),
        CostRow(title: "Transaction Fees", cost: "2"),
        LineSeparatorWidget(
          paddingHeight: 10,
        ),
        SizedBox(
          height: 25,
        ),
        CustomGradientButton(text: "Pay", onTap: () {})
      ],
    );
  }
}
