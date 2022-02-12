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
    expect(false, equals(newCtxValue.hasError()));
    expect(newCtxValue.getValue(), equals(value));
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
      final methodNameValue = ctx.value(ContextKeys.methodName);
      expect(methodNameValue.hasError(), equals(false));
      expect(testMethodName, equals(methodNameValue.getValue()));
    });

    test('service name', () {
      final serviceNameValue = ctx.value(ContextKeys.serviceName);
      expect(serviceNameValue.hasError(), equals(false));
      expect(testServiceName, equals(serviceNameValue.getValue()));
    });

    test('package name', () {
      final packageNameValue = ctx.value(ContextKeys.packageName);
      expect(packageNameValue.hasError(), equals(false));
      expect(testPackageName, equals(packageNameValue.getValue()));
    });

    test('status code', () {
      final statusCodeValue = ctx.value(ContextKeys.statusCode);
      expect(statusCodeValue.hasError(), equals(false));
      expect(testStatusCode, equals(statusCodeValue.getValue()));
    });
  });

  group('withHttpRequestHeader', () {
    test('errors', () {
      var ctxValue = withHttpRequestHeaders(Context(), {'Allow': 'GET'});
      expect(ctxValue.hasError(), equals(true));

      ctxValue = withHttpRequestHeaders(
          Context(), {'Content-Type': 'application/json'});
      expect(ctxValue.hasError(), equals(true));

      ctxValue = withHttpRequestHeaders(Context(), {'Twirp-Version': '8.0.0'});
      expect(ctxValue.hasError(), equals(true));
    });

    test('empty context', () {
      final header = {'header-key': 'header-value'};
      final ctxValue = withHttpRequestHeaders(Context(), header);
      expect(ctxValue.hasError(), equals(false));
      final ctx = ctxValue.getValue();
      expect(ctx.value(ContextKeys.httpHeaders).getValue(), equals(header));
    });

    test('with other values', () {
      final initialHeader = {'initial-key': 'initial-value'};
      final initalCtx =
          withValue(Context(), ContextKeys.httpHeaders, initialHeader);

      final withHeader = {'with-key': 'with-value'};
      final newCtx = withHttpRequestHeaders(initalCtx, withHeader);

      final combinedHeader = {};
      combinedHeader.addAll(initialHeader);
      combinedHeader.addAll(withHeader);

      expect(combinedHeader,
          equals(newCtx.getValue().value(ContextKeys.httpHeaders).getValue()));
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
      expect(initialHeader,
          equals(newCtx.getValue().value(ContextKeys.httpHeaders).getValue()));
    });

    test('retrieveHttpRequestHeaders', () {
      final headers = {'header-key': 'header-value'};
      final ctxValue = withHttpRequestHeaders(Context(), headers);
      expect(ctxValue.hasError(), equals(false));
      final ctx = ctxValue.getValue();

      final headersFromCtx = retrieveHttpRequestHeaders(ctx);
      expect(headersFromCtx.hasError(), equals(false));
      expect(headersFromCtx.getValue(), equals(headers));
    });
  });
}
