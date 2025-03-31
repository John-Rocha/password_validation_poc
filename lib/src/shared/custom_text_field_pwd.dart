import 'package:flutter/material.dart';
import 'package:password_validation_poc/src/shared/colors_app.dart';
import 'package:password_validation_poc/src/shared/custom_text_field.dart';

class CustomTextFieldPwd extends StatefulWidget {
  final String label;
  final Color backgroundColor;
  final TextEditingController controller;

  const CustomTextFieldPwd({
    super.key,
    required this.label,
    required this.backgroundColor,
    required this.controller,
  });

  @override
  State<CustomTextFieldPwd> createState() => _CustomTextFieldPwdState();
}

class _CustomTextFieldPwdState extends State<CustomTextFieldPwd> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    final CustomTextFieldPwd(:label, :backgroundColor, :controller) = widget;

    return CustomTextField(
      label: label,
      backgroundColor: backgroundColor,
      controller: controller,
      obscureText: obscureText,
      suffixIcon: IconButton(
        icon: Icon(
          obscureText
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
          color: ColorsApp.primaryColor,
        ),
        onPressed: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
      ),
    );
  }
}
