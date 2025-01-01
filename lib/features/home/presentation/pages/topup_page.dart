import 'package:balance_project/imports.dart';
import 'package:flutter/material.dart';

class TopupPage extends BaseStatelessPage {
  const TopupPage({super.key});

  @override
  Widget? appbarWidget() => CustomAppbar(title: "Payment Details");

  Widget _buildBeneficiariesList() {
    return ParentBloc<BeneficiariesBloc, BeneficiariesState>(
      builder: (state) {
        if (state.beneficiaries == null) {
          return SizedBox();
        }
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return 12.flexPaddingHeight;
            },
            itemCount: state.beneficiaries!.length,
            itemBuilder: (context, index) {
              return BeneficiaryItem(
                showDeleteButton: false,
                index: index,
                name: state.beneficiaries![index].name!,
                phone: state.beneficiaries![index].phoneNumber!,
                onTap: (p0) {
                  Navigator.pop(context);
                },
              );
            },
          ),
        );
      },
    );
  }

  void _showSelectBeneficiariesBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.white,
      context: context,
      builder: (context) {
        return SizedBox(
          height: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              20.flexPaddingHeight,
              Text(
                "Select Beneficiary",
                textAlign: TextAlign.center,
                style: CustomTextStyles.bold_20_black_appbarText(context),
              ),
              20.flexPaddingHeight,
              _buildBeneficiariesList(),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        22.flexPaddingHeight,
        Text(
          'Beneficiaries Details',
          style: CustomTextStyles.regular_14_black(context),
        ),
        ChooseBeneficiaryCard(
          text: 'Select Beneficiary',
          onTap: () {
            _showSelectBeneficiariesBottomSheet(context);
          },
        ),
        12.flexPaddingHeight,
        Text(
          'Amount Details',
          style: CustomTextStyles.regular_14_black(context),
        ),
        ChooseBeneficiaryCard(
          text: 'Select Amount',
          onTap: () {},
        ),
        20.flexPaddingHeight,
        LineSeparatorWidget(
          paddingHeight: AppDimensions.h(10),
        ),
        const CostRow(title: "Transaction Amount", cost: "10"),
        const CostRow(title: "Transaction Fees", cost: "2"),
        const LineSeparatorWidget(
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
