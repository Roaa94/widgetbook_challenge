import 'package:flutter_test/flutter_test.dart';
import 'package:widgetbook_challenge/app.dart';
import 'package:widgetbook_challenge/form/views/pages/form_page.dart';

void main() {
  testWidgets('$App contains FormPage', (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    expect(find.byType(FormPage), findsOneWidget);
  });
}
