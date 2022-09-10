import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widgetbook_challenge/form/views/widgets/name_form.dart';

void main() {
  testWidgets(
    'cannot submit form for empty name field',
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
}
