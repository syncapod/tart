import 'dart:math';

import 'package:client/protos/haberdasher.pbtwirp.dart';
import 'package:client/protos/haberdasher.pb.dart';
import 'package:client/protos/suit.pb.dart';
import 'package:http/http.dart';
import 'package:tart/tart.dart';

void main(List<String> arguments) async {
  // Creates a HaberdasherProtobufClient, one could also use HaberdashJSONClient instead
  // We can optionally pass in client hooks as well as a interceptor
  final client = HaberdasherProtobufClient("http://localhost:8080", "twirp",
      hooks: ClientHooks(
        onRequestPrepared: onClientRequestPrepared,
      ),
      interceptor: myInterceptor());

  // any context created with withHttpRequestHeaders will automatically
  // be added to the HttpClientRequest headers
  late Context ctx;
  try {
    ctx =
        withHttpRequestHeaders(Context(), {'Auth-Token': 'SuperSecretAPIKey'});
  } catch (e) {
    print('Could not add headers to context: $e');
    return;
  }

  try {
    final response =
        await client.makeHat(ctx, Size(inches: Random().nextInt(4) + 6));
    print("Hat made: ${response.inches}in ${response.color} ${response.name}");

    final response2 =
        await client.makeSuit(ctx, SuitSizeReq(size: SuitSize.LG));
    print("Suit made: ${response2.size} ${response2.color}");
  } catch (e) {
    print('Error while calling makeHat(): $e');
  }
}

/// onClientRequestPrepared is a client hook used to print out the method name of the RPC call
Context onClientRequestPrepared(Context ctx, Request req) {
  final methodNameVal = ctx.value(ContextKeys.methodName);
  print('RequestPrepared for $methodNameVal');
  return ctx;
}

/// myInterceptor is an example of how to use an interceptor to catch the context and request
/// before the RPC is made to the server. Depending on how many interceptors there are [next]
/// could represent another interceptor by using [chainInterceptor] or the actual RPC call
Interceptor myInterceptor(/* pass in any dependencies needed */) {
  return (Method next) {
    return (Context ctx, dynamic req) {
      switch (req.runtimeType) {
        case Size:
          print('This will be ran before the makeHat call');
          break;
        case SuitSizeReq:
          print('This will be ran before the makeSuit call');
      }
      final serviceName = ctx.value(ContextKeys.serviceName);
      final methodName = ctx.value(ContextKeys.methodName);
      final reqDetails = req.toString().replaceAll('\n', '');
      print('Service: $serviceName, Method: $methodName, Request: $reqDetails');

      // ALWAYS call the next method (interceptor or RPC call)
      return next(ctx, req);
    };
  };
}
