import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:widgetbook_challenge/api/widgetbook_api.dart';
import 'package:widgetbook_challenge/core/exceptions/custom_exception.dart';
import 'package:widgetbook_challenge/form/services/name_form_service.dart';

import '../../mocks.dart';

void main() {
  test('is instance of NameFormService', () {
    final providerContainer = ProviderContainer();

    addTearDown(providerContainer.dispose);

    expect(
      providerContainer.read(nameFormServiceProvider),
      isA<NameFormService>(),
    );
  });

  test('throws Exception for name with numbers', () {
    final api = MockWidgetbookApi();
    final service = NameFormService(api);
    expect(
      () async => service.submit('Roaa1'),
      throwsA(isA<CustomException>()),
    );
  });

  test('returns welcome message for valid name and non-odd number', () async {
    const name = 'Roaa';
    final mockRandom = MockRandom();
    final api = WidgetbookApi(randomNumberGenerator: mockRandom);
    when(() => mockRandom.nextInt(3)).thenReturn(2);
    final service = NameFormService(api);
    final message = await service.submit(name);
    expect(
      message,
      equals('Hello $name'),
    );
  });

  test('throws UnexpectedException for odd number', () async {
    const name = 'Roaa';
    final mockRandom = MockRandom();
    final api = WidgetbookApi(randomNumberGenerator: mockRandom);
    when(() => mockRandom.nextInt(3)).thenReturn(1);
    final service = NameFormService(api);
    expect(
      () async => service.submit(name),
      throwsA(isA<UnexpectedException>()),
    );
  });
}
