import 'package:balance_project/imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BeneficiariesPage extends BaseStatefulPage {
  const BeneficiariesPage({super.key});

  @override
  State<BeneficiariesPage> createState() => _BeneficiariesPageState();
}

class _BeneficiariesPageState extends BaseState<BeneficiariesPage> {
  int _beneficiariesCount = 0;

  @override
  bool containPadding() => false;

  @override
  void initState() {
    BlocProvider.of<BeneficiariesBloc>(context).add(getBeneficiariesEvent());
    super.initState();
  }

  @override
  Widget body(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: StaticColors.themeColor,
        onPressed: () {
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
                      "Add Beneficiary",
                      textAlign: TextAlign.center,
                      style: CustomTextStyles.bold_20_black_appbarText(context),
                    ),
                    20.flexPaddingHeight,
                    AddBeneficirayForm(itemsCount: _beneficiariesCount)
                  ],
                ),
              );
            },
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              20.flexPaddingHeight,
              Text(
                "Beneficiaries List",
                textAlign: TextAlign.center,
                style: CustomTextStyles.bold_20_black_appbarText(context),
              ),
              20.flexPaddingHeight,
              ParentBloc<BeneficiariesBloc, BeneficiariesState>(
                  listenerFunction: (context, state) {
                if (state.beneficiaries != null) {
                  _beneficiariesCount = state.beneficiaries!.length;
                }
              }, builder: (BeneficiariesState state) {
                return ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return 12.flexPaddingHeight;
                  },
                  itemCount: state.beneficiaries!.length,
                  itemBuilder: (context, index) {
                    return BeneficiaryItem(
                        name: state.beneficiaries![index].name!,
                        phone: state.beneficiaries![index].phoneNumber!);
                  },
                );
              })
            ],
          )),
    );
  }
}
