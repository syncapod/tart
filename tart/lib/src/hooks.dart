import 'dart:io';

import 'context.dart';
import 'error.dart';

/// ClientHooks contains functions that can be used on the generated client constructor.
/// They provide callbacks for before and after the request is sent over the network.
class ClientHooks {
  /// onRequestPrepared is called immediately after headers are set, but before body is sent
  Function(Context ctx, HttpClientRequest req) onRequestPrepared;

  /// onError called only if an error was returned through the network.
  Function(Context ctx, Error err) onError;

  /// onResponseReceived is only called when response has been received without error
  Function(Context ctx) onResponseReceived;

  ClientHooks({
    this.onRequestPrepared = defaultOnRequestPrepared,
    this.onError = defaultOnError,
    this.onResponseReceived = defaultOnResponseReceived,
  });

  static void defaultOnRequestPrepared(ctx, req) {/* do nothing */}
  static void defaultOnError(ctx, err) {/* do nothing */}
  static void defaultOnResponseReceived(ctx) {/* do nothing */}
}
