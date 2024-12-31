import 'package:balance_project/features/home/presentation/pages/topup_page.dart';
import 'package:balance_project/imports.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Home"),
      ),
      bottomNavigationBar: CustomNavigationBar(onTap: (index) {}),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: TopupPage(),

        // Column(
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: <Widget>[
        //     Text(
        //       "Hello, Ahmed",
        //       textAlign: TextAlign.center,
        //       style: CustomTextStyles.bold_20_black_appbarText(context),
        //     ),
        //     SizedBox(
        //       height: 12,
        //     ),
        //     AvailableBalanceWidget(),
        //     SizedBox(
        //       height: 25,
        //     ),
        //     CustomGradientButton(
        //       text: "Top Up",
        //       onTap: () {},
        //       isNext: true,
        //     )
        //   ],
        // ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
