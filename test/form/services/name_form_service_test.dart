import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widgetbook_challenge/form/services/name_form_service.dart';

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
    final service = NameFormService();
    expect(
      () async => service.submit('Roaa1'),
      throwsA(isA<Exception>()),
    );
  });
}
