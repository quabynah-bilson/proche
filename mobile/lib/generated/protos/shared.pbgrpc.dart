///
//  Generated code. Do not modify.
//  source: shared.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf_google/protobuf_google.dart' as $0;

import 'shared.pb.dart' as $1;

export 'shared.pb.dart';

class SharedServiceClient extends $grpc.Client {
  static final _$checkForUpdates =
      $grpc.ClientMethod<$0.StringValue, $1.AppVersion>(
          '/shared.SharedService/checkForUpdates',
          ($0.StringValue value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.AppVersion.fromBuffer(value));

  SharedServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.AppVersion> checkForUpdates($0.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$checkForUpdates, request, options: options);
  }
}

abstract class SharedServiceBase extends $grpc.Service {
  $core.String get $name => 'shared.SharedService';

  SharedServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.StringValue, $1.AppVersion>(
        'checkForUpdates',
        checkForUpdates_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.StringValue.fromBuffer(value),
        ($1.AppVersion value) => value.writeToBuffer()));
  }

  $async.Future<$1.AppVersion> checkForUpdates_Pre(
      $grpc.ServiceCall call, $async.Future<$0.StringValue> request) async {
    return checkForUpdates(call, await request);
  }

  $async.Future<$1.AppVersion> checkForUpdates(
      $grpc.ServiceCall call, $0.StringValue request);
}
