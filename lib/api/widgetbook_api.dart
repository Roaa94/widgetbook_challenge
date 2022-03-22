import 'dart:math';

/// An exception thrown by [WidgetbookApi].
class UnexpectedException with Exception {}

/// A class simulating an API wrapper.
///
/// HINT: Be aware that the implementation might throw
/// [UnexpectedException]s.
class WidgetbookApi {
  /// Creates a new instance of [WidgetbookApi].
  WidgetbookApi({
    Random? randomNumberGenerator,
  }) : randomNumberGenerator = randomNumberGenerator ?? Random();

  /// A random number generator to create the flakyness of the API.
  final Random randomNumberGenerator;

  /// Returns a "Hello [message]".
  Future<String> welcomeToWidgetbook({
    required String message,
  }) async {
    await _simulateSlowNetworkConnection();
    return _simulateFaultyBackendImplementation(message: message);
  }

  /// An implementation of a flaky backend implementation.
  /// Returns a "Hello [message]" with a probability of about .66
  /// or throws an [UnexpectedException] otherwise.
  Future<String> _simulateFaultyBackendImplementation({
    required String message,
  }) async {
    final number = randomNumberGenerator.nextInt(3);
    if (number.isOdd) {
      throw UnexpectedException();
    }

    return 'Hello $message';
  }

  /// A function which returns after [seconds] without any value.
  ///
  /// This is used to simulate a slow network connection.
  Future<void> _simulateSlowNetworkConnection({
    int seconds = 1,
  }) {
    return Future.delayed(
      Duration(
        seconds: seconds,
      ),
    );
  }
}
