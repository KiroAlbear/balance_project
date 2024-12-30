import 'package:balance_project/config/dimensions/app_dimensions.dart';
import 'package:balance_project/config/extensions/padding_extension.dart';
import 'package:flutter/material.dart';

class RadioGroupModel<T> {
  int index;
  T selectedObject;
  RadioGroupModel({
    required this.index,
    required this.selectedObject,
  });
}

class RadioButtonListTile extends StatelessWidget {
  final int value;
  final int groupValue;
  final String title;
  final Function onPressed;
  final TextStyle textStyle;
  final double radioButtonScale;
  final double spaceBetweenRadioAndTitle;
  const RadioButtonListTile({
    super.key,
    required this.value,
    required this.groupValue,
    required this.title,
    required this.onPressed,
    required this.textStyle,
    this.radioButtonScale = 1.2,
    this.spaceBetweenRadioAndTitle = 13,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        width: double.infinity,
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: AppDimensions.h(12.5),
            horizontal: AppDimensions.w(8),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: AppDimensions.h(10),
                height: AppDimensions.h(10),
                child: Transform.scale(
                  scale: radioButtonScale,
                  // ignore: always_specify_types
                  child: Radio(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    splashRadius: 0,
                    value: value,
                    groupValue: groupValue,
                    onChanged: (int? value) => onPressed(),
                  ),
                ),
              ),
              spaceBetweenRadioAndTitle.paddingWidth,
              Text(title, style: textStyle),
            ],
          ),
        ),
      ),
    );
  }
}
