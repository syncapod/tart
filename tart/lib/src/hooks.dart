import 'dart:async';

import 'package:http/http.dart' as http;

import 'context.dart';
import 'error.dart';

/// ClientHooks contains functions that can be used on the generated client constructor.
/// They provide callbacks for before and after the request is sent over the network.
class ClientHooks {
  /// onRequestPrepared is after request has been prepared and immediately before request is sent
  FutureOr<Context> Function(Context ctx, http.Request req) onRequestPrepared;

  /// onResponseReceived is only called when response has been received without error
  FutureOr<void> Function(Context ctx) onResponseReceived;

  /// onError called only if an error was returned through the network.
  FutureOr<void> Function(Context ctx, TwirpError err) onError;

  ClientHooks({
    this.onRequestPrepared = defaultOnRequestPrepared,
    this.onResponseReceived = defaultOnResponseReceived,
    this.onError = defaultOnError,
  });

  static FutureOr<Context> defaultOnRequestPrepared(ctx, req) => ctx;

  static FutureOr<void> defaultOnResponseReceived(ctx) {/* do nothing */}

  static FutureOr<void> defaultOnError(ctx, err) {/* do nothing */}
}
