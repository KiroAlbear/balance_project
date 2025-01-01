import 'package:balance_project/config/colors/static_colors.dart';
import 'package:balance_project/config/font/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

// prevent copy and paste
enum CustomTextFieldType { number, email, text }

class CustomTextField extends StatefulWidget {
  final String hint;
  final String lable;
  final String icon;
  final bool isRequired;

  final int? maxLength;
  final TextEditingController controller;
  final bool isButton;
  final void Function()? onTap;
  final CustomTextFieldType type;
  CustomTextField(
      {required this.hint,
      required this.lable,
      required this.icon,
      required this.controller,
      this.maxLength,
      this.isRequired = false,
      this.isButton = false,
      this.onTap,
      this.type = CustomTextFieldType.text}) {
    if (isButton) {
      assert(onTap != null);
    }
  }

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final double _verticalPadding = 8.0;

  bool _isValid = true;
  Widget _buildBaseWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: _isValid ? Colors.transparent : Colors.red,
              width: 1.0,
            ),
            boxShadow: [
              BoxShadow(
                color: (_isValid ? StaticColors.themeColor : Colors.red)
                    .withOpacity(0.16),
                spreadRadius: 5.0,
                blurRadius: 20.0,
              ),
              BoxShadow(
                color: Colors.white,
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SvgPicture.asset(
                widget.icon,
                colorFilter: ColorFilter.mode(
                    _isValid ? StaticColors.themeColor : Colors.red,
                    BlendMode.srcIn),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: _verticalPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: widget.lable,
                              style:
                                  CustomTextStyles.semiBold_14_black_noSpacing(
                                context,
                              ),
                            ),
                            TextSpan(
                              text: widget.isRequired ? " *" : "",
                              style: TextStyle(
                                color: StaticColors.themeColor,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 220,
                        child: TextFormField(
                          maxLength: widget.maxLength,
                          keyboardType:
                              widget.type == CustomTextFieldType.number
                                  ? TextInputType.number
                                  : widget.type == CustomTextFieldType.email
                                      ? TextInputType.emailAddress
                                      : TextInputType.text,
                          inputFormatters: [
                            if (widget.type == CustomTextFieldType.number)
                              FilteringTextInputFormatter.digitsOnly,
                            if (widget.type == CustomTextFieldType.email)
                              FilteringTextInputFormatter.singleLineFormatter
                          ],
                          validator: (value) {
                            if ((value == null || value.isEmpty) &&
                                widget.isRequired) {
                              setState(() {
                                _isValid = false;
                              });
                            } else {
                              setState(() {
                                _isValid = true;
                              });
                            }
                            return null;
                          },
                          controller: widget.controller,
                          style: CustomTextStyles.regular_14_black_noSpacing(
                              context),
                          cursorColor: StaticColors.themeColor,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 0),
                            hintText: widget.hint,
                            hintStyle: TextStyle(
                              height: 1,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 2,
        ),
        !_isValid
            ? Text(
                "This Field is Required",
                textAlign: TextAlign.start,
                style: CustomTextStyles.regular_12_red_noSpacing(context),
              )
            : SizedBox(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.isButton
        ? InkWell(
            onTap: widget.onTap,
            child: IgnorePointer(
                ignoring: widget.isButton, child: _buildBaseWidget(context)),
          )
        : _buildBaseWidget(context);
  }
}
