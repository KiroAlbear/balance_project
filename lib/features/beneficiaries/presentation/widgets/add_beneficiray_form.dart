import 'package:balance_project/imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddBeneficirayForm extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final int itemsCount;
  AddBeneficirayForm({required this.itemsCount, super.key});

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
                hint: "write a name",
                lable: "Name",
                icon: Assets.images.svg.icProfile.path,
                isRequired: true,
                maxLength: 20,
                controller: _nameController),
            25.flexPaddingHeight,
            CustomTextField(
                hint: "write a phone",
                lable: "Phone",
                icon: Assets.images.svg.icPhone.path,
                isRequired: true,
                type: CustomTextFieldType.number,
                controller: _phoneController),
            20.flexPaddingHeight,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppDimensions.w(12)),
              child: CustomElevatedButton(
                child: const Text(
                  "Add",
                ),
                onPressed: () {
                  if (itemsCount >= 5) {
                    AppToast.showToast(
                        "You can't add more than 5 beneficiaries");
                    return;
                  }
                  _formKey.currentState!.validate();
                  if (_nameController.text.isNotEmpty &&
                      _phoneController.text.isNotEmpty) {
                    BlocProvider.of<BeneficiariesBloc>(context).add(
                      addBeneficiaryEvent(
                        name: _nameController.text,
                        phoneNumber: _phoneController.text,
                      ),
                    );
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
