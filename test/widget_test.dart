import 'package:flutter_test/flutter_test.dart';
import 'package:widgetbook_challenge/app.dart';

void main() {
  testWidgets('$App contains reminder', (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    expect(find.text('Hello Flutter enthusiast!'), findsOneWidget);
  });
}
