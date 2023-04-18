import 'dart:async';

import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/core/utils/session.dart';
import 'package:shared_utils/shared_utils.dart';

@injectable
class TokenGrpcInterceptor implements ClientInterceptor {
  @override
  ResponseStream<R> interceptStreaming<Q, R>(
      ClientMethod<Q, R> method,
      Stream<Q> requests,
      CallOptions options,
      ClientStreamingInvoker<Q, R> invoker) {
    var newOpts = options.mergedWith(
      CallOptions(
        metadata: {
          'Authorization': 'Bearer ${UserSession.kAccessToken}',
          'x-language-id': '${UserSession.kLocale}',
        },
      ),
    );

    logger.d(
        'grpc streaming method: ${method.path} => metadata: ${newOpts.metadata}');
    // do nothing for now
    return invoker(method, requests, newOpts);
  }

  @override
  ResponseFuture<R> interceptUnary<Q, R>(ClientMethod<Q, R> method, Q self,
      CallOptions options, ClientUnaryInvoker<Q, R> invoker) {
    var newOpts = options.mergedWith(
      CallOptions(
        metadata: {
          'Authorization': 'Bearer ${UserSession.kAccessToken}',
          'x-language-id': '${UserSession.kLocale}',
        },
      ),
    );
    logger.d(
        'grpc unary method: ${method.path} => metadata: ${newOpts.metadata} => payload : $self');
    return invoker(method, self, newOpts)
      ..then((data) => logger.d('grpc unary response => $data'));
  }
}
