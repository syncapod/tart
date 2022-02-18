/// This example is as simple as can be to make RPC calls and handle errors
/// Please go to https://github.com/syncapod/tart for a more thorough example

import 'dart:math';

import 'package:client/protos/haberdasher.pbtwirp.dart';
import 'package:client/protos/haberdasher.pb.dart';
import 'package:client/protos/suit.pb.dart';
import 'package:tart/tart.dart';

void main(List<String> arguments) async {
  try {
    final client = HaberdasherProtobufClient("http://localhost:8080", "twirp");
    final emptyCtx = Context();

    final hat =
        await client.makeHat(emptyCtx, Size(inches: Random().nextInt(4) + 6));
    print("Hat made: ${hat.inches}in ${hat.color} ${hat.name}");

    final suit =
        await client.makeSuit(emptyCtx, SuitSizeReq(size: SuitSize.LG));
    print('Suit made: ${suit.size} ${suit.color}');
  } on TwirpError catch (e) {
    final method = e.getContext.value(ContextKeys.methodName);
    print('Error making $method rpc call: ${e.getCode}, ${e.getMsg}');
  } catch (e, stackTrace) {
    print('Unknown exception occurred $e');
    print('StackTrace: $stackTrace');
  }
}
