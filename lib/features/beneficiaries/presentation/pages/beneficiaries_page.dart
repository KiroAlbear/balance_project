import 'package:balance_project/imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class BeneficiariesPage extends BaseStatefulPage {
  const BeneficiariesPage({super.key});

  @override
  State<BeneficiariesPage> createState() => _BeneficiariesPageState();
}

class _BeneficiariesPageState extends BaseState<BeneficiariesPage> {
  int _beneficiariesCount = 0;
  ValueNotifier<bool> _isFloatingButtonVisible = ValueNotifier<bool>(false);
  @override
  bool containPadding() => false;

  @override
  void initState() {
    BlocProvider.of<BeneficiariesBloc>(context).add(getBeneficiariesEvent());
    super.initState();
  }

  void _showAddBeneficirayBottomSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.white,
      context: context,
      builder: (context) {
        return CustomBottomSheet(
          title: "Add Beneficiary",
          bottomSheetHeight: 500,
          child: AddBeneficirayForm(itemsCount: _beneficiariesCount),
        );
      },
    );
  }

  Widget _buildFloatingButton() {
    return ValueListenableBuilder<bool>(
      valueListenable: _isFloatingButtonVisible,
      builder: (context, bool value, child) {
        return value
            ? FloatingActionButton(
                shape: const CircleBorder(),
                backgroundColor: StaticColors.themeColor,
                onPressed: () {
                  _showAddBeneficirayBottomSheet();
                },
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              )
            : SizedBox();
      },
    );
  }

  @override
  Widget body(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      floatingActionButton: _buildFloatingButton(),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  20.flexPaddingHeight,
                  Text(
                    "Beneficiaries List",
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.bold_20_black_appbarText(context),
                  ),
                  20.flexPaddingHeight,
                  ParentBloc<BeneficiariesBloc, BeneficiariesState>(
                      listenWhen: (previous, current) =>
                          (previous.isListChanged != current.isListChanged ||
                              previous.status != current.status),
                      listenerFunction: (context, state) {
                        if (state.beneficiaries != null) {
                          _beneficiariesCount = state.beneficiaries!.length;
                        }
                        if (state.status == Status.error) {
                          _isFloatingButtonVisible.value = false;
                        } else {
                          _isFloatingButtonVisible.value = true;
                        }
                      },
                      builder: (BeneficiariesState state) {
                        return ListView.separated(
                          shrinkWrap: true,
                          separatorBuilder: (context, index) {
                            return 12.flexPaddingHeight;
                          },
                          itemCount: state.beneficiaries!.length,
                          itemBuilder: (context, index) {
                            return BeneficiaryItem(
                                index: index,
                                name: state.beneficiaries![index].name!,
                                phone:
                                    state.beneficiaries![index].phoneNumber!);
                          },
                        );
                      })
                ],
              )),
          BlocBuilder<BeneficiariesBloc, BeneficiariesState>(
            builder: (context, state) {
              if (state.showOverlayLoading) {
                return Container(
                    color: Colors.black.withOpacity(0.3),
                    child: Center(
                        child: LoadingAnimationWidget.staggeredDotsWave(
                            color: StaticColors.themeColor, size: 50)));
              } else {
                return SizedBox();
              }
            },
          )
        ],
      ),
    );
  }
}
