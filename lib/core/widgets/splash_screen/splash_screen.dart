import 'package:flutter/material.dart';

class splashScreen extends StatelessWidget {
  const splashScreen({
    super.key,
    required Animation<Offset> offsetAnimation,
    required Animation<double> fadeAnimation,
    required this.splashScreenImage,
  })  : _offsetAnimation = offsetAnimation,
        _fadeAnimation = fadeAnimation;

  final Animation<Offset> _offsetAnimation;
  final Animation<double> _fadeAnimation;
  final Image splashScreenImage;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Container(
            color: Colors.red,
            child: Text("Test Splash Screen"),
          ),
        ),
      ),
    );
  }
}
