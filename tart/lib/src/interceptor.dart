import 'context.dart';

/// Interceptor is a form of middleware for Twirp requests, that can be installed on both
/// clients and servers. To intercept RPC calls in the client, use the option
/// `twirp.WithClientInterceptors` on the client constructor. To intercept RPC calls in the server,
/// use the option `twirp.WithServerInterceptors` on the server constructor.
///
/// Just like http middleware, interceptors can mutate requests and responses.
/// This can enable some powerful integrations, but it should be used with much care
/// because it may result in code that is very hard to debug.
///
///  TODO: update this example to a dart example
/// Example of an interceptor that logs every request and response:
///
///   func LogInterceptor(l *log.Logger) twirp.Interceptor {
///     return func(next twirp.Method) twirp.Method {
///       return func(ctx context.Context, req interface{}) (interface{}, error) {
///         l.Printf("Service: %s, Method: %s, Request: %v",
///             twirp.ServiceName(ctx), twirp.MethodName(ctx), req)
///         resp, err := next(ctx, req)
///         l.Printf("Response: %v, Error: %v", resp)
///         return resp, err
///       }
///     }
///   }
///
typedef Interceptor = Method Function(Method);

// Method is a generic representation of a Twirp-generated RPC method.
// It is used to define Interceptors.
typedef Method<Q, R> = R Function(Context, R);

/// ChainInterceptors chains multiple Interceptors into a single Interceptor.
/// The first interceptor wraps the second one, and so on.
/// Returns an empty bypass Interceptor if list is empty
Interceptor chainInterceptor(List<Interceptor> interceptors) {
  switch (interceptors.length) {
    case 0:
      return (Method next) {
        return (Context ctx, dynamic a) {
          return next(ctx, a);
        };
      };

    case 1:
      return interceptors[0];
    default:
      final first = interceptors[0];
      return (Method next) {
        for (int i = interceptors.length - 1; i > 0; i--) {
          next = interceptors[i](next);
        }
        return first(next);
      };
  }
}
