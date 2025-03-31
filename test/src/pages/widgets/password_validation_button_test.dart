import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:password_validation_poc/src/pages/widgets/password_validation_button.dart';
import 'package:password_validation_poc/src/shared/colors_app.dart';

void main() {
  group('Password Validation Button tests', () {
    testWidgets('PasswordValidationButton with approved variant', (
      WidgetTester tester,
    ) async {
      await pumpWidget(tester, PasswordValidationButtonVariant.approved);

      final buttonFinder = find.byType(PasswordValidationButton);
      expect(buttonFinder, findsOneWidget);

      final button = tester.widget<PasswordValidationButton>(buttonFinder);
      expect(button.variant, PasswordValidationButtonVariant.approved);
    });

    testWidgets('PasswordValidationButton with reproved variant', (
      WidgetTester tester,
    ) async {
      await pumpWidget(tester, PasswordValidationButtonVariant.reproved);

      final buttonFinder = find.byType(PasswordValidationButton);
      expect(buttonFinder, findsOneWidget);

      final button = tester.widget<PasswordValidationButton>(buttonFinder);
      expect(button.variant, PasswordValidationButtonVariant.reproved);
    });

    testWidgets(
      'PasswordValidationButton has correct text to approved variant',
      (WidgetTester tester) async {
        await pumpWidget(tester, PasswordValidationButtonVariant.approved);

        final buttonFinder = find.text('Senha aprovada'.toUpperCase());
        expect(buttonFinder, findsOneWidget);
      },
    );

    testWidgets(
      'PasswordValidationButton has primary color for approved variant',
      (WidgetTester tester) async {
        await pumpWidget(tester, PasswordValidationButtonVariant.approved);

        final elevatedButton = tester.widget<ElevatedButton>(
          find.byType(ElevatedButton),
        );
        final style = elevatedButton.style;

        final bgColor = style?.backgroundColor?.resolve({});
        expect(bgColor, ColorsApp.primaryColor);
      },
    );

    testWidgets('PasswordValidationButton has red color for reproved variant', (
      WidgetTester tester,
    ) async {
      await pumpWidget(tester, PasswordValidationButtonVariant.reproved);

      final elevatedButton = tester.widget<ElevatedButton>(
        find.byType(ElevatedButton),
      );
      final style = elevatedButton.style;

      final bgColor = style?.backgroundColor?.resolve({});
      expect(bgColor, ColorsApp.redColor);
    });
  });
}

Future<void> pumpWidget(
  WidgetTester tester,
  PasswordValidationButtonVariant variant,
) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(body: PasswordValidationButton(variant: variant)),
    ),
  );
}
