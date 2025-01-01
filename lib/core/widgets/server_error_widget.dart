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
            'Please make sure that you have a stable internet connection and try again',
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
