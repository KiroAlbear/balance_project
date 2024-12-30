import 'package:balance_project/config/extensions/padding_extension.dart';
import 'package:balance_project/imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ServerErrorWidget extends StatelessWidget {
  const ServerErrorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        100.flexPaddingHeight,
        SvgPicture.asset(Assets.images.svg.icError.path),
        22.flexPaddingHeight,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimensions.w(50)),
          child: Text(
            'حدث عطل ما بالخادم يرجي المحاولة مره اخري',
            style: TextStyle(
                fontSize: AppDimensions.getFonTSize14,
                fontWeight: TextStyleBlueprint.regularFontWeight,
                color: StaticColors.black_735),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}

class UnAuthErrorWidget extends StatelessWidget {
  const UnAuthErrorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: AppDimensions.h(100)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(Assets.images.svg.icError.path),
          22.flexPaddingHeight,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimensions.w(0)),
            child: Text(
              'برجاء تسجيل الدخول اولا',
              style: TextStyle(
                  fontSize: AppDimensions.getFonTSize14,
                  fontWeight: TextStyleBlueprint.regularFontWeight,
                  color: StaticColors.black_735),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
