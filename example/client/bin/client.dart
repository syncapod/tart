import 'dart:io';
import 'dart:math';

import 'package:client/protos/haberdasher.pbtwirp.dart';
import 'package:client/protos/haberdasher.pb.dart';
import 'package:client/protos/suit.pb.dart';
import 'package:tart/twirp.dart';

void main(List<String> arguments) async {
  // Creates a HaberdasherProtobufClient, one could also use HaberdashJSONClient instead
  // We can optionally pass in client hooks as well as a interceptor
  final client = HaberdasherProtobufClient("http://localhost:8080", "twirp",
      hooks: ClientHooks(
        onRequestPrepared: onClientRequestPrepared,
      ));

  // any context created with withHttpRequestHeaders will automatically
  // be added to the HttpClientRequest headers
  var ctxValue =
      withHttpRequestHeaders(Context(), {'Auth-Token': 'SuperSecretAPIKey'});
  if (ctxValue.hasError()) {
    print('Could not append headers to ctx: ' + ctxValue.getError());
    return;
  }
  final ctx = ctxValue.getValue();

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
void onClientRequestPrepared(Context ctx, HttpClientRequest req) {
  final methodNameVal = ctx.value(ContextKeys.methodName);
  if (methodNameVal.hasError()) {
    return; // we should never have an error for methodName
  }
  print('RequestPrepared for ${methodNameVal.getValue()}');
}
