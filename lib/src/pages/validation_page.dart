import 'package:flutter/material.dart';
import 'package:password_validation_poc/src/pages/widgets/password_validation_panel_widget.dart';
import 'package:password_validation_poc/src/shared/colors_app.dart';
import 'package:password_validation_poc/src/shared/custom_text_field_pwd.dart';

class ValidationPage extends StatefulWidget {
  const ValidationPage({super.key});

  @override
  State<ValidationPage> createState() => _ValidationPageState();
}

class _ValidationPageState extends State<ValidationPage> {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsApp.lightGreyColor,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 44, bottom: 42),
                child: Image.asset('assets/images/logo.png'),
              ),
              Text(
                'Defina uma senha',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: ColorsApp.primaryColor,
                ),
              ),
              Text(
                'Uma senha forte ajuda a manter sua conta segura',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: ColorsApp.midiumGreyColor,
                ),
              ),
              const SizedBox(height: 26),
              CustomTextFieldPwd(
                label: 'Senha',
                backgroundColor: Colors.white,
                controller: passwordController,
              ),
              const SizedBox(height: 22),
              CustomTextFieldPwd(
                label: 'Confirmar senha',
                backgroundColor: Colors.white,
                controller: confirmPasswordController,
              ),
              const SizedBox(height: 37),
              PasswordValidationPanelWidget(
                passwordController: passwordController,
                confirmPasswordController: confirmPasswordController,
                onPasswordValid: (value) {},
              ),
              const SizedBox(height: 40),
              ElevatedButton(onPressed: () {}, child: Text('Senha Reprovada')),
            ],
          ),
        ),
      ),
    );
  }
}
