import 'package:balance_project/imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteBeneficirayAlertDialog extends StatelessWidget {
  final String phoneNumber;
  const DeleteBeneficirayAlertDialog({required this.phoneNumber, super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text("Delete Beneficiary"),
      content: Text("Are you sure you want to delete this beneficiary?"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            "Cancel",
            style: TextStyle().copyWith(color: StaticColors.themeColor),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            BlocProvider.of<BeneficiariesBloc>(context)
                .add(deleteBeneficiaryEvent(phoneNumber: phoneNumber));
          },
          child: Text("Delete",
              style: TextStyle().copyWith(color: StaticColors.themeColor)),
        ),
      ],
    );
    ;
  }
}
