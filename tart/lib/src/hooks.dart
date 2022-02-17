import 'package:http/http.dart' as http;
import 'context.dart';
import 'error.dart';

/// ClientHooks contains functions that can be used on the generated client constructor.
/// They provide callbacks for before and after the request is sent over the network.
class ClientHooks {
  /// onRequestPrepared is after request has been prepared and immediately before request is sent
  Context Function(Context ctx, http.Request req) onRequestPrepared;

  /// onResponseReceived is only called when response has been received without error
  Function(Context ctx) onResponseReceived;

  /// onError called only if an error was returned through the network.
  Function(Context ctx, Error err) onError;

  ClientHooks({
    this.onRequestPrepared = defaultOnRequestPrepared,
    this.onResponseReceived = defaultOnResponseReceived,
    this.onError = defaultOnError,
  });

  static Context defaultOnRequestPrepared(ctx, req) => ctx;

  static void defaultOnResponseReceived(ctx) {/* do nothing */}

  static void defaultOnError(ctx, err) {/* do nothing */}
}
