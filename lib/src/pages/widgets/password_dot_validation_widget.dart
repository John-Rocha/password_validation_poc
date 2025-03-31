import 'package:flutter/material.dart';
import 'package:password_validation_poc/src/shared/colors_app.dart';

typedef UpdateMatchCallback = void Function(ValueKey<int> key, bool isMatch);

class PasswordDotValidationWidget extends StatelessWidget {
  final String label;
  final String patternValidation;
  final ValueNotifier<String> passwordValue;
  final UpdateMatchCallback updateMatch;

  const PasswordDotValidationWidget({
    super.key,
    required this.label,
    required this.patternValidation,
    required this.passwordValue,
    required this.updateMatch,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: passwordValue,
      builder: (_, passwordText, _) {
        final isValueMatch =
            RegExp(patternValidation).hasMatch(passwordText) &&
            passwordText.isNotEmpty;
        updateMatch(super.key as ValueKey<int>, isValueMatch);

        return Row(
          spacing: 8,
          children: [
            Container(
              width: 13,
              height: 13,
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Visibility(
                visible: isValueMatch,
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorsApp.primaryColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),

            Text(
              label,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
                color: ColorsApp.coolGreyColor,
              ),
            ),
          ],
        );
      },
    );
  }
}
