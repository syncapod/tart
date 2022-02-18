import 'package:test/test.dart';
import 'package:tart/tart.dart';

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
      final twirpError = TwirpError(ErrorCode.internal, msg, Context());
      expect(twirpError.getMsg, equals(msg));
      expect(twirpError.getCode, equals(ErrorCode.internal));
    });

    test('fromJson()', () {
      final errorFromJson = TwirpError.fromJson(connectionErrorJson, Context());
      expect(errorFromJson.getCode.shortString, equals(jsonCode));
      expect(errorFromJson.getMsg, equals(jsonMsg));
      expect(errorFromJson.getMetaValue(jsonMetaKey),
          equals(jsonMeta[jsonMetaKey]));
    });

    test('toJson()', () {
      final msg = "database connection failed";
      final twirpError = TwirpError(ErrorCode.internal, msg, Context());
      final json = twirpError.toJson();
      expect(json['code'], ErrorCode.internal.shortString);
      expect(json['msg'], equals(msg));
    });

    test('fromConnectionError', () {
      final msg = 'http connection failure';
      final err = TwirpError.fromConnectionError(msg, Context());
      expect(err.getCode, ErrorCode.internal);
      expect(err.getMsg, equals(msg));
    });

    test('withMeta & getMetaValue', () {
      final err = TwirpError(ErrorCode.not_found, "not found", Context());
      final key1 = "key1";
      final value1 = "value1";
      final err1 = err.withMeta(key1, value1);
      expect(err1.getMetaValue(key1), equals(value1));
      final key2 = "key2";
      final value2 = "value2";
      final err2 = err1.withMeta(key2, value2);
      expect(err2.getMetaValue(key1), equals(value1));
      expect(err2.getMetaValue(key2), equals(value2));
      expect(err2.getCode, ErrorCode.not_found);
      expect(err2.getMsg, equals("not found"));
    });
  });
}
