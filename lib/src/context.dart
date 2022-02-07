import 'package:tart/src/error_or.dart';

enum ContextKeys {
  methodName,
  serviceName,
  packageName,
  statusCode,
}

/// Context may passed around used to carry metadata during the lifecycle of a request
/// Unlike Go's context, this object contains nothing involving deadlines or cancellations
class Context {
  final Map<dynamic, dynamic> _map = <dynamic, dynamic>{};

  ErrorOr<dynamic> value(dynamic key) {
    if (_map.containsKey(key)) {
      return ErrorOr.withValue(_map[key]);
    }
    return ErrorOr.withError("Key not found");
  }
}

Context _copy(Context ctx) {
  final Context newCtx = Context();
  ctx._map.forEach((key, value) => newCtx._map[key] = value );
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
