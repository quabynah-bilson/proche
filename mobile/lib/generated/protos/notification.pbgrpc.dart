///
//  Generated code. Do not modify.
//  source: notification.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'notification.pb.dart' as $0;
import 'package:protobuf_google/protobuf_google.dart' as $1;
import 'package:protobuf_google/protobuf_google.dart' as $2;
export 'notification.pb.dart';

class NotificationServiceClient extends $grpc.Client {
  static final _$register_device =
      $grpc.ClientMethod<$0.RegisterDeviceRequest, $1.StringValue>(
          '/notification.NotificationService/register_device',
          ($0.RegisterDeviceRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value));
  static final _$unregister_device =
      $grpc.ClientMethod<$1.StringValue, $2.Empty>(
          '/notification.NotificationService/unregister_device',
          ($1.StringValue value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.Empty.fromBuffer(value));
  static final _$send_notification =
      $grpc.ClientMethod<$0.NotificationRequest, $2.Empty>(
          '/notification.NotificationService/send_notification',
          ($0.NotificationRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.Empty.fromBuffer(value));
  static final _$get_notifications =
      $grpc.ClientMethod<$1.StringValue, $0.NotificationResponse>(
          '/notification.NotificationService/get_notifications',
          ($1.StringValue value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.NotificationResponse.fromBuffer(value));

  NotificationServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.StringValue> register_device(
      $0.RegisterDeviceRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$register_device, request, options: options);
  }

  $grpc.ResponseFuture<$2.Empty> unregister_device($1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$unregister_device, request, options: options);
  }

  $grpc.ResponseFuture<$2.Empty> send_notification(
      $0.NotificationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$send_notification, request, options: options);
  }

  $grpc.ResponseStream<$0.NotificationResponse> get_notifications(
      $1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$get_notifications, $async.Stream.fromIterable([request]),
        options: options);
  }
}

abstract class NotificationServiceBase extends $grpc.Service {
  $core.String get $name => 'notification.NotificationService';

  NotificationServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.RegisterDeviceRequest, $1.StringValue>(
        'register_device',
        register_device_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.RegisterDeviceRequest.fromBuffer(value),
        ($1.StringValue value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $2.Empty>(
        'unregister_device',
        unregister_device_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($2.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.NotificationRequest, $2.Empty>(
        'send_notification',
        send_notification_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.NotificationRequest.fromBuffer(value),
        ($2.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $0.NotificationResponse>(
        'get_notifications',
        get_notifications_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($0.NotificationResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.StringValue> register_device_Pre($grpc.ServiceCall call,
      $async.Future<$0.RegisterDeviceRequest> request) async {
    return register_device(call, await request);
  }

  $async.Future<$2.Empty> unregister_device_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async {
    return unregister_device(call, await request);
  }

  $async.Future<$2.Empty> send_notification_Pre($grpc.ServiceCall call,
      $async.Future<$0.NotificationRequest> request) async {
    return send_notification(call, await request);
  }

  $async.Stream<$0.NotificationResponse> get_notifications_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async* {
    yield* get_notifications(call, await request);
  }

  $async.Future<$1.StringValue> register_device(
      $grpc.ServiceCall call, $0.RegisterDeviceRequest request);
  $async.Future<$2.Empty> unregister_device(
      $grpc.ServiceCall call, $1.StringValue request);
  $async.Future<$2.Empty> send_notification(
      $grpc.ServiceCall call, $0.NotificationRequest request);
  $async.Stream<$0.NotificationResponse> get_notifications(
      $grpc.ServiceCall call, $1.StringValue request);
}
