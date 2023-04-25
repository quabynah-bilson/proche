///
//  Generated code. Do not modify.
//  source: core_shared.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf_google/protobuf_google.dart' as $2;
import 'core_shared.pb.dart' as $3;
import 'package:protobuf_google/protobuf_google.dart' as $1;
export 'core_shared.pb.dart';

class CoreSharedServiceClient extends $grpc.Client {
  static final _$get_posts_for_current_user =
      $grpc.ClientMethod<$2.Empty, $3.GetPostsForUserResponse>(
          '/core.CoreSharedService/get_posts_for_current_user',
          ($2.Empty value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $3.GetPostsForUserResponse.fromBuffer(value));
  static final _$get_posts_for_user =
      $grpc.ClientMethod<$1.StringValue, $3.GetPostsForUserResponse>(
          '/core.CoreSharedService/get_posts_for_user',
          ($1.StringValue value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $3.GetPostsForUserResponse.fromBuffer(value));

  CoreSharedServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$3.GetPostsForUserResponse> get_posts_for_current_user(
      $2.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$get_posts_for_current_user, request,
        options: options);
  }

  $grpc.ResponseFuture<$3.GetPostsForUserResponse> get_posts_for_user(
      $1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$get_posts_for_user, request, options: options);
  }
}

abstract class CoreSharedServiceBase extends $grpc.Service {
  $core.String get $name => 'core.CoreSharedService';

  CoreSharedServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.Empty, $3.GetPostsForUserResponse>(
        'get_posts_for_current_user',
        get_posts_for_current_user_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.Empty.fromBuffer(value),
        ($3.GetPostsForUserResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $3.GetPostsForUserResponse>(
        'get_posts_for_user',
        get_posts_for_user_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($3.GetPostsForUserResponse value) => value.writeToBuffer()));
  }

  $async.Future<$3.GetPostsForUserResponse> get_posts_for_current_user_Pre(
      $grpc.ServiceCall call, $async.Future<$2.Empty> request) async {
    return get_posts_for_current_user(call, await request);
  }

  $async.Future<$3.GetPostsForUserResponse> get_posts_for_user_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async {
    return get_posts_for_user(call, await request);
  }

  $async.Future<$3.GetPostsForUserResponse> get_posts_for_current_user(
      $grpc.ServiceCall call, $2.Empty request);
  $async.Future<$3.GetPostsForUserResponse> get_posts_for_user(
      $grpc.ServiceCall call, $1.StringValue request);
}
