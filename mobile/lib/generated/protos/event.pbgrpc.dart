///
//  Generated code. Do not modify.
//  source: event.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'core_shared.pb.dart' as $3;
import 'package:protobuf_google/protobuf_google.dart' as $1;
import 'package:protobuf_google/protobuf_google.dart' as $2;
export 'event.pb.dart';

class EventServiceClient extends $grpc.Client {
  static final _$create_event =
      $grpc.ClientMethod<$3.CreateEventRequest, $3.ProcheEvent>(
          '/event.EventService/create_event',
          ($3.CreateEventRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.ProcheEvent.fromBuffer(value));
  static final _$get_event = $grpc.ClientMethod<$1.StringValue, $3.ProcheEvent>(
      '/event.EventService/get_event',
      ($1.StringValue value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.ProcheEvent.fromBuffer(value));
  static final _$get_event_by_user =
      $grpc.ClientMethod<$1.StringValue, $3.ProcheEventList>(
          '/event.EventService/get_event_by_user',
          ($1.StringValue value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $3.ProcheEventList.fromBuffer(value));
  static final _$get_events_by_location =
      $grpc.ClientMethod<$3.CommonAddress, $3.ProcheEventList>(
          '/event.EventService/get_events_by_location',
          ($3.CommonAddress value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $3.ProcheEventList.fromBuffer(value));
  static final _$list_events = $grpc.ClientMethod<$2.Empty, $3.ProcheEventList>(
      '/event.EventService/list_events',
      ($2.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.ProcheEventList.fromBuffer(value));
  static final _$update_event =
      $grpc.ClientMethod<$3.ProcheEvent, $3.ProcheEvent>(
          '/event.EventService/update_event',
          ($3.ProcheEvent value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.ProcheEvent.fromBuffer(value));
  static final _$delete_event = $grpc.ClientMethod<$1.StringValue, $2.Empty>(
      '/event.EventService/delete_event',
      ($1.StringValue value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.Empty.fromBuffer(value));
  static final _$get_candidates_for_event =
      $grpc.ClientMethod<$1.StringValue, $3.EventCandidateList>(
          '/event.EventService/get_candidates_for_event',
          ($1.StringValue value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $3.EventCandidateList.fromBuffer(value));

  EventServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$3.ProcheEvent> create_event(
      $3.CreateEventRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$create_event, request, options: options);
  }

  $grpc.ResponseStream<$3.ProcheEvent> get_event($1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$get_event, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$3.ProcheEventList> get_event_by_user(
      $1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$get_event_by_user, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$3.ProcheEventList> get_events_by_location(
      $3.CommonAddress request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$get_events_by_location, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$3.ProcheEventList> list_events($2.Empty request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$list_events, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$3.ProcheEvent> update_event($3.ProcheEvent request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$update_event, request, options: options);
  }

  $grpc.ResponseFuture<$2.Empty> delete_event($1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$delete_event, request, options: options);
  }

  $grpc.ResponseStream<$3.EventCandidateList> get_candidates_for_event(
      $1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$get_candidates_for_event, $async.Stream.fromIterable([request]),
        options: options);
  }
}

abstract class EventServiceBase extends $grpc.Service {
  $core.String get $name => 'event.EventService';

  EventServiceBase() {
    $addMethod($grpc.ServiceMethod<$3.CreateEventRequest, $3.ProcheEvent>(
        'create_event',
        create_event_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $3.CreateEventRequest.fromBuffer(value),
        ($3.ProcheEvent value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $3.ProcheEvent>(
        'get_event',
        get_event_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($3.ProcheEvent value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $3.ProcheEventList>(
        'get_event_by_user',
        get_event_by_user_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($3.ProcheEventList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.CommonAddress, $3.ProcheEventList>(
        'get_events_by_location',
        get_events_by_location_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $3.CommonAddress.fromBuffer(value),
        ($3.ProcheEventList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.Empty, $3.ProcheEventList>(
        'list_events',
        list_events_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $2.Empty.fromBuffer(value),
        ($3.ProcheEventList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.ProcheEvent, $3.ProcheEvent>(
        'update_event',
        update_event_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.ProcheEvent.fromBuffer(value),
        ($3.ProcheEvent value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $2.Empty>(
        'delete_event',
        delete_event_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($2.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $3.EventCandidateList>(
        'get_candidates_for_event',
        get_candidates_for_event_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($3.EventCandidateList value) => value.writeToBuffer()));
  }

  $async.Future<$3.ProcheEvent> create_event_Pre($grpc.ServiceCall call,
      $async.Future<$3.CreateEventRequest> request) async {
    return create_event(call, await request);
  }

  $async.Stream<$3.ProcheEvent> get_event_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async* {
    yield* get_event(call, await request);
  }

  $async.Stream<$3.ProcheEventList> get_event_by_user_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async* {
    yield* get_event_by_user(call, await request);
  }

  $async.Stream<$3.ProcheEventList> get_events_by_location_Pre(
      $grpc.ServiceCall call, $async.Future<$3.CommonAddress> request) async* {
    yield* get_events_by_location(call, await request);
  }

  $async.Stream<$3.ProcheEventList> list_events_Pre(
      $grpc.ServiceCall call, $async.Future<$2.Empty> request) async* {
    yield* list_events(call, await request);
  }

  $async.Future<$3.ProcheEvent> update_event_Pre(
      $grpc.ServiceCall call, $async.Future<$3.ProcheEvent> request) async {
    return update_event(call, await request);
  }

  $async.Future<$2.Empty> delete_event_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async {
    return delete_event(call, await request);
  }

  $async.Stream<$3.EventCandidateList> get_candidates_for_event_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async* {
    yield* get_candidates_for_event(call, await request);
  }

  $async.Future<$3.ProcheEvent> create_event(
      $grpc.ServiceCall call, $3.CreateEventRequest request);
  $async.Stream<$3.ProcheEvent> get_event(
      $grpc.ServiceCall call, $1.StringValue request);
  $async.Stream<$3.ProcheEventList> get_event_by_user(
      $grpc.ServiceCall call, $1.StringValue request);
  $async.Stream<$3.ProcheEventList> get_events_by_location(
      $grpc.ServiceCall call, $3.CommonAddress request);
  $async.Stream<$3.ProcheEventList> list_events(
      $grpc.ServiceCall call, $2.Empty request);
  $async.Future<$3.ProcheEvent> update_event(
      $grpc.ServiceCall call, $3.ProcheEvent request);
  $async.Future<$2.Empty> delete_event(
      $grpc.ServiceCall call, $1.StringValue request);
  $async.Stream<$3.EventCandidateList> get_candidates_for_event(
      $grpc.ServiceCall call, $1.StringValue request);
}
