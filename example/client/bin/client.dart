import 'dart:math';

import 'package:client/protos/haberdasher.pbtwirp.dart';
import 'package:client/protos/haberdasher.pb.dart';
import 'package:client/protos/suit.pb.dart';
import 'package:tart/twirp.dart';

void main(List<String> arguments) async {
  final client = HaberdasherJSONClient("http://localhost:8080/", "twirp/");
  try {
    final response =
        await client.makeHat(Context(), Size(inches: Random().nextInt(4) + 6));
    print("Hat made: ${response.inches}in ${response.color} ${response.name}");

    final response2 =
        await client.makeSuit(Context(), SuitSizeReq(size: SuitSize.LG));
    print("Suit made: ${response2.size} ${response2.color}");
  } catch (e) {
    print('Error while calling makeHat(): $e');
  }
}
