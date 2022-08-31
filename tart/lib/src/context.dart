enum ContextKeys {
  methodName,
  serviceName,
  packageName,
  statusCode,
  httpHeaders,
}

/// Context may passed around used to carry metadata during the lifecycle of a request
class Context {
  final Map<dynamic, dynamic> _map = <dynamic, dynamic>{};

  dynamic value(dynamic key) {
    return _map[key];
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

/// withHttpRequestHeaders adds [headersToAdd] to the given [ctx])
/// Will throw [InvalidTwirpHeader] if allow, content-type, or twirp-version
/// are trying to be set
Context withHttpRequestHeaders(Context ctx, Map<String, String> headersToAdd) {
  final keys = headersToAdd.keys.toList();
  for (String key in keys) {
    final value = headersToAdd[key] ?? '';
    headersToAdd.remove(key);
    key = key.toLowerCase();
    headersToAdd[key] = value;
    switch (key) {
      case 'accept':
        throw InvalidTwirpHeader('provided header cannot set accept');
      case 'content-type':
        throw InvalidTwirpHeader('provided header cannot set content-type');
      case 'twirp-version':
        throw InvalidTwirpHeader('provided header cannot set twirp-version');
    }
  }

  final Map<String, String> newHeaders = {};
  final Map<String, String> headers = ctx.value(ContextKeys.httpHeaders) ?? {};
  newHeaders.addAll(headers);
  newHeaders.addAll(headersToAdd);

  return withValue(ctx, ContextKeys.httpHeaders, newHeaders);
}

Map<String, String>? retrieveHttpRequestHeaders(Context ctx) {
  return ctx.value(ContextKeys.httpHeaders);
}

class InvalidTwirpHeader implements Exception {
  late String _msg;

  InvalidTwirpHeader(String msg) {
    _msg = msg;
  }

  @override
  String toString() {
    return _msg;
  }
}
