import 'package:balance_project/imports.dart';
import 'package:flutter/material.dart';

class BeneficiaryItem extends StatelessWidget {
  final String name;
  final String phone;
  const BeneficiaryItem({super.key, required this.name, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: Colors.white,
      margin: const EdgeInsets.all(0),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.w(8), vertical: AppDimensions.h(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: AppDimensions.w(70),
                  height: AppDimensions.h(70),
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                      child: Text(
                    name[0],
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  )),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: CustomTextStyles.bold_14_black(context),
                    ),
                    Text(phone)
                  ],
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return DeleteBeneficiaryAlertDialog(phoneNumber: phone);
                  },
                );
              },
              icon: Icon(
                Icons.delete,
                color: Colors.red[400],
              ),
            )
          ],
        ),
      ),
    );
  }
}
