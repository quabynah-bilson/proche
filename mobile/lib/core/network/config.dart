import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/core/network/log.interceptor.dart';
import 'package:mobile/core/network/token.interceptor.dart';
import 'package:mobile/generated/protos/auth.pbgrpc.dart';
import 'package:mobile/generated/protos/event.pbgrpc.dart';
import 'package:mobile/generated/protos/giveaway.pbgrpc.dart';
import 'package:mobile/generated/protos/shared.pbgrpc.dart';
import 'package:mobile/generated/protos/task.pbgrpc.dart';
import 'package:mobile/generated/protos/trip.pbgrpc.dart';

/// module for grpc client configuration
@module
abstract class NetworkConfigModule {
  ClientInterceptor get _logInterceptor => LogGrpcInterceptor();

  ClientInterceptor get _tokenInterceptor => TokenGrpcInterceptor();

  ClientChannel _createChannel(int port, [String host = '<your-local-ip>']) =>
      ClientChannel(
        host,
        port: port,
        options:
            const ChannelOptions(credentials: ChannelCredentials.insecure()),
      );

  @injectable
  AuthServiceClient get authServiceClient =>
      AuthServiceClient(_createChannel(1800),
          interceptors: [_tokenInterceptor, _logInterceptor]);

  @injectable
  SharedServiceClient get sharedServiceClient =>
      SharedServiceClient(_createChannel(1900),
          interceptors: [_tokenInterceptor, _logInterceptor]);

  @injectable
  TaskServiceClient get taskServiceClient =>
      TaskServiceClient(_createChannel(2000),
          interceptors: [_tokenInterceptor, _logInterceptor]);

  @injectable
  EventServiceClient get eventServiceClient =>
      EventServiceClient(_createChannel(2000),
          interceptors: [_tokenInterceptor, _logInterceptor]);

  @injectable
  TripServiceClient get tripServiceClient =>
      TripServiceClient(_createChannel(2000),
          interceptors: [_tokenInterceptor, _logInterceptor]);

  @injectable
  GiveAwayServiceClient get savingsServiceClient =>
      GiveAwayServiceClient(_createChannel(2000),
          interceptors: [_tokenInterceptor, _logInterceptor]);
}
