import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:password_validation_poc/src/shared/custom_text_field_pwd.dart';

void main() {
  group('Grupo de teste do CustomTextFormField PWD', () {
    testWidgets('Deve redenrizar corretamente o CustomTextFormField', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomTextFieldPwd(
              label: 'Teste',
              backgroundColor: Colors.white,
              controller: TextEditingController(),
            ),
          ),
        ),
      );

      expect(find.byType(CustomTextFieldPwd), findsOneWidget);
    });

    testWidgets('Deve exibir o label corretamente', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomTextFieldPwd(
              label: 'Teste',
              backgroundColor: Colors.white,
              controller: TextEditingController(),
            ),
          ),
        ),
      );

      expect(find.text('Teste'), findsOneWidget);
      expect(find.byType(Text), findsOneWidget);
    });
    testWidgets('Deve exibir o ícone de visibilidade', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomTextFieldPwd(
              label: 'Teste',
              backgroundColor: Colors.white,
              controller: TextEditingController(),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.visibility_outlined), findsOneWidget);
    });
    testWidgets('Deve alternar o estado de obscureText', (
      WidgetTester tester,
    ) async {
      final controller = TextEditingController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomTextFieldPwd(
              label: 'Teste',
              backgroundColor: Colors.white,
              controller: controller,
            ),
          ),
        ),
      );

      expect(find.byType(CustomTextFieldPwd), findsOneWidget);

      expect(find.byIcon(Icons.visibility_outlined), findsOneWidget);

      await tester.tap(find.byIcon(Icons.visibility_outlined));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.visibility_off_outlined), findsOneWidget);
    });

    testWidgets('Deve verificar se o controller está sendo preenchido', (
      WidgetTester tester,
    ) async {
      final controller = TextEditingController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomTextFieldPwd(
              label: 'Teste',
              backgroundColor: Colors.white,
              controller: controller,
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextFormField), '123456');
      expect(controller.text, '123456');
    });
  });
}
