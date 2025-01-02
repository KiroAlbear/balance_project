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
          child: Column(
            children: [
              Image.asset(
                Assets.images.png.alert.path,
                width: 100,
              ),
              20.flexPaddingHeight,
              Text(
                'Could not connect to the server',
                style: TextStyle(
                    fontSize: AppDimensions.getFonTSize16,
                    fontWeight: TextStyleBlueprint.regularFontWeight,
                    color: StaticColors.black_735),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        )
      ],
    );
  }
}
