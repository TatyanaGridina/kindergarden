abstract class Result<T> {
  const Result._(this.data, this.error);

  final T? data;
  final Error? error;

  bool get isOk => error == null;

  bool get isErr => error != null;

  @override
  String toString() {
    if (isOk) {
      return 'Result{data: $data}';
    } else {
      return 'Result{error: $error}';
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Result && runtimeType == other.runtimeType && data == other.data && error == other.error;

  @override
  int get hashCode => data.hashCode ^ error.hashCode;
}

class Ok<T> extends Result<T> {
  const Ok(T data) : super._(data, null);
}

class Err<T> extends Result<T> {
  Err(Error? error) : super._(null, error ?? Error(message: 'null'));
}

class Error {
  final String message;
  final String debugMessage;
  final Object? source;

  Error({String? message, String? debugMessage, this.source})
      : message = message ?? 'Unknown error',
        debugMessage = debugMessage ?? message ?? 'Unknown error';

  @override
  String toString() => 'Err{message: $message, debugMessage: $debugMessage, source: $source}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Error &&
          runtimeType == other.runtimeType &&
          message == other.message &&
          debugMessage == other.debugMessage &&
          source == other.source;

  @override
  int get hashCode => message.hashCode ^ debugMessage.hashCode ^ source.hashCode;
}
