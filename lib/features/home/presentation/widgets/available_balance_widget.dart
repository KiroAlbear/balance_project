import 'package:balance_project/imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AvailableBalanceWidget extends StatelessWidget {
  const AvailableBalanceWidget({super.key});

  void _showEditBalanceBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.white,
      context: context,
      builder: (context) {
        return SizedBox(
          height: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              20.flexPaddingHeight,
              Text(
                "Edit Balance",
                textAlign: TextAlign.center,
                style: CustomTextStyles.bold_20_black_appbarText(context),
              ),
              20.flexPaddingHeight,
              HomeEditBalanceWidget()
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: StaticColors.themeColor,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.w(14), vertical: AppDimensions.h(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Total Available Balance",
                  style: CustomTextStyles.regular_14_white(context)
                      .copyWith(height: 1.2),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "AED",
                      style: CustomTextStyles.regular_14_white(context)
                          .copyWith(height: 1.5),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        return Text(
                          state.homeBalance != null ? state.homeBalance! : "0",
                          style: CustomTextStyles.bold_20_white(context)
                              .copyWith(height: 1.5),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(100),
                onTap: () {
                  _showEditBalanceBottomSheet(context);
                },
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
