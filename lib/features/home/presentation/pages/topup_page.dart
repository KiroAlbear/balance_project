import 'package:balance_project/imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopupPage extends BaseStatefulPage {
  const TopupPage({super.key});

  @override
  State<TopupPage> createState() => _TopupPageState();
}

class _TopupPageState extends BaseState<TopupPage> {
  final _bottomSheetHeight = 500.0;

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
        return CustomBottomSheet(
          title: "Select Beneficiary",
          bottomSheetHeight: _bottomSheetHeight,
          child: _buildBeneficiariesList(state),
        );
      },
    );
  }

  Widget _buildAmountList(BeneficiariesState state) {
    if (state.amounts == null) {
      return SizedBox();
    }
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return 12.flexPaddingHeight;
        },
        itemCount: state.amounts!.length,
        itemBuilder: (context, index) {
          return AmountItem(
            value: state.amounts![index].amount,
            index: index,
            onTap: (int index) {
              BlocProvider.of<BeneficiariesBloc>(context)
                  .add(selectAmountEvent(selectedIndex: index));
              Navigator.pop(context);
            },
          );
        },
      ),
    );
  }

  void _showSelectAmountBottomSheet(
      BuildContext context, BeneficiariesState state) {
    showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.white,
      context: context,
      builder: (context) {
        return CustomBottomSheet(
          title: "Select Amount",
          bottomSheetHeight: _bottomSheetHeight,
          child: _buildAmountList(state),
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

        BlocProvider.of<BeneficiariesBloc>(context)
            .add(selectAmountEvent(selectedIndex: -1));
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: Column(
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
            BlocBuilder<BeneficiariesBloc, BeneficiariesState>(
              builder: (context, BeneficiariesState state) {
                if (state.selectedAmountIndex == -1) {
                  return ChooseBeneficiaryCard(
                    text: 'Select Amount',
                    onTap: () {
                      _showSelectAmountBottomSheet(context, state);
                    },
                  );
                } else {
                  return AmountItem(
                    value: state.amounts![state.selectedAmountIndex].amount,
                    index: state.selectedAmountIndex,
                    onTap: (int index) {
                      _showSelectAmountBottomSheet(context, state);
                    },
                  );
                }
              },
            ),
            20.flexPaddingHeight,
            BlocConsumer<BeneficiariesBloc, BeneficiariesState>(
              listenWhen: (previous, current) =>
                  (previous.isPaymentSuccess != current.isPaymentSuccess ||
                      previous.showErrorMessage != current.showErrorMessage),
              listener: (context, state) {
                if (state.isPaymentSuccess) {
                  BlocProvider.of<HomeBloc>(context).add(getHomeBalanceEvent());
                  BlocProvider.of<BeneficiariesBloc>(context)
                      .add(selectAmountEvent(selectedIndex: -1));
                  BlocProvider.of<BeneficiariesBloc>(context)
                      .add(selectBeneficiaryEvent(selectedIndex: -1));

                  Routes.navigateToScreen(Routes.successScreen,
                      NavigateType.pushReplacementNamed, context);
                } else {
                  if (state.errorMessage.isNotEmpty) {
                    AppToast.showToast(state.errorMessage);
                  }
                }
              },
              builder: (context, BeneficiariesState state) {
                return Column(
                  children: [
                    (state.selectedAmountIndex != -1 &&
                            state.selectedBeneficiaryIndex != -1)
                        ? Column(
                            children: [
                              LineSeparatorWidget(
                                paddingHeight: AppDimensions.h(10),
                              ),
                              CostRow(
                                  title: "Transaction Amount",
                                  cost: state
                                      .amounts![state.selectedAmountIndex]
                                      .amount
                                      .toString()),
                              const CostRow(
                                  title: "Transaction Fees", cost: "3"),
                              const LineSeparatorWidget(
                                paddingHeight: 10,
                              ),
                              CostRow(
                                title: "Total Fees",
                                cost: state.totalAmount.toString(),
                                isTotal: true,
                              ),
                            ],
                          )
                        : SizedBox(),
                    25.flexPaddingHeight,
                    CustomGradientButton(
                        text: "Pay",
                        onTap: () {
                          if (state.selectedAmountIndex == -1 ||
                              state.selectedBeneficiaryIndex == -1) {
                            AppToast.showToast(
                                "Please select amount and beneficiary");
                          } else {
                            BlocProvider.of<BeneficiariesBloc>(context).add(
                                payBeneficiaryEvent(
                                    phoneNumber: state
                                        .beneficiaries![
                                            state.selectedBeneficiaryIndex]
                                        .phoneNumber!,
                                    amount: state
                                        .amounts![state.selectedAmountIndex]
                                        .amount
                                        .toString()));
                          }
                        })
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
