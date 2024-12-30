import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDimensions {
  static ScreenUtil screenUtil = ScreenUtil();


  //figma or adobe xd design size
  static Size designSize = const Size(430, 932);
  static double? width;
  static double? height;
  static double textHeight = 1.8;
  static double chipPadding = h(6);
  static double sizedBoxPadding = h(30);

  static double tabletMinimumWidth = 700;
  // double closeIconSize = 16;
  static double get screenPadding => w(16.0);
  static double get buttonHeight => h(50);
  static double get appBarHeight => h(120);
  // late double navBarHeight;
  static double get navBarHeight => h(110);
  static double get mediaStickyPlayerHeight => AppDimensions.h(115);
  static double get radioStickyPlayerHeight => AppDimensions.h(73);
  static double cardBorderRadius = 5;
  static double bottomSheetBorderRadius = 20;
  static double radius(double radius) {
    return screenUtil.radius(radius);
  }

  static double get getFonTSize14 {
    return 14;
  }

  static double get getFonTSize40 {
    return 40;
  }

  static double get getFonTSize45 {
    return 45;
  }

  static double get getFonTSize35 {
    return 35;
  }

  static double get getFonTSize33 {
    return 33;
  }

  static double get getFonTSize49 {
    return 49;
  }

  static double get getFonTSize13 {
    return 13;
  }

  static double get getFonTSize12 {
    return 12;
  }

  static double get getFonTSize10 {
    return 10;
  }

  static double get getFonTSize11 {
    return 11;
  }

  static double get getFonTSize15 {
    return 15;
  }

  static double get getFonTSize16 {
    return 16;
  }

  static double get getFonTSize17 {
    return 16;
  }

  static double get getHelperFonTSize {
    return 16;
  }

  static double get getFonTSize18 {
    return 18;
  }

  static double get getFonTSize20 {
    return 20;
  }

  static double get getFonTSize22 {
    return 22;
  }

  static double get getFonTSize24 {
    return 24;
  }

  static double get getFonTSize26 {
    return 26;
  }

  static double get getFonTSize30 {
    return 30;
  }

  static double get getFonTSize34 {
    return 34;
  }

  static double get getFonTSize38 {
    return 38;
  }

  static double get getFonTSize60 {
    return 52;
  }

  static double get getFonTSize65 {
    return 65;
  }

  static double get getFonTSize50 {
    return 50;
  }

  static double textFieldHeight(double helperTextFontSize) {
    return h(58) + helperTextFontSize * textHeight;
  }

  static double h(double value) {
    return (value / designSize.height) * screenUtil.screenHeight;
  }

  static double w(double value) {
    return (value / designSize.width) * screenUtil.screenWidth;
  }

  static double fullHeight() {
    return screenUtil.screenHeight;
  }

  static double fullWidth() {
    return screenUtil.screenWidth;
  }

  static double deviceHeight(double mobileHeight, double tabletHeight) {
    return fullWidth() > tabletMinimumWidth ? tabletHeight : mobileHeight;
  }

  double? availableScreenHeight(BuildContext context) {
    final Size media = MediaQuery.sizeOf(context);
    final EdgeInsets padding = MediaQuery.paddingOf(context);
    return (height ?? media.height) -
        (AppBar().preferredSize.height + padding.top);
  }
}
