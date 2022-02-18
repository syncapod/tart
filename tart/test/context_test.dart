import 'package:tart/src/context.dart';
import 'package:test/test.dart';

void main() {
  test('Context withValue', () {
    final ctx = Context();
    final key = "testKey";
    final value = "testValue";
    final newCtx = withValue(ctx, key, value);
    expect(newCtx, isNot(equals(ctx)));

    final newCtxValue = newCtx.value(key);
    expect(newCtxValue, equals(value));
  });

  group('Context with twirp values', () {
    final testMethodName = 'testMethodName';
    final testServiceName = 'testServiceName';
    final testPackageName = 'testPackageName';
    final testStatusCode = 200;

    Context ctx = withMethodName(Context(), testMethodName);
    ctx = withServiceName(ctx, testServiceName);
    ctx = withPackageName(ctx, testPackageName);
    ctx = withStatusCode(ctx, testStatusCode);

    test('method name', () {
      final methodName = ctx.value(ContextKeys.methodName);
      expect(testMethodName, equals(methodName));
    });

    test('service name', () {
      final serviceName = ctx.value(ContextKeys.serviceName);
      expect(testServiceName, equals(serviceName));
    });

    test('package name', () {
      final packageName = ctx.value(ContextKeys.packageName);
      expect(testPackageName, equals(packageName));
    });

    test('status code', () {
      final statusCode = ctx.value(ContextKeys.statusCode);
      expect(testStatusCode, equals(statusCode));
    });
  });

  group('withHttpRequestHeader', () {
    test('errors', () {
      try {
        withHttpRequestHeaders(Context(), {'Allow': 'GET'});
      } catch (e) {
        expect(e.toString(), contains('cannot set allow'));
      }

      try {
        withHttpRequestHeaders(Context(), {'Content-Type': 'application/json'});
      } catch (e) {
        expect(e.toString(), contains('cannot set content-type'));
      }

      try {
        withHttpRequestHeaders(Context(), {'Twirp-Version': '8.1.0'});
      } catch (e) {
        expect(e.toString(), contains('cannot set twirp-version'));
      }
    });

    test('empty context', () {
      final header = {'header-key': 'header-value'};
      final ctx = withHttpRequestHeaders(Context(), header);
      expect(ctx.value(ContextKeys.httpHeaders), equals(header));
    });

    test('with other values', () {
      final initialHeader = {'initial-key': 'initial-value'};
      final initalCtx =
          withValue(Context(), ContextKeys.httpHeaders, initialHeader);

      final withHeader = {'with-key': 'with-value'};
      final ctx = withHttpRequestHeaders(initalCtx, withHeader);

      final combinedHeader = {};
      combinedHeader.addAll(initialHeader);
      combinedHeader.addAll(withHeader);

      expect(combinedHeader, equals(ctx.value(ContextKeys.httpHeaders)));
    });

    test('overwrite value', () {
      final initialHeader = {
        'initial-key': 'initial-value',
        'overwrite-me': 'will be changed'
      };
      final initalCtx =
          withValue(Context(), ContextKeys.httpHeaders, initialHeader);

      final overwriteHeader = {'overwrite-me': 'new value'};
      final newCtx = withHttpRequestHeaders(initalCtx, overwriteHeader);

      initialHeader['overwrite-me'] = 'new value';
      expect(initialHeader, equals(newCtx.value(ContextKeys.httpHeaders)));
    });

    test('retrieveHttpRequestHeaders', () {
      final headers = {'header-key': 'header-value'};
      final ctx = withHttpRequestHeaders(Context(), headers);

      final headersFromCtx = retrieveHttpRequestHeaders(ctx);
      expect(headersFromCtx, equals(headers));
    });
  });
}
