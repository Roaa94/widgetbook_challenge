import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:widgetbook_challenge/api/widgetbook_api.dart';
import 'package:widgetbook_challenge/core/api_provider.dart';
import 'package:widgetbook_challenge/form/views/widgets/name_form.dart';

import '../../../mocks.dart';

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
      const name = 'Roaa';
      final mockRandom = MockRandom();
      final api = WidgetbookApi(randomNumberGenerator: mockRandom);
      when(() => mockRandom.nextInt(3)).thenReturn(2);

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            apiProvider.overrideWithValue(api),
          ],
          child: const MaterialApp(
            home: Scaffold(
              body: NameForm(),
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextFormField), name);
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      expect(find.text('Hello $name'), findsOneWidget);
    },
  );
}
