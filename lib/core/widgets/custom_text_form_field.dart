import 'package:balance_project/config/extensions/padding_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../imports.dart';

class CustomTextFormField extends StatefulWidget {
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String? hintText;
  final String? labelText;
  final bool isObscureText;
  final Widget? suffixIcon;
  final Widget? customFieldTitleWidget;
  final Color? backgroundColor;
  final int? minLines;
  final VoidCallback? onFieldTapped;
  final Function(String)? onFieldSubmitted;
  final bool isDimmed;
  final int? maxLength;
  final bool readOnly;
  final bool dismissKeyboardOnTapOutside;
  final String? initialText;
  final TextInputAction textInputAction;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final Function(String)? validator;
  final Function(String)? onChange;
  final bool isRequired;
  final AutovalidateMode autoValidationMode;
  final double? borderRadiusValue;

  const CustomTextFormField({
    super.key,
    this.focusNode,
    this.contentPadding,
    this.focusedBorder,
    this.inputTextStyle,
    this.hintStyle,
    this.hintText,
    this.labelText,
    this.isObscureText = false,
    this.suffixIcon,
    this.customFieldTitleWidget,
    this.backgroundColor,
    this.minLines,
    this.onFieldTapped,
    this.onFieldSubmitted,
    this.isDimmed = false,
    this.maxLength,
    this.readOnly = false,
    this.dismissKeyboardOnTapOutside = false,
    this.initialText,
    this.textInputAction = TextInputAction.next,
    this.controller,
    this.textInputType,
    this.validator,
    this.onChange,
    this.isRequired = true,
    this.autoValidationMode = AutovalidateMode.onUserInteraction,
    this.borderRadiusValue,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool obscureText;
  late Color enabledBorderColor;

  @override
  void initState() {
    obscureText = widget.isObscureText;

    _setInitialEnabledBorderColor();

    if (widget.controller != null) {
      widget.controller!.addListener(_updateEnabledBorderColor);
    }

    super.initState();
  }

  @override
  void dispose() {
    if (widget.controller != null) {
      widget.controller!.removeListener(_updateEnabledBorderColor);
      // widget.controller!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (widget.labelText != null ||
            widget.customFieldTitleWidget != null) ...<Widget>[
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 5),
            child: widget.customFieldTitleWidget ??
                Text(
                  widget.labelText ?? "",
                  style: widget.isDimmed
                      ? TextStyle(
                          fontSize: AppDimensions.getFonTSize18,
                          fontWeight: TextStyleBlueprint.boldFontWeight,
                          color: StaticColors.black_735)
                      : TextStyle(
                          fontSize: AppDimensions.getFonTSize18,
                          fontWeight: TextStyleBlueprint.boldFontWeight,
                          color: StaticColors.black_735),
                ),
          ),
          3.flexPaddingHeight,
        ],
        TextFormField(
          focusNode: widget.focusNode,
          initialValue: widget.initialText,
          keyboardType: widget.textInputType,
          autovalidateMode: widget.autoValidationMode,
          onTap: widget.onFieldTapped,
          minLines: widget.minLines ?? 1,
          maxLines: widget.minLines ?? 1,
          textInputAction: widget.textInputAction,
          onFieldSubmitted: widget.onFieldSubmitted,
          onChanged: widget.onChange,
          readOnly: widget.onFieldTapped != null
              ? true
              : widget.isDimmed
                  ? true
                  : widget.readOnly,
          controller: widget.controller,
          decoration: InputDecoration(
            contentPadding: widget.contentPadding ??
                EdgeInsets.symmetric(
                  horizontal: 20,
                ),
            focusedBorder: widget.focusedBorder ??
                OutlineInputBorder(
                  borderSide: BorderSide(
                    color: widget.onFieldTapped != null ||
                            widget.isDimmed ||
                            widget.readOnly
                        ? enabledBorderColor
                        : StaticColors.td_color,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: StaticColors.grey_2f7),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1.3,
              ),
              borderRadius:
                  BorderRadius.circular(widget.borderRadiusValue ?? 500.r),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1.3,
              ),
              borderRadius:
                  BorderRadius.circular(widget.borderRadiusValue ?? 500.r),
            ),
            errorStyle: TextStyle(
                fontSize: AppDimensions.getFonTSize14,
                fontWeight: TextStyleBlueprint.regularFontWeight,
                color: StaticColors.black_735),
            hintStyle: widget.hintStyle ??
                TextStyle(
                    fontSize: AppDimensions.getFonTSize14,
                    fontWeight: TextStyleBlueprint.regularFontWeight,
                    color: StaticColors.black_735),
            hintText: widget.hintText,
            suffixIcon: widget.isObscureText
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    icon: Icon(
                        obscureText ? Icons.visibility_off : Icons.visibility),
                  )
                : widget.suffixIcon,
            fillColor: widget.backgroundColor ?? Colors.white,
            filled: true,
          ),
          obscureText: obscureText,
          obscuringCharacter: '*',
          onTapOutside: widget.dismissKeyboardOnTapOutside
              ? (PointerDownEvent event) {
                  FocusScope.of(context).unfocus();
                }
              : null,
          style: widget.isDimmed
              ? TextStyle(
                  fontSize: AppDimensions.getFonTSize14,
                  fontWeight: TextStyleBlueprint.regularFontWeight,
                  color: StaticColors.black_735)
              : TextStyle(
                  fontSize: AppDimensions.getFonTSize14,
                  fontWeight: TextStyleBlueprint.regularFontWeight,
                  color: StaticColors.black_735),
          validator: (String? value) {
            if (widget.onFieldTapped == null) {
              if (widget.isRequired) {
                if (value == null || value.isEmpty) {
                  return "ⓘ هذا الحقل مطلوب";
                }
                if (widget.validator != null) {
                  String? validationMessage = widget.validator!(value);
                  if (validationMessage != null &&
                      validationMessage.isNotEmpty) {
                    return "ⓘ $validationMessage";
                  }
                }
              }
              return null;
            }
            return null;
          },
        ),
      ],
    );
  }

  void _setInitialEnabledBorderColor() {
    if (((widget.controller != null && widget.controller!.text.isNotEmpty) ||
        (widget.initialText != null && widget.initialText!.isNotEmpty))) {
      if (widget.isDimmed) {
        enabledBorderColor = StaticColors.appTheme_55B.withOpacity(0.2);
      } else if (widget.readOnly == true || widget.onFieldTapped != null) {
        enabledBorderColor = StaticColors.initialBorderColor_EE4;
      } else {
        enabledBorderColor = StaticColors.appTheme_55B;
      }
    } else {
      enabledBorderColor = StaticColors.initialBorderColor_EE4;
    }
  }

  void _updateEnabledBorderColor() {
    Color newEnabledBorderColor;
    if (widget.controller!.text.isNotEmpty) {
      if (widget.isDimmed) {
        newEnabledBorderColor = StaticColors.appTheme_55B.withOpacity(0.2);
      } else {
        newEnabledBorderColor = StaticColors.appTheme_55B;
      }
    } else {
      newEnabledBorderColor = StaticColors.initialBorderColor_EE4;
    }

    // Update the border color only if it changes
    if (newEnabledBorderColor != enabledBorderColor) {
      setState(() {
        enabledBorderColor = newEnabledBorderColor;
      });
    }
  }
}
