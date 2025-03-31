import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:password_validation_poc/src/pages/widgets/password_dot_validation_widget.dart';
import 'package:password_validation_poc/src/pages/widgets/password_validation_panel_widget.dart';

void main() {
  group('PasswordValidationPanelWidget tests', () {
    late TextEditingController passwordController;
    late TextEditingController confirmPasswordController;
    late bool passwordValid;

    setUp(() {
      passwordController = TextEditingController();
      confirmPasswordController = TextEditingController();
      passwordValid = false;
    });

    tearDown(() {
      passwordController.dispose();
      confirmPasswordController.dispose();
    });

    Future<void> pumpWidget(WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PasswordValidationPanelWidget(
              passwordController: passwordController,
              confirmPasswordController: confirmPasswordController,
              onPasswordValid: (valid) {
                passwordValid = valid;
              },
            ),
          ),
        ),
      );
    }

    void dotRuleByKey({required WidgetTester tester, required int valueKey}) {
      final dotRulesFilter = find.byType(PasswordDotValidationWidget);

      for (final dot in dotRulesFilter.evaluate()) {
        final widgetKey = dot.widget.key!;
        final dotVisibilityFinder = find.descendant(
          of: find.byKey(widgetKey),
          matching: find.byType(Visibility),
        );
        final dotVisibility = tester.widget<Visibility>(dotVisibilityFinder);

        if (widgetKey == ValueKey(valueKey)) {
          expect(dotVisibility.visible, isFalse);
        } else {
          expect(dotVisibility.visible, isTrue);
        }
      }
    }

    testWidgets('should validate a complete valid password', (tester) async {
      await pumpWidget(tester);

      passwordController.text = 'Abcdef1#';
      confirmPasswordController.text = 'Abcdef1#';
      await tester.pump();

      expect(passwordValid, isTrue);
    });

    testWidgets('should be invalid if missing min length', (tester) async {
      await pumpWidget(tester);

      passwordController.text = 'Ab1#';
      confirmPasswordController.text = 'Ab1#';
      await tester.pump();

      dotRuleByKey(tester: tester, valueKey: 0);

      expect(passwordValid, isFalse);
    });

    testWidgets('should be invalid if missing uppercase letter', (
      tester,
    ) async {
      await pumpWidget(tester);

      passwordController.text = 'abcdef1#';
      confirmPasswordController.text = 'abcdef1#';
      await tester.pump();

      expect(passwordValid, isFalse);
    });

    testWidgets('should be invalid if missing number', (tester) async {
      await pumpWidget(tester);

      passwordController.text = 'Abcdefg#';
      confirmPasswordController.text = 'Abcdefg#';
      await tester.pump();

      expect(passwordValid, isFalse);
    });

    testWidgets('should be invalid if missing special character', (
      tester,
    ) async {
      await pumpWidget(tester);

      passwordController.text = 'Abcdefg1';
      confirmPasswordController.text = 'Abcdefg1';
      await tester.pump();

      expect(passwordValid, isFalse);
    });

    testWidgets('should be invalid if confirmation password does not match', (
      tester,
    ) async {
      await pumpWidget(tester);

      passwordController.text = 'Abcdef1#';
      confirmPasswordController.text = 'Wrong123#';
      await tester.pump();

      expect(passwordValid, isFalse);
    });
  });
}
