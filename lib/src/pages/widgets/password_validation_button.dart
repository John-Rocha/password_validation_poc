import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:password_validation_poc/src/shared/colors_app.dart';

enum PasswordValidationButtonVariant { approved, reproved }

class PasswordValidationButton extends StatelessWidget {
  final PasswordValidationButtonVariant variant;

  const PasswordValidationButton({super.key, required this.variant});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: switch (variant) {
            PasswordValidationButtonVariant.approved => ColorsApp.primaryColor,

            PasswordValidationButtonVariant.reproved => ColorsApp.redColor,
          },

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          switch (variant) {
            PasswordValidationButtonVariant.approved =>
              'Senha aprovada'.toUpperCase(),

            PasswordValidationButtonVariant.reproved =>
              'Senha reprovada'.toUpperCase(),
          },
          style: GoogleFonts.inter(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
