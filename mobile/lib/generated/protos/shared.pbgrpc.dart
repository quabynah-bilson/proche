///
//  Generated code. Do not modify.
//  source: shared.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf_google/protobuf_google.dart' as $2;
import 'shared.pb.dart' as $3;
export 'shared.pb.dart';

class SharedServiceClient extends $grpc.Client {
  static final _$get_api_latest_version_for_client =
      $grpc.ClientMethod<$2.StringValue, $3.ApiVersionResponse>(
          '/shared.SharedService/get_api_latest_version_for_client',
          ($2.StringValue value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $3.ApiVersionResponse.fromBuffer(value));
  static final _$get_app_service_credentials =
      $grpc.ClientMethod<$3.AppService, $3.AppServiceResponse>(
          '/shared.SharedService/get_app_service_credentials',
          ($3.AppService value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $3.AppServiceResponse.fromBuffer(value));

  SharedServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$3.ApiVersionResponse> get_api_latest_version_for_client(
      $2.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$get_api_latest_version_for_client, request,
        options: options);
  }

  $grpc.ResponseFuture<$3.AppServiceResponse> get_app_service_credentials(
      $3.AppService request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$get_app_service_credentials, request,
        options: options);
  }
}

abstract class SharedServiceBase extends $grpc.Service {
  $core.String get $name => 'shared.SharedService';

  SharedServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.StringValue, $3.ApiVersionResponse>(
        'get_api_latest_version_for_client',
        get_api_latest_version_for_client_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.StringValue.fromBuffer(value),
        ($3.ApiVersionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.AppService, $3.AppServiceResponse>(
        'get_app_service_credentials',
        get_app_service_credentials_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.AppService.fromBuffer(value),
        ($3.AppServiceResponse value) => value.writeToBuffer()));
  }

  $async.Future<$3.ApiVersionResponse> get_api_latest_version_for_client_Pre(
      $grpc.ServiceCall call, $async.Future<$2.StringValue> request) async {
    return get_api_latest_version_for_client(call, await request);
  }

  $async.Future<$3.AppServiceResponse> get_app_service_credentials_Pre(
      $grpc.ServiceCall call, $async.Future<$3.AppService> request) async {
    return get_app_service_credentials(call, await request);
  }

  $async.Future<$3.ApiVersionResponse> get_api_latest_version_for_client(
      $grpc.ServiceCall call, $2.StringValue request);
  $async.Future<$3.AppServiceResponse> get_app_service_credentials(
      $grpc.ServiceCall call, $3.AppService request);
}
