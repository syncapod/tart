import 'package:tart/src/error_or.dart';

enum ContextKeys {
  methodName,
  serviceName,
  packageName,
  statusCode,
  httpHeaders,
}

/// Context may passed around used to carry metadata during the lifecycle of a request
/// Unlike Go's context, this object contains nothing involving deadlines or cancellations
class Context {
  final Map<dynamic, dynamic> _map = <dynamic, dynamic>{};

  ErrorOr<dynamic> value(dynamic key) {
    if (_map.containsKey(key)) {
      return ErrorOr.withValue(_map[key]);
    }
    // TODO: not great that this is null, but ErrorOr does warn
    return ErrorOr.withError("Key not found", null);
  }
}

Context _copy(Context ctx) {
  final Context newCtx = Context();
  ctx._map.forEach((key, value) => newCtx._map[key] = value);
  return newCtx;
}

Context withValue(Context ctx, dynamic key, dynamic value) {
  Context newCtx = _copy(ctx);
  newCtx._map[key] = value;
  return newCtx;
}

Context withMethodName(Context ctx, String name) {
  return withValue(ctx, ContextKeys.methodName, name);
}

Context withServiceName(Context ctx, String name) {
  return withValue(ctx, ContextKeys.serviceName, name);
}

Context withPackageName(Context ctx, String name) {
  return withValue(ctx, ContextKeys.packageName, name);
}

Context withStatusCode(Context ctx, int code) {
  return withValue(ctx, ContextKeys.statusCode, code);
}

ErrorOr<Context> withHttpRequestHeaders(
    Context ctx, Map<String, String> header) {
  final keys = header.keys.toList();
  for (String key in keys) {
    final value = header[key] ?? '';
    header.remove(key);
    key = key.toLowerCase();
    header[key] = value;
    switch (key) {
      case 'allow':
        return ErrorOr.withError('provided header cannot set allow', ctx);
      case 'content-type':
        return ErrorOr.withError(
            'provided header cannot set content-type', ctx);
      case 'twirp-version':
        return ErrorOr.withError(
            'provided header cannot set twirp-version', ctx);
    }
  }

  final ctxHeaderValue = ctx.value(ContextKeys.httpHeaders);
  Map<String, String> newHeader = {};
  if (!ctxHeaderValue.hasError()) {
    newHeader.addAll(ctxHeaderValue.getValue());
  }

  // TODO: how do we know all the header keys are lowercase?
  newHeader.addAll(header);

  return ErrorOr.withValue(withValue(ctx, ContextKeys.httpHeaders, newHeader));
}

ErrorOr<Map<String, String>> retrieveHttpRequestHeaders(Context ctx) {
  final headerValue = ctx.value(ContextKeys.httpHeaders);
  if (headerValue.hasError()) {
    return ErrorOr.withError('no headers exist', {});
  }
  return ErrorOr.withValue(headerValue.getValue());
}
