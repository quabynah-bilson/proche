import 'dart:async';

import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/features/shared/domain/repositories/local.storage.dart';
import 'package:shared_utils/shared_utils.dart';

@injectable
class TokenGrpcInterceptor implements ClientInterceptor {
  final BaseLocalStorageRepository _localStorageRepository;
  String? _accessToken, _locale;

  TokenGrpcInterceptor._(this._localStorageRepository);

  @factoryMethod
  static TokenGrpcInterceptor create(
    BaseLocalStorageRepository localStorageRepository,
  ) =>
      TokenGrpcInterceptor._(localStorageRepository).._init();

  @override
  ResponseStream<R> interceptStreaming<Q, R>(
      ClientMethod<Q, R> method,
      Stream<Q> requests,
      CallOptions options,
      ClientStreamingInvoker<Q, R> invoker) {
    var newOpts = options.mergedWith(
      CallOptions(
        metadata: {
          'Authorization': 'Bearer $_accessToken',
          'x-language-id': '$_locale',
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
          'Authorization': 'Bearer $_accessToken',
          'x-language-id': '$_locale',
        },
      ),
    );
    logger.d(
        'grpc unary method: ${method.path} => metadata: ${newOpts.metadata} => payload : $self');
    return invoker(method, self, newOpts)
      ..then((data) => logger.d('grpc unary response => $data'));
  }

  // ignore: avoid_void_async
  void _init() async {
    _locale = await _localStorageRepository.defaultLocale;
    _accessToken = (await _localStorageRepository.accessToken) ?? '';
  }
}
