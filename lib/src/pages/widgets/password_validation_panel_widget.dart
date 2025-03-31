import 'package:flutter/material.dart';
import 'package:password_validation_poc/src/pages/widgets/password_dot_validation_widget.dart';
import 'package:password_validation_poc/src/shared/colors_app.dart';

class PasswordValidationPanelWidget extends StatefulWidget {
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final ValueChanged<bool> onPasswordValid;

  const PasswordValidationPanelWidget({
    super.key,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.onPasswordValid,
  });

  @override
  State<PasswordValidationPanelWidget> createState() =>
      _PasswordValidationPanelWidgetState();
}

class _PasswordValidationPanelWidgetState
    extends State<PasswordValidationPanelWidget> {
  final validationRulesPasswordText = ValueNotifier('');

  final approvedRule = List.generate(5, (_) => false);

  bool isPasswordValid = false;

  @override
  void initState() {
    super.initState();
    final PasswordValidationPanelWidget(
      :passwordController,
      :confirmPasswordController,
    ) = widget;

    passwordController.addListener(() {
      validationRulesPasswordText.value = passwordController.text;
    });
  }

  void updateValidRules(ValueKey<int> key, bool isMatch) {
    approvedRule[key.value] = isMatch;

    checkRules();
  }

  void checkRules() {
    final valid = approvedRule.every((rule) => rule);
    if (valid != isPasswordValid) {
      isPasswordValid = valid;
      widget.onPasswordValid(valid);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 6),
          child: Text(
            'Sua senha deve conter'.toUpperCase(),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: ColorsApp.primaryColor,
            ),
          ),
        ),
        PasswordDotValidationWidget(
          label: 'Mínimo de 8 caracteres',
          key: ValueKey(0),
          passwordValue: validationRulesPasswordText,
          patternValidation: r'^.{8,}$',
          updateMatch: updateValidRules,
        ),
        PasswordDotValidationWidget(
          label: '1 letra maiúscula',
          key: ValueKey(1),
          passwordValue: validationRulesPasswordText,
          patternValidation: r'[A-Z]',
          updateMatch: updateValidRules,
        ),
        PasswordDotValidationWidget(
          label: '1 ou mais números',
          key: ValueKey(2),
          passwordValue: validationRulesPasswordText,
          patternValidation: r'[0-9]',
          updateMatch: updateValidRules,
        ),
        PasswordDotValidationWidget(
          label: '1 ou mais caracteres especial',
          key: ValueKey(3),
          passwordValue: validationRulesPasswordText,
          patternValidation:
              r'^(?=.*[!@#\$%\^&\*\(\)_\+\-=\[\]{};:"\\|,.<>\/?]).+$',
          updateMatch: updateValidRules,
        ),

        ValueListenableBuilder(
          valueListenable: widget.confirmPasswordController,
          builder: (_, confirmPasswordText, _) {
            return PasswordDotValidationWidget(
              label: 'Senhas igual a confirmar senha',
              key: ValueKey(4),
              passwordValue: validationRulesPasswordText,
              patternValidation:
                  '^${RegExp.escape(confirmPasswordText.text)}\$',
              updateMatch: updateValidRules,
            );
          },
        ),
      ],
    );
  }
}
