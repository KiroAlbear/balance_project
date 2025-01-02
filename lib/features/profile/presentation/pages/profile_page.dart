import 'package:balance_project/imports.dart';
import 'package:flutter/material.dart';

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
    await SecureStorageService.getInstance()
        .setValue(SecureStorageKeys.isUserVerified, isSwitched.toString());
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
                    "User verified",
                    style: CustomTextStyles.regular_16_black(context),
                  ),
                  Switch(
                    value: isSwitched,
                    activeColor: StaticColors.themeColor,
                    inactiveTrackColor: Colors.grey[100],
                    onChanged: (bool value) {
                      saveUserData(value);
                      setState(() {
                        isSwitched = value;
                      });
                    },
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
