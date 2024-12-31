import 'package:balance_project/imports.dart';
import 'package:flutter/material.dart';

class HomePage extends BaseStatelessPage {
  const HomePage({super.key});

  @override
  bool containPadding() => false;

  @override
  Widget body(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            20.flexPaddingHeight,
            Text(
              "Hello, Ahmed",
              textAlign: TextAlign.center,
              style: CustomTextStyles.bold_20_black_appbarText(context),
            ),
            12.flexPaddingHeight,
            AvailableBalanceWidget(),
            25.flexPaddingHeight,
            CustomGradientButton(
              text: "Top Up",
              onTap: () {
                Routes.navigateToScreen(
                    Routes.topupScreen, NavigateType.pushNamed, context);
              },
              isNext: true,
            )
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
