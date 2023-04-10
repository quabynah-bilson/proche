///
//  Generated code. Do not modify.
//  source: giveaway.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'giveaway.pb.dart' as $5;
import 'package:protobuf_google/protobuf_google.dart' as $2;
import 'package:protobuf_google/protobuf_google.dart' as $1;
export 'giveaway.pb.dart';

class GiveAwayServiceClient extends $grpc.Client {
  static final _$create_giveaway =
      $grpc.ClientMethod<$5.CreateGiveAwayRequest, $2.StringValue>(
          '/event.GiveAwayService/create_giveaway',
          ($5.CreateGiveAwayRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.StringValue.fromBuffer(value));
  static final _$get_giveaway = $grpc.ClientMethod<$2.StringValue, $5.GiveAway>(
      '/event.GiveAwayService/get_giveaway',
      ($2.StringValue value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $5.GiveAway.fromBuffer(value));
  static final _$get_giveaways = $grpc.ClientMethod<$1.Empty, $5.GiveAwayList>(
      '/event.GiveAwayService/get_giveaways',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $5.GiveAwayList.fromBuffer(value));
  static final _$get_giveaways_by_owner =
      $grpc.ClientMethod<$2.StringValue, $5.GiveAwayList>(
          '/event.GiveAwayService/get_giveaways_by_owner',
          ($2.StringValue value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $5.GiveAwayList.fromBuffer(value));
  static final _$get_giveaways_by_coordinates =
      $grpc.ClientMethod<$5.GiveAwayCoordinates, $5.GiveAwayList>(
          '/event.GiveAwayService/get_giveaways_by_coordinates',
          ($5.GiveAwayCoordinates value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $5.GiveAwayList.fromBuffer(value));
  static final _$get_giveaways_by_coordinates_and_radius = $grpc.ClientMethod<
          $5.GiveAwayByCoordinatesAndRadiusRequest, $5.GiveAwayList>(
      '/event.GiveAwayService/get_giveaways_by_coordinates_and_radius',
      ($5.GiveAwayByCoordinatesAndRadiusRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $5.GiveAwayList.fromBuffer(value));
  static final _$update_giveaway = $grpc.ClientMethod<$5.GiveAway, $1.Empty>(
      '/event.GiveAwayService/update_giveaway',
      ($5.GiveAway value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$delete_giveaway = $grpc.ClientMethod<$2.StringValue, $1.Empty>(
      '/event.GiveAwayService/delete_giveaway',
      ($2.StringValue value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));

  GiveAwayServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$2.StringValue> create_giveaway(
      $5.CreateGiveAwayRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$create_giveaway, request, options: options);
  }

  $grpc.ResponseFuture<$5.GiveAway> get_giveaway($2.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$get_giveaway, request, options: options);
  }

  $grpc.ResponseStream<$5.GiveAwayList> get_giveaways($1.Empty request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$get_giveaways, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$5.GiveAwayList> get_giveaways_by_owner(
      $2.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$get_giveaways_by_owner, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$5.GiveAwayList> get_giveaways_by_coordinates(
      $5.GiveAwayCoordinates request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$get_giveaways_by_coordinates, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$5.GiveAwayList> get_giveaways_by_coordinates_and_radius(
      $5.GiveAwayByCoordinatesAndRadiusRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$get_giveaways_by_coordinates_and_radius,
        $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$1.Empty> update_giveaway($5.GiveAway request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$update_giveaway, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> delete_giveaway($2.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$delete_giveaway, request, options: options);
  }
}

abstract class GiveAwayServiceBase extends $grpc.Service {
  $core.String get $name => 'event.GiveAwayService';

  GiveAwayServiceBase() {
    $addMethod($grpc.ServiceMethod<$5.CreateGiveAwayRequest, $2.StringValue>(
        'create_giveaway',
        create_giveaway_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $5.CreateGiveAwayRequest.fromBuffer(value),
        ($2.StringValue value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.StringValue, $5.GiveAway>(
        'get_giveaway',
        get_giveaway_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.StringValue.fromBuffer(value),
        ($5.GiveAway value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $5.GiveAwayList>(
        'get_giveaways',
        get_giveaways_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($5.GiveAwayList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.StringValue, $5.GiveAwayList>(
        'get_giveaways_by_owner',
        get_giveaways_by_owner_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $2.StringValue.fromBuffer(value),
        ($5.GiveAwayList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.GiveAwayCoordinates, $5.GiveAwayList>(
        'get_giveaways_by_coordinates',
        get_giveaways_by_coordinates_Pre,
        false,
        true,
        ($core.List<$core.int> value) =>
            $5.GiveAwayCoordinates.fromBuffer(value),
        ($5.GiveAwayList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.GiveAwayByCoordinatesAndRadiusRequest,
            $5.GiveAwayList>(
        'get_giveaways_by_coordinates_and_radius',
        get_giveaways_by_coordinates_and_radius_Pre,
        false,
        true,
        ($core.List<$core.int> value) =>
            $5.GiveAwayByCoordinatesAndRadiusRequest.fromBuffer(value),
        ($5.GiveAwayList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.GiveAway, $1.Empty>(
        'update_giveaway',
        update_giveaway_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.GiveAway.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.StringValue, $1.Empty>(
        'delete_giveaway',
        delete_giveaway_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.StringValue.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$2.StringValue> create_giveaway_Pre($grpc.ServiceCall call,
      $async.Future<$5.CreateGiveAwayRequest> request) async {
    return create_giveaway(call, await request);
  }

  $async.Future<$5.GiveAway> get_giveaway_Pre(
      $grpc.ServiceCall call, $async.Future<$2.StringValue> request) async {
    return get_giveaway(call, await request);
  }

  $async.Stream<$5.GiveAwayList> get_giveaways_Pre(
      $grpc.ServiceCall call, $async.Future<$1.Empty> request) async* {
    yield* get_giveaways(call, await request);
  }

  $async.Stream<$5.GiveAwayList> get_giveaways_by_owner_Pre(
      $grpc.ServiceCall call, $async.Future<$2.StringValue> request) async* {
    yield* get_giveaways_by_owner(call, await request);
  }

  $async.Stream<$5.GiveAwayList> get_giveaways_by_coordinates_Pre(
      $grpc.ServiceCall call,
      $async.Future<$5.GiveAwayCoordinates> request) async* {
    yield* get_giveaways_by_coordinates(call, await request);
  }

  $async.Stream<$5.GiveAwayList> get_giveaways_by_coordinates_and_radius_Pre(
      $grpc.ServiceCall call,
      $async.Future<$5.GiveAwayByCoordinatesAndRadiusRequest> request) async* {
    yield* get_giveaways_by_coordinates_and_radius(call, await request);
  }

  $async.Future<$1.Empty> update_giveaway_Pre(
      $grpc.ServiceCall call, $async.Future<$5.GiveAway> request) async {
    return update_giveaway(call, await request);
  }

  $async.Future<$1.Empty> delete_giveaway_Pre(
      $grpc.ServiceCall call, $async.Future<$2.StringValue> request) async {
    return delete_giveaway(call, await request);
  }

  $async.Future<$2.StringValue> create_giveaway(
      $grpc.ServiceCall call, $5.CreateGiveAwayRequest request);
  $async.Future<$5.GiveAway> get_giveaway(
      $grpc.ServiceCall call, $2.StringValue request);
  $async.Stream<$5.GiveAwayList> get_giveaways(
      $grpc.ServiceCall call, $1.Empty request);
  $async.Stream<$5.GiveAwayList> get_giveaways_by_owner(
      $grpc.ServiceCall call, $2.StringValue request);
  $async.Stream<$5.GiveAwayList> get_giveaways_by_coordinates(
      $grpc.ServiceCall call, $5.GiveAwayCoordinates request);
  $async.Stream<$5.GiveAwayList> get_giveaways_by_coordinates_and_radius(
      $grpc.ServiceCall call, $5.GiveAwayByCoordinatesAndRadiusRequest request);
  $async.Future<$1.Empty> update_giveaway(
      $grpc.ServiceCall call, $5.GiveAway request);
  $async.Future<$1.Empty> delete_giveaway(
      $grpc.ServiceCall call, $2.StringValue request);
}
