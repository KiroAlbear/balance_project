import 'package:balance_project/imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends BaseStatefulPage {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage> {
  @override
  bool containPadding() => false;

  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(getHomeBalanceEvent());
    super.initState();
  }

  @override
  Widget body(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            20.flexPaddingHeight,
            Row(
              children: [
                Text(
                  "Hello, User",
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.bold_20_black_appbarText(context),
                ),
                5.flexPaddingWidth,
                Image.asset(
                  Assets.images.png.verified.path,
                  width: 17,
                  height: 17,
                )
              ],
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
