/// Helper enum for status of the request
enum RequestStatus {
  /// The request is loading
  loading,

  /// The request returned an error
  error,

  /// The request was successful
  success,

  /// The request has not been sent yet
  idle,
}