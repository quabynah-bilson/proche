///
//  Generated code. Do not modify.
//  source: trip.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'trip.pb.dart' as $6;
import 'package:protobuf_google/protobuf_google.dart' as $1;
import 'package:protobuf_google/protobuf_google.dart' as $3;
export 'trip.pb.dart';

class TripServiceClient extends $grpc.Client {
  static final _$book_trip =
      $grpc.ClientMethod<$6.BookTripRequest, $1.StringValue>(
          '/trip.TripService/book_trip',
          ($6.BookTripRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value));
  static final _$get_trip = $grpc.ClientMethod<$1.StringValue, $6.Trip>(
      '/trip.TripService/get_trip',
      ($1.StringValue value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $6.Trip.fromBuffer(value));
  static final _$get_trips = $grpc.ClientMethod<$1.StringValue, $6.TripList>(
      '/trip.TripService/get_trips',
      ($1.StringValue value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $6.TripList.fromBuffer(value));
  static final _$delete_trip = $grpc.ClientMethod<$1.StringValue, $3.Empty>(
      '/trip.TripService/delete_trip',
      ($1.StringValue value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.Empty.fromBuffer(value));
  static final _$cancel_trip_event =
      $grpc.ClientMethod<$1.StringValue, $3.Empty>(
          '/trip.TripService/cancel_trip_event',
          ($1.StringValue value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.Empty.fromBuffer(value));
  static final _$start_trip_event =
      $grpc.ClientMethod<$1.StringValue, $3.Empty>(
          '/trip.TripService/start_trip_event',
          ($1.StringValue value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.Empty.fromBuffer(value));
  static final _$complete_trip_event =
      $grpc.ClientMethod<$1.StringValue, $3.Empty>(
          '/trip.TripService/complete_trip_event',
          ($1.StringValue value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.Empty.fromBuffer(value));
  static final _$get_trip_events =
      $grpc.ClientMethod<$1.StringValue, $6.TripEventList>(
          '/trip.TripService/get_trip_events',
          ($1.StringValue value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $6.TripEventList.fromBuffer(value));
  static final _$get_trip_event =
      $grpc.ClientMethod<$1.StringValue, $6.TripEvent>(
          '/trip.TripService/get_trip_event',
          ($1.StringValue value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $6.TripEvent.fromBuffer(value));

  TripServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.StringValue> book_trip($6.BookTripRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$book_trip, request, options: options);
  }

  $grpc.ResponseFuture<$6.Trip> get_trip($1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$get_trip, request, options: options);
  }

  $grpc.ResponseStream<$6.TripList> get_trips($1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$get_trips, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$3.Empty> delete_trip($1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$delete_trip, request, options: options);
  }

  $grpc.ResponseFuture<$3.Empty> cancel_trip_event($1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$cancel_trip_event, request, options: options);
  }

  $grpc.ResponseFuture<$3.Empty> start_trip_event($1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$start_trip_event, request, options: options);
  }

  $grpc.ResponseFuture<$3.Empty> complete_trip_event($1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$complete_trip_event, request, options: options);
  }

  $grpc.ResponseStream<$6.TripEventList> get_trip_events($1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$get_trip_events, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$6.TripEvent> get_trip_event($1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$get_trip_event, $async.Stream.fromIterable([request]),
        options: options);
  }
}

abstract class TripServiceBase extends $grpc.Service {
  $core.String get $name => 'trip.TripService';

  TripServiceBase() {
    $addMethod($grpc.ServiceMethod<$6.BookTripRequest, $1.StringValue>(
        'book_trip',
        book_trip_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.BookTripRequest.fromBuffer(value),
        ($1.StringValue value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $6.Trip>(
        'get_trip',
        get_trip_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($6.Trip value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $6.TripList>(
        'get_trips',
        get_trips_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($6.TripList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $3.Empty>(
        'delete_trip',
        delete_trip_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($3.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $3.Empty>(
        'cancel_trip_event',
        cancel_trip_event_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($3.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $3.Empty>(
        'start_trip_event',
        start_trip_event_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($3.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $3.Empty>(
        'complete_trip_event',
        complete_trip_event_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($3.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $6.TripEventList>(
        'get_trip_events',
        get_trip_events_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($6.TripEventList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $6.TripEvent>(
        'get_trip_event',
        get_trip_event_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($6.TripEvent value) => value.writeToBuffer()));
  }

  $async.Future<$1.StringValue> book_trip_Pre(
      $grpc.ServiceCall call, $async.Future<$6.BookTripRequest> request) async {
    return book_trip(call, await request);
  }

  $async.Future<$6.Trip> get_trip_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async {
    return get_trip(call, await request);
  }

  $async.Stream<$6.TripList> get_trips_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async* {
    yield* get_trips(call, await request);
  }

  $async.Future<$3.Empty> delete_trip_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async {
    return delete_trip(call, await request);
  }

  $async.Future<$3.Empty> cancel_trip_event_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async {
    return cancel_trip_event(call, await request);
  }

  $async.Future<$3.Empty> start_trip_event_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async {
    return start_trip_event(call, await request);
  }

  $async.Future<$3.Empty> complete_trip_event_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async {
    return complete_trip_event(call, await request);
  }

  $async.Stream<$6.TripEventList> get_trip_events_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async* {
    yield* get_trip_events(call, await request);
  }

  $async.Stream<$6.TripEvent> get_trip_event_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async* {
    yield* get_trip_event(call, await request);
  }

  $async.Future<$1.StringValue> book_trip(
      $grpc.ServiceCall call, $6.BookTripRequest request);
  $async.Future<$6.Trip> get_trip(
      $grpc.ServiceCall call, $1.StringValue request);
  $async.Stream<$6.TripList> get_trips(
      $grpc.ServiceCall call, $1.StringValue request);
  $async.Future<$3.Empty> delete_trip(
      $grpc.ServiceCall call, $1.StringValue request);
  $async.Future<$3.Empty> cancel_trip_event(
      $grpc.ServiceCall call, $1.StringValue request);
  $async.Future<$3.Empty> start_trip_event(
      $grpc.ServiceCall call, $1.StringValue request);
  $async.Future<$3.Empty> complete_trip_event(
      $grpc.ServiceCall call, $1.StringValue request);
  $async.Stream<$6.TripEventList> get_trip_events(
      $grpc.ServiceCall call, $1.StringValue request);
  $async.Stream<$6.TripEvent> get_trip_event(
      $grpc.ServiceCall call, $1.StringValue request);
}
