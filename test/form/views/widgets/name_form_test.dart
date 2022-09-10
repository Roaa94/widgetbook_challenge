import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widgetbook_challenge/form/views/widgets/name_form.dart';

void main() {
  testWidgets(
    'shows error message for empty name field',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NameForm(),
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      expect(find.text('Name field is required'), findsOneWidget);
    },
  );

  testWidgets(
    'shows error message for invalid name',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: NameForm(),
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextFormField), 'Roaa1');
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      expect(find.text('Name should not contain numbers!'), findsOneWidget);
    },
  );

  testWidgets(
    'shows success message for valid name',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: NameForm(),
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextFormField), 'Roaa');
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      expect(find.text('Submitted successfully!'), findsOneWidget);
    },
  );
}
