import 'package:flutter/material.dart';
import 'package:password_validation_poc/src/shared/colors_app.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String? hintText;
  final Color backgroundColor;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final bool? obscureText;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final Key? textFieldKey;

  const CustomTextField({
    super.key,
    required this.label,
    this.hintText,
    required this.backgroundColor,
    this.suffixIcon,
    required this.controller,
    this.obscureText,
    this.validator,
    this.focusNode,
    this.keyboardType,
    this.textFieldKey,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    final CustomTextField(
      :label,
      :hintText,
      :backgroundColor,
      :suffixIcon,
      :controller,
      :focusNode,
      :textFieldKey,
      :keyboardType,
      :obscureText,
      :validator,
    ) = widget;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: ColorsApp.primaryColor,
          ),
        ),
        TextFormField(
          key: textFieldKey,
          controller: controller,
          focusNode: focusNode,
          obscureText: obscureText ?? false,
          validator: validator,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText,
            fillColor: backgroundColor,
            filled: true,
            isDense: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}
