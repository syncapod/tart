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

class Error implements Exception {
  ErrorCode code = ErrorCode.unknown;
  String msg = '';
  Map<String, String> _meta = {};

  Error(this.code, this.msg);

  Error.fromJson(Map<String, dynamic> json) {
    code = ErrorCode.values.firstWhere(
        (element) => element.toString() == json['code'],
        orElse: () => ErrorCode.unknown);
    msg = json['msg'] ?? '';
    _meta = json['meta'] ?? {};
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code.toString();
    data['msg'] = msg;
    data['meta'] = _meta;
    return data;
  }

  Error.fromConnectionError(String errMsg) {
    code = ErrorCode.internal;
    msg = errMsg;
    _meta = {};
  }

  ErrorCode get getCode => code;

  String get getMsg => msg;

  String getMetaValue(String key) {
    return _meta[key] ?? '';
  }

  Error withMeta(String key, String value) {
    final newErr = Error(code, msg);
    newErr._meta.addAll(_meta);
    newErr._meta[key] = value;
    return newErr;
  }

  @override
  String toString() {
    return 'twirp error $code: $msg';
  }
}
