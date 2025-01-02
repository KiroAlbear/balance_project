import 'package:balance_project/imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends BaseStatefulPage {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends BaseState<ProfilePage> {
  @override
  bool containPadding() => true;

  bool isSwitched = false;

  void saveUserData(bool isSwitched) async {
    BlocProvider.of<HomeBloc>(context)
        .add(addUserVerificationEvent(isSwitched.toString()));
  }

  @override
  Widget body(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.flexPaddingHeight,
              Text(
                "Profile Page",
                textAlign: TextAlign.center,
                style: CustomTextStyles.bold_20_black_appbarText(context),
              ),
              15.flexPaddingHeight,
              //radio button with text
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "User Verified",
                    style: CustomTextStyles.regular_16_black(context),
                  ),
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      return Switch(
                        value: state.isUserVerified,
                        activeColor: StaticColors.themeColor,
                        inactiveTrackColor: Colors.grey[100],
                        onChanged: (bool value) {
                          saveUserData(value);
                          BlocProvider.of<HomeBloc>(context).add(
                              addUserVerificationEvent(
                                  (!state.isUserVerified).toString()));
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
