import 'package:balance_project/imports.dart';
import 'package:flutter/material.dart';

class AmountItem extends StatelessWidget {
  final int value;
  final int index;
  final void Function(int)? onTap;

  const AmountItem({
    super.key,
    required this.value,
    required this.index,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap!(index);
        }
      },
      child: Card(
        elevation: 10,
        color: Colors.white,
        margin: const EdgeInsets.all(0),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppDimensions.w(8), vertical: AppDimensions.h(12)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: AppDimensions.h(70),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "AED ${value}",
                      style: CustomTextStyles.bold_20_black_appbarText(context),
                    ),
                  ),
                ),
              ),
              index > 6
                  ? Container(
                      height: AppDimensions.h(70),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "for testing only",
                            style: CustomTextStyles.regular_16_grey(context),
                          ),
                        ),
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
