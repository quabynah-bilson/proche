///
//  Generated code. Do not modify.
//  source: event.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'event.pb.dart' as $5;
import 'package:protobuf_google/protobuf_google.dart' as $1;
import 'core_shared.pb.dart' as $2;
import 'package:protobuf_google/protobuf_google.dart' as $3;
export 'event.pb.dart';

class EventServiceClient extends $grpc.Client {
  static final _$create_event =
      $grpc.ClientMethod<$5.CreateEventRequest, $5.ProcheEvent>(
          '/event.EventService/create_event',
          ($5.CreateEventRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $5.ProcheEvent.fromBuffer(value));
  static final _$get_event = $grpc.ClientMethod<$1.StringValue, $5.ProcheEvent>(
      '/event.EventService/get_event',
      ($1.StringValue value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $5.ProcheEvent.fromBuffer(value));
  static final _$get_event_by_user =
      $grpc.ClientMethod<$1.StringValue, $5.ProcheEventList>(
          '/event.EventService/get_event_by_user',
          ($1.StringValue value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $5.ProcheEventList.fromBuffer(value));
  static final _$get_events_by_location =
      $grpc.ClientMethod<$2.CommonAddress, $5.ProcheEventList>(
          '/event.EventService/get_events_by_location',
          ($2.CommonAddress value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $5.ProcheEventList.fromBuffer(value));
  static final _$list_events = $grpc.ClientMethod<$3.Empty, $5.ProcheEventList>(
      '/event.EventService/list_events',
      ($3.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $5.ProcheEventList.fromBuffer(value));
  static final _$update_event =
      $grpc.ClientMethod<$5.ProcheEvent, $5.ProcheEvent>(
          '/event.EventService/update_event',
          ($5.ProcheEvent value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $5.ProcheEvent.fromBuffer(value));
  static final _$delete_event = $grpc.ClientMethod<$1.StringValue, $3.Empty>(
      '/event.EventService/delete_event',
      ($1.StringValue value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.Empty.fromBuffer(value));

  EventServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$5.ProcheEvent> create_event(
      $5.CreateEventRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$create_event, request, options: options);
  }

  $grpc.ResponseStream<$5.ProcheEvent> get_event($1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$get_event, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$5.ProcheEventList> get_event_by_user(
      $1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$get_event_by_user, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$5.ProcheEventList> get_events_by_location(
      $2.CommonAddress request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$get_events_by_location, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$5.ProcheEventList> list_events($3.Empty request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$list_events, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$5.ProcheEvent> update_event($5.ProcheEvent request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$update_event, request, options: options);
  }

  $grpc.ResponseFuture<$3.Empty> delete_event($1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$delete_event, request, options: options);
  }
}

abstract class EventServiceBase extends $grpc.Service {
  $core.String get $name => 'event.EventService';

  EventServiceBase() {
    $addMethod($grpc.ServiceMethod<$5.CreateEventRequest, $5.ProcheEvent>(
        'create_event',
        create_event_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $5.CreateEventRequest.fromBuffer(value),
        ($5.ProcheEvent value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $5.ProcheEvent>(
        'get_event',
        get_event_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($5.ProcheEvent value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $5.ProcheEventList>(
        'get_event_by_user',
        get_event_by_user_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($5.ProcheEventList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.CommonAddress, $5.ProcheEventList>(
        'get_events_by_location',
        get_events_by_location_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $2.CommonAddress.fromBuffer(value),
        ($5.ProcheEventList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.Empty, $5.ProcheEventList>(
        'list_events',
        list_events_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $3.Empty.fromBuffer(value),
        ($5.ProcheEventList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.ProcheEvent, $5.ProcheEvent>(
        'update_event',
        update_event_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.ProcheEvent.fromBuffer(value),
        ($5.ProcheEvent value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $3.Empty>(
        'delete_event',
        delete_event_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($3.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$5.ProcheEvent> create_event_Pre($grpc.ServiceCall call,
      $async.Future<$5.CreateEventRequest> request) async {
    return create_event(call, await request);
  }

  $async.Stream<$5.ProcheEvent> get_event_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async* {
    yield* get_event(call, await request);
  }

  $async.Stream<$5.ProcheEventList> get_event_by_user_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async* {
    yield* get_event_by_user(call, await request);
  }

  $async.Stream<$5.ProcheEventList> get_events_by_location_Pre(
      $grpc.ServiceCall call, $async.Future<$2.CommonAddress> request) async* {
    yield* get_events_by_location(call, await request);
  }

  $async.Stream<$5.ProcheEventList> list_events_Pre(
      $grpc.ServiceCall call, $async.Future<$3.Empty> request) async* {
    yield* list_events(call, await request);
  }

  $async.Future<$5.ProcheEvent> update_event_Pre(
      $grpc.ServiceCall call, $async.Future<$5.ProcheEvent> request) async {
    return update_event(call, await request);
  }

  $async.Future<$3.Empty> delete_event_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async {
    return delete_event(call, await request);
  }

  $async.Future<$5.ProcheEvent> create_event(
      $grpc.ServiceCall call, $5.CreateEventRequest request);
  $async.Stream<$5.ProcheEvent> get_event(
      $grpc.ServiceCall call, $1.StringValue request);
  $async.Stream<$5.ProcheEventList> get_event_by_user(
      $grpc.ServiceCall call, $1.StringValue request);
  $async.Stream<$5.ProcheEventList> get_events_by_location(
      $grpc.ServiceCall call, $2.CommonAddress request);
  $async.Stream<$5.ProcheEventList> list_events(
      $grpc.ServiceCall call, $3.Empty request);
  $async.Future<$5.ProcheEvent> update_event(
      $grpc.ServiceCall call, $5.ProcheEvent request);
  $async.Future<$3.Empty> delete_event(
      $grpc.ServiceCall call, $1.StringValue request);
}
