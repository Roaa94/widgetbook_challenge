import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Riverpod provider for the [NameFormService]
final nameFormServiceProvider = Provider<NameFormService>(
  (_) => NameFormService(),
);

/// Service responsible for submitting Name form to mock backend
class NameFormService {
  /// Method that submits name to mock backend
  Future<void> submit(String name) async {
    await Future<dynamic>.delayed(const Duration(seconds: 1));
    if (name.contains(RegExp('[0-9]'))) {
      throw Exception('Name should not contain numbers!');
    }
  }
}
