import 'package:flutter_dotenv/flutter_dotenv.dart';
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

  ClientChannel _createChannel(int port, [String? host = '<your-local-ip>']) =>
      ClientChannel(
        host ?? '0.0.0.0',
        port: port,
        options:
            const ChannelOptions(credentials: ChannelCredentials.insecure()),
      );

  @injectable
  AuthServiceClient get authServiceClient => AuthServiceClient(
      _createChannel(int.parse(dotenv.env['AUTH_SERVER_PORT'].toString()),
          dotenv.env['AUTH_SERVER_URL']),
      interceptors: [_tokenInterceptor, _logInterceptor]);

  @injectable
  SharedServiceClient get sharedServiceClient =>
      SharedServiceClient(_createChannel(int.parse(dotenv.env['SHARED_SERVER_URL'].toString()),
          dotenv.env['SHARED_SERVER_PORT']),
          interceptors: [_tokenInterceptor, _logInterceptor]);

  @injectable
  TaskServiceClient get taskServiceClient =>
      TaskServiceClient(_createChannel(int.parse(dotenv.env['CORE_SERVER_PORT'].toString()),
          dotenv.env['CORE_SERVER_URL']),
          interceptors: [_tokenInterceptor, _logInterceptor]);

  @injectable
  EventServiceClient get eventServiceClient =>
      EventServiceClient(_createChannel(int.parse(dotenv.env['CORE_SERVER_PORT'].toString()),
          dotenv.env['CORE_SERVER_URL']),
          interceptors: [_tokenInterceptor, _logInterceptor]);

  @injectable
  TripServiceClient get tripServiceClient =>
      TripServiceClient(_createChannel(int.parse(dotenv.env['CORE_SERVER_PORT'].toString()),
          dotenv.env['CORE_SERVER_URL']),
          interceptors: [_tokenInterceptor, _logInterceptor]);

  @injectable
  GiveAwayServiceClient get giveAwayServiceClient =>
      GiveAwayServiceClient(_createChannel(int.parse(dotenv.env['CORE_SERVER_PORT'].toString()),
          dotenv.env['CORE_SERVER_URL']),
          interceptors: [_tokenInterceptor, _logInterceptor]);
}
