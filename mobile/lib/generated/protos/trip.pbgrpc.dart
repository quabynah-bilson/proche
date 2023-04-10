///
//  Generated code. Do not modify.
//  source: trip.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'trip.pb.dart' as $7;
import 'package:protobuf_google/protobuf_google.dart' as $2;
import 'package:protobuf_google/protobuf_google.dart' as $1;
export 'trip.pb.dart';

class TripServiceClient extends $grpc.Client {
  static final _$book_trip =
      $grpc.ClientMethod<$7.BookTripRequest, $2.StringValue>(
          '/trip.TripService/book_trip',
          ($7.BookTripRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.StringValue.fromBuffer(value));
  static final _$get_trip = $grpc.ClientMethod<$2.StringValue, $7.Trip>(
      '/trip.TripService/get_trip',
      ($2.StringValue value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $7.Trip.fromBuffer(value));
  static final _$get_trips = $grpc.ClientMethod<$2.StringValue, $7.TripList>(
      '/trip.TripService/get_trips',
      ($2.StringValue value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $7.TripList.fromBuffer(value));
  static final _$delete_trip = $grpc.ClientMethod<$2.StringValue, $1.Empty>(
      '/trip.TripService/delete_trip',
      ($2.StringValue value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$cancel_trip_event =
      $grpc.ClientMethod<$2.StringValue, $1.Empty>(
          '/trip.TripService/cancel_trip_event',
          ($2.StringValue value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$start_trip_event =
      $grpc.ClientMethod<$2.StringValue, $1.Empty>(
          '/trip.TripService/start_trip_event',
          ($2.StringValue value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$complete_trip_event =
      $grpc.ClientMethod<$2.StringValue, $1.Empty>(
          '/trip.TripService/complete_trip_event',
          ($2.StringValue value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$get_trip_events =
      $grpc.ClientMethod<$2.StringValue, $7.TripEventList>(
          '/trip.TripService/get_trip_events',
          ($2.StringValue value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $7.TripEventList.fromBuffer(value));
  static final _$get_trip_event =
      $grpc.ClientMethod<$2.StringValue, $7.TripEvent>(
          '/trip.TripService/get_trip_event',
          ($2.StringValue value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $7.TripEvent.fromBuffer(value));

  TripServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$2.StringValue> book_trip($7.BookTripRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$book_trip, request, options: options);
  }

  $grpc.ResponseFuture<$7.Trip> get_trip($2.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$get_trip, request, options: options);
  }

  $grpc.ResponseStream<$7.TripList> get_trips($2.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$get_trips, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$1.Empty> delete_trip($2.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$delete_trip, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> cancel_trip_event($2.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$cancel_trip_event, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> start_trip_event($2.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$start_trip_event, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> complete_trip_event($2.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$complete_trip_event, request, options: options);
  }

  $grpc.ResponseStream<$7.TripEventList> get_trip_events($2.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$get_trip_events, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$7.TripEvent> get_trip_event($2.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$get_trip_event, $async.Stream.fromIterable([request]),
        options: options);
  }
}

abstract class TripServiceBase extends $grpc.Service {
  $core.String get $name => 'trip.TripService';

  TripServiceBase() {
    $addMethod($grpc.ServiceMethod<$7.BookTripRequest, $2.StringValue>(
        'book_trip',
        book_trip_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $7.BookTripRequest.fromBuffer(value),
        ($2.StringValue value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.StringValue, $7.Trip>(
        'get_trip',
        get_trip_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.StringValue.fromBuffer(value),
        ($7.Trip value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.StringValue, $7.TripList>(
        'get_trips',
        get_trips_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $2.StringValue.fromBuffer(value),
        ($7.TripList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.StringValue, $1.Empty>(
        'delete_trip',
        delete_trip_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.StringValue.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.StringValue, $1.Empty>(
        'cancel_trip_event',
        cancel_trip_event_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.StringValue.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.StringValue, $1.Empty>(
        'start_trip_event',
        start_trip_event_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.StringValue.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.StringValue, $1.Empty>(
        'complete_trip_event',
        complete_trip_event_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.StringValue.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.StringValue, $7.TripEventList>(
        'get_trip_events',
        get_trip_events_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $2.StringValue.fromBuffer(value),
        ($7.TripEventList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.StringValue, $7.TripEvent>(
        'get_trip_event',
        get_trip_event_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $2.StringValue.fromBuffer(value),
        ($7.TripEvent value) => value.writeToBuffer()));
  }

  $async.Future<$2.StringValue> book_trip_Pre(
      $grpc.ServiceCall call, $async.Future<$7.BookTripRequest> request) async {
    return book_trip(call, await request);
  }

  $async.Future<$7.Trip> get_trip_Pre(
      $grpc.ServiceCall call, $async.Future<$2.StringValue> request) async {
    return get_trip(call, await request);
  }

  $async.Stream<$7.TripList> get_trips_Pre(
      $grpc.ServiceCall call, $async.Future<$2.StringValue> request) async* {
    yield* get_trips(call, await request);
  }

  $async.Future<$1.Empty> delete_trip_Pre(
      $grpc.ServiceCall call, $async.Future<$2.StringValue> request) async {
    return delete_trip(call, await request);
  }

  $async.Future<$1.Empty> cancel_trip_event_Pre(
      $grpc.ServiceCall call, $async.Future<$2.StringValue> request) async {
    return cancel_trip_event(call, await request);
  }

  $async.Future<$1.Empty> start_trip_event_Pre(
      $grpc.ServiceCall call, $async.Future<$2.StringValue> request) async {
    return start_trip_event(call, await request);
  }

  $async.Future<$1.Empty> complete_trip_event_Pre(
      $grpc.ServiceCall call, $async.Future<$2.StringValue> request) async {
    return complete_trip_event(call, await request);
  }

  $async.Stream<$7.TripEventList> get_trip_events_Pre(
      $grpc.ServiceCall call, $async.Future<$2.StringValue> request) async* {
    yield* get_trip_events(call, await request);
  }

  $async.Stream<$7.TripEvent> get_trip_event_Pre(
      $grpc.ServiceCall call, $async.Future<$2.StringValue> request) async* {
    yield* get_trip_event(call, await request);
  }

  $async.Future<$2.StringValue> book_trip(
      $grpc.ServiceCall call, $7.BookTripRequest request);
  $async.Future<$7.Trip> get_trip(
      $grpc.ServiceCall call, $2.StringValue request);
  $async.Stream<$7.TripList> get_trips(
      $grpc.ServiceCall call, $2.StringValue request);
  $async.Future<$1.Empty> delete_trip(
      $grpc.ServiceCall call, $2.StringValue request);
  $async.Future<$1.Empty> cancel_trip_event(
      $grpc.ServiceCall call, $2.StringValue request);
  $async.Future<$1.Empty> start_trip_event(
      $grpc.ServiceCall call, $2.StringValue request);
  $async.Future<$1.Empty> complete_trip_event(
      $grpc.ServiceCall call, $2.StringValue request);
  $async.Stream<$7.TripEventList> get_trip_events(
      $grpc.ServiceCall call, $2.StringValue request);
  $async.Stream<$7.TripEvent> get_trip_event(
      $grpc.ServiceCall call, $2.StringValue request);
}
