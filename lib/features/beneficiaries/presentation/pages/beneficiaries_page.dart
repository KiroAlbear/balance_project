import 'package:balance_project/imports.dart';
import 'package:flutter/material.dart';

class BeneficiariesPage extends BaseStatelessPage {
  const BeneficiariesPage({super.key});

  @override
  bool containPadding() => false;

  @override
  Widget body(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: StaticColors.themeColor,
        onPressed: () {
          // Routes.navigateToScreen(
          //     Routes.addBeneficiaryScreen, NavigateType.pushNamed, context);
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
              BeneficiaryItem(
                name: "Ahmed",
                phone: "01000000000",
              ),
              20.flexPaddingHeight,
              BeneficiaryItem(
                name: "John",
                phone: "01012344000",
              ),
            ],
          )),
    );
  }
}
