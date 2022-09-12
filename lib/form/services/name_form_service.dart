import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgetbook_challenge/api/widgetbook_api.dart';
import 'package:widgetbook_challenge/core/api_provider.dart';
import 'package:widgetbook_challenge/core/exceptions/custom_exception.dart';

/// Riverpod provider for the [NameFormService]
final nameFormServiceProvider = Provider<NameFormService>(
  (ref) {
    final api = ref.watch(apiProvider);
    return NameFormService(api);
  },
);

/// Service responsible for submitting Name form to mock backend
class NameFormService {
  /// Creates instance of [NameFormService]
  NameFormService(this.api);

  /// Simulated API service
  final WidgetbookApi api;

  /// Method that submits name to mock backend
  Future<String> submit(String name) async {
    if (name.contains(RegExp('[0-9]'))) {
      throw CustomException('Name should not contain numbers!');
    }
    return api.welcomeToWidgetbook(message: name);
  }
}
