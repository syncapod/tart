/// EXPERIMENTAL
/// ErrorOr is a more Go like way of handling errors
/// ErrorOr object will either contain an Error OR value of type T
class ErrorOr<T> {
  late T _value;
  String _error = "";

  ErrorOr.withError(String msg, T defaultValue) {
    _error = msg;
    _value = defaultValue;
  }

  ErrorOr.withValue(T value) {
    _value = value;
  }

  bool hasError() => _error.isNotEmpty;

  // getError will return an empty string if error is not present
  String getError() => _error;

  /// Only use getValue if hasError has returned true!
  T getValue() => _value;
}
