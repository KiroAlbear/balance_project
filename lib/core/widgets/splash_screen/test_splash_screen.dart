import 'package:flutter/material.dart';

class TestSplashScreen extends StatelessWidget {
  const TestSplashScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Container(
        color: Colors.red,
        child: Text("Test Splash Screen"),
      ),
    );
  }
}
