import 'package:tart/tart.dart';
import 'package:test/test.dart';

void main() {
  group("chainInterceptor()", () {
    test("empty list", () {
      final interceptor = chainInterceptor([]);
      interceptor((ctx, req) {
        return Future.value('return value');
      })(Context(), "mocked req")
          .then((value) => expect(value, equals('return value')));
    });

    test("single element", () {
      final key = "key";
      Method interceptor1(Method next) {
        return (ctx, req) {
          final newCtx = withValue(ctx, key, 1);
          return next(newCtx, req);
        };
      }

      final interceptor = chainInterceptor([interceptor1]);
      interceptor((ctx, req) {
        return Future.value(ctx.value(key));
      })(Context(), "mocked req")
          .then((value) => expect(value, equals(1)));
    });

    test("greater than 1 element", () {
      final key = "key";
      Method interceptor1(Method next) {
        return (ctx, req) {
          final newCtx = withValue(ctx, key, 1);
          return next(newCtx, req);
        };
      }

      Method interceptor2(Method next) {
        return (ctx, req) {
          final value = ctx.value(key);
          final newCtx = withValue(ctx, key, value + 1);
          return next(newCtx, req);
        };
      }

      final interceptor = chainInterceptor([interceptor1, interceptor2]);
      interceptor((ctx, req) {
        return Future.value(ctx.value(key));
      })(Context(), 'mocked req')
          .then((value) => expect(value, equals(2)));
    });
  });
}
