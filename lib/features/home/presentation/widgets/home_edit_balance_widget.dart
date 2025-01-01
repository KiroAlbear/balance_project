import 'package:balance_project/imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeEditBalanceWidget extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _balanceController = TextEditingController();
  HomeEditBalanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.w(12)),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextField(
                hint: "write balance value",
                lable: "Balance",
                icon: Assets.images.png.wallet.path,
                iconType: IconType.image,
                isRequired: true,
                type: CustomTextFieldType.number,
                controller: _balanceController),
            25.flexPaddingHeight,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppDimensions.w(12)),
              child: CustomElevatedButton(
                child: const Text(
                  "Add",
                ),
                onPressed: () {
                  _formKey.currentState!.validate();

                  // check if the balance is valid integer
                  if (_balanceController.text.isNotEmpty &&
                      CommonUtils.isValidInteger(_balanceController.text)) {
                    LoggerService.logDebug(
                        "Balance is valid integer: ${int.parse(_balanceController.text)}");

                    BlocProvider.of<HomeBloc>(context)
                        .add(addHomeBalanceEvent(_balanceController.text));

                    Navigator.pop(context);
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
