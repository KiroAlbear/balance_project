import 'package:balance_project/config/extensions/padding_extension.dart';
import 'package:flutter/material.dart';

import '../../imports.dart';

class NoDataErrorWidget extends StatelessWidget {
  const NoDataErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Assets.images.svg.nodata.svg(),
        20.flexPaddingHeight,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimensions.w(55)),
          child: Text(
            "لا يوجد بيانات يرجي المحاولة مرة اخري",
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
