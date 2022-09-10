/// Custom exception class
class CustomException implements Exception {
  /// Creates instance of [CustomException]
  CustomException(this.message);

  /// String message for exception
  final String message;
}
