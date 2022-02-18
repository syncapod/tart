import 'package:tart/tart.dart';

enum ErrorCode {
  /// The client specified an invalid argument. This indicates arguments that are invalid regardless of the state of the system (i.e. a malformed file name, required argument, number out of range, etc.).
  invalid_argument,

  /// The client sent a message which could not be decoded. This may mean that the message was encoded improperly or that the client and server have incompatible message definitions.
  malformed,

  /// The operation was attempted past the valid range. For example, seeking or reading past end of a paginated collection. Unlike "invalid_argument", this error indicates a problem that may be fixed if the system state changes (i.e. adding more items to the collection). There is a fair bit of overlap between "failed_precondition" and "out_of_range". We recommend using "out_of_range" (the more specific error) when it applies so that callers who are iterating through a space can easily look for an "out_of_range" error to detect when they are done.
  out_of_range,

  /// The request does not have valid authentication credentials for the operation.
  unauthenticated,

  /// The caller does not have permission to execute the specified operation. It must not be used if the caller cannot be identified (use "unauthenticated" instead).
  permission_denied,

  /// Some requested entity was not found.
  not_found,

  /// The requested URL path wasn't routable to a Twirp service and method. This is returned by generated server code and should not be returned by application code (use "not_found" or "unimplemented" instead).
  bad_route,

  /// The operation was cancelled.
  canceled,

  /// Operation expired before completion. For operations that change the state of the system, this error may be returned even if the operation has completed successfully (timeout).
  deadline_exceeded,

  /// An attempt to create an entity failed because one already exists.
  already_exists,

  /// The operation was aborted, typically due to a concurrency issue like sequencer check failures, transaction aborts, etc.
  aborted,

  /// The operation was rejected because the system is not in a state required for the operation's execution. For example, doing an rmdir operation on a directory that is non-empty, or on a non-directory object, or when having conflicting read-modify-write on the same resource.
  failed_precondition,

  /// Some resource has been exhausted or rate-limited, perhaps a per-user quota, or perhaps the entire file system is out of space.
  resource_exhausted,

  /// An unknown error occurred. For example, this can be used when handling errors raised by APIs that do not return any error information.
  unknown,

  /// When some invariants expected by the underlying system have been broken. In other words, something bad happened in the library or backend service. Twirp specific issues like wire and serialization problems are also reported as "internal" errors.
  internal,
  dataloss,

  /// The operation is not implemented or not supported/enabled in this service.
  unimplemented,

  /// The service is currently unavailable. This is most likely a transient condition and may be corrected by retrying with a backoff.
  unavailable,
}

extension ErrorCodeString on ErrorCode {
  String get shortString {
    return toString().split('.').last;
  }
}

/// twirpErrorMap contains twirp ErrorCodes mapped to http status codes
Map<ErrorCode, int> twirpErrorMap = {
  ErrorCode.invalid_argument: 400,
  ErrorCode.malformed: 400,
  ErrorCode.out_of_range: 400,
  ErrorCode.unauthenticated: 401,
  ErrorCode.permission_denied: 403,
  ErrorCode.not_found: 404,
  ErrorCode.bad_route: 404,
  ErrorCode.canceled: 408,
  ErrorCode.deadline_exceeded: 408,
  ErrorCode.already_exists: 409,
  ErrorCode.aborted: 409,
  ErrorCode.failed_precondition: 412,
  ErrorCode.resource_exhausted: 429,
  ErrorCode.unknown: 500,
  ErrorCode.internal: 500,
  ErrorCode.dataloss: 500,
  ErrorCode.unimplemented: 501,
  ErrorCode.unavailable: 503,
};

/// [TwirpError] is a Twirp error implementation that can be used with dart exception handling
/// Contains [ErrorCode] _code, [String] _msg, [Map<String, String>] _meta, [Context] _ctx
class TwirpError implements Exception {
  late ErrorCode _code;
  late String _msg;
  Map<String, dynamic> _meta = {};
  late Context _ctx;

  TwirpError(ErrorCode code, String msg, Context ctx) {
    _code = code;
    _msg = msg;
    _ctx = ctx;
  }

  TwirpError.fromJson(Map<String, dynamic> json, Context ctx) {
    _code = ErrorCode.values.firstWhere(
        (element) => element.shortString == json['code'],
        orElse: () => ErrorCode.unknown);
    _msg = json['msg'] ?? '';
    _meta = json['meta'] ?? {};
    _ctx = ctx;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = _code.shortString;
    data['msg'] = _msg;
    data['meta'] = _meta;
    return data;
  }

  /// Error.fromConnectionError is used by generated code to create a twirp error
  /// from an error message [errMsg] with default [ErrorCode] [ErrorCode.internal]
  TwirpError.fromConnectionError(String errMsg, Context ctx) {
    _code = ErrorCode.internal;
    _msg = errMsg;
    _meta = {};
    _ctx = ctx;
  }

  /// withMeta returns a new error the copied meta values of the old error and
  /// includes the new key/value pair
  TwirpError withMeta(String key, String value) {
    final newErr = TwirpError(_code, _msg, _ctx);
    newErr._meta.addAll(_meta);
    newErr._meta[key] = value;
    return newErr;
  }

  ErrorCode get getCode => _code;

  String get getMsg => _msg;

  Context get getContext => _ctx;

  /// getMetaValue returns value if exists else return an empty string
  String getMetaValue(String key) {
    return _meta[key] ?? '';
  }

  @override
  String toString() {
    return 'twirp error $_code: $_msg';
  }
}
