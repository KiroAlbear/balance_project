import 'package:balance_project/imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteBeneficiaryAlertDialog extends StatelessWidget {
  final String phoneNumber;
  const DeleteBeneficiaryAlertDialog({required this.phoneNumber, super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: const Text("Delete Beneficiary"),
      content: const Text("Are you sure you want to delete this beneficiary?"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            "Cancel",
            style: const TextStyle().copyWith(color: StaticColors.themeColor),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            BlocProvider.of<BeneficiariesBloc>(context)
                .add(deleteBeneficiaryEvent(phoneNumber: phoneNumber));
          },
          child: Text("Delete",
              style:
                  const TextStyle().copyWith(color: StaticColors.themeColor)),
        ),
      ],
    );
    ;
  }
}
