import 'package:balance_project/imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopupPage extends BaseStatelessPage {
  const TopupPage({super.key});

  @override
  Widget? appbarWidget() => CustomAppbar(title: "Payment Details");

  Widget _buildBeneficiariesList(BeneficiariesState state) {
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
            onTap: (int index) {
              BlocProvider.of<BeneficiariesBloc>(context)
                  .add(selectBeneficiaryEvent(selectedIndex: index));
              Navigator.pop(context);
            },
          );
        },
      ),
    );
  }

  void _showSelectBeneficiariesBottomSheet(
      BuildContext context, BeneficiariesState state) {
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
              _buildBeneficiariesList(state),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget body(BuildContext context) {
    return PopScope(
      onPopInvoked: (val) {
        BlocProvider.of<BeneficiariesBloc>(context)
            .add(selectBeneficiaryEvent(selectedIndex: -1));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          22.flexPaddingHeight,
          Text(
            'Beneficiaries Details',
            style: CustomTextStyles.regular_14_black(context),
          ),
          BlocBuilder<BeneficiariesBloc, BeneficiariesState>(
            builder: (context, BeneficiariesState state) {
              if (state.selectedBeneficiaryIndex == -1) {
                return ChooseBeneficiaryCard(
                  text: 'Select Beneficiary',
                  onTap: () {
                    _showSelectBeneficiariesBottomSheet(context, state);
                  },
                );
              } else {
                return BeneficiaryItem(
                  showDeleteButton: false,
                  index: state.selectedBeneficiaryIndex,
                  name: state
                      .beneficiaries![state.selectedBeneficiaryIndex].name!,
                  phone: state.beneficiaries![state.selectedBeneficiaryIndex]
                      .phoneNumber!,
                  onTap: (p0) {
                    _showSelectBeneficiariesBottomSheet(context, state);
                  },
                );
              }
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
      ),
    );
  }
}
