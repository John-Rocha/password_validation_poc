import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:password_validation_poc/src/pages/widgets/password_dot_validation_widget.dart';

class MockUpdateMatchCallback extends Mock {
  void call(ValueKey<int> key, bool isMatch);
}

void main() {
  group('PasswordDotValidation tests', () {
    testWidgets('should check if the password is valid', (
      WidgetTester tester,
    ) async {
      final mockUpdateMatch = MockUpdateMatchCallback();
      const testKey = ValueKey<int>(1);

      registerFallbackValue(testKey);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PasswordDotValidationWidget(
              key: testKey,
              label: 'Somente números',
              patternValidation: r'^[0-9]+$',
              passwordValue: ValueNotifier('12345678'),
              updateMatch: mockUpdateMatch.call,
            ),
          ),
        ),
      );

      final checked = tester.widget<Visibility>(find.byType(Visibility));

      expect(checked.visible, isTrue);

      verify(() => mockUpdateMatch(testKey, true)).called(1);
    });

    testWidgets('should check if the password is invalid', (
      WidgetTester tester,
    ) async {
      final mockUpdateMatch = MockUpdateMatchCallback();
      const testKey = ValueKey<int>(1);

      registerFallbackValue(testKey);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PasswordDotValidationWidget(
              key: testKey,
              label: 'Somente números',
              patternValidation: r'^[0-9]+$',
              passwordValue: ValueNotifier('12345678a'),
              updateMatch: mockUpdateMatch.call,
            ),
          ),
        ),
      );

      final checked = tester.widget<Visibility>(find.byType(Visibility));

      expect(checked.visible, isFalse);

      verify(() => mockUpdateMatch(testKey, false)).called(1);
    });
  });
}
