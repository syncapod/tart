import 'package:tart/twirp.dart';
import 'package:test/test.dart';

void main() {
  group("chainInterceptor()", () {
    test("empty list", () {
      final interceptor = chainInterceptor([]);
      expect(
          "expected return",
          equals(interceptor((ctx, req) {
            return "expected return";
          })(Context(), "mocked req")));
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
      expect(
          1,
          equals(interceptor((ctx, req) {
            return ctx.value(key).getValue();
          })(Context(), "mocked req")));
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
          expect(value.hasError(), equals(false));
          final newCtx = withValue(ctx, key, value.getValue() + 1);
          return next(newCtx, req);
        };
      }

      final interceptor = chainInterceptor([interceptor1, interceptor2]);
      expect(
          2,
          equals(interceptor((ctx, req) {
            return ctx.value(key).getValue();
          })(Context(), "mocked req")));
    });
  });
}
