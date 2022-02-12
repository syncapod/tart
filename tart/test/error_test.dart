import 'package:test/test.dart';
import 'package:tart/src/error.dart' as $terr;

void main() {
  const jsonCode = 'internal';
  const jsonMsg = 'internal error message';
  const jsonMetaKey = 'anything';
  const jsonMeta = {jsonMetaKey: 'metaAnythingValue'};
  const connectionErrorJson = {
    'code': jsonCode,
    'msg': jsonMsg,
    'meta': jsonMeta,
  };
  group('Twirp Error Test:', () {
    test('basic error intantiation', () {
      final msg = "database connection failed";
      final twirpError = $terr.Error($terr.ErrorCode.internal, msg);
      expect(twirpError.getMsg, equals(msg));
      expect(twirpError.getCode, equals($terr.ErrorCode.internal));
    });

    test('fromJson()', () {
      final errorFromJson = $terr.Error.fromJson(connectionErrorJson);
      expect(errorFromJson.code.shortString, equals(jsonCode));
      expect(errorFromJson.msg, equals(jsonMsg));
      expect(errorFromJson.getMetaValue(jsonMetaKey),
          equals(jsonMeta[jsonMetaKey]));
    });

    test('toJson()', () {
      final msg = "database connection failed";
      final twirpError = $terr.Error($terr.ErrorCode.internal, msg);
      final json = twirpError.toJson();
      expect(json['code'], $terr.ErrorCode.internal.shortString);
      expect(json['msg'], equals(msg));
    });

    test('fromConnectionError', () {
      final msg = 'http connection failure';
      final err = $terr.Error.fromConnectionError(msg);
      expect(err.getCode, $terr.ErrorCode.internal);
      expect(err.getMsg, equals(msg));
    });

    test('withMeta & getMetaValue', () {
      final err = $terr.Error($terr.ErrorCode.not_found, "not found");
      final key1 = "key1";
      final value1 = "value1";
      final err1 = err.withMeta(key1, value1);
      expect(err1.getMetaValue(key1), equals(value1));
      final key2 = "key2";
      final value2 = "value2";
      final err2 = err1.withMeta(key2, value2);
      expect(err2.getMetaValue(key1), equals(value1));
      expect(err2.getMetaValue(key2), equals(value2));
      expect(err2.getCode, $terr.ErrorCode.not_found);
      expect(err2.getMsg, equals("not found"));
    });
  });
}
