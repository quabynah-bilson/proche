///
//  Generated code. Do not modify.
//  source: giveaway.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'core_shared.pb.dart' as $3;
import 'package:protobuf_google/protobuf_google.dart' as $1;
import 'package:protobuf_google/protobuf_google.dart' as $2;
export 'giveaway.pb.dart';

class GiveAwayServiceClient extends $grpc.Client {
  static final _$create_giveaway =
      $grpc.ClientMethod<$3.CreateGiveAwayRequest, $1.StringValue>(
          '/event.GiveAwayService/create_giveaway',
          ($3.CreateGiveAwayRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value));
  static final _$get_giveaway = $grpc.ClientMethod<$1.StringValue, $3.GiveAway>(
      '/event.GiveAwayService/get_giveaway',
      ($1.StringValue value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.GiveAway.fromBuffer(value));
  static final _$get_giveaways =
      $grpc.ClientMethod<$3.CommonAddress, $3.GiveAwayList>(
          '/event.GiveAwayService/get_giveaways',
          ($3.CommonAddress value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.GiveAwayList.fromBuffer(value));
  static final _$get_giveaways_by_owner =
      $grpc.ClientMethod<$1.StringValue, $3.GiveAwayList>(
          '/event.GiveAwayService/get_giveaways_by_owner',
          ($1.StringValue value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.GiveAwayList.fromBuffer(value));
  static final _$update_giveaway = $grpc.ClientMethod<$3.GiveAway, $2.Empty>(
      '/event.GiveAwayService/update_giveaway',
      ($3.GiveAway value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.Empty.fromBuffer(value));
  static final _$delete_giveaway = $grpc.ClientMethod<$1.StringValue, $2.Empty>(
      '/event.GiveAwayService/delete_giveaway',
      ($1.StringValue value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.Empty.fromBuffer(value));
  static final _$get_candidates_for_giveaway =
      $grpc.ClientMethod<$1.StringValue, $3.GiveawayCandidateList>(
          '/event.GiveAwayService/get_candidates_for_giveaway',
          ($1.StringValue value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $3.GiveawayCandidateList.fromBuffer(value));

  GiveAwayServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.StringValue> create_giveaway(
      $3.CreateGiveAwayRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$create_giveaway, request, options: options);
  }

  $grpc.ResponseFuture<$3.GiveAway> get_giveaway($1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$get_giveaway, request, options: options);
  }

  $grpc.ResponseStream<$3.GiveAwayList> get_giveaways($3.CommonAddress request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$get_giveaways, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$3.GiveAwayList> get_giveaways_by_owner(
      $1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$get_giveaways_by_owner, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$2.Empty> update_giveaway($3.GiveAway request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$update_giveaway, request, options: options);
  }

  $grpc.ResponseFuture<$2.Empty> delete_giveaway($1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$delete_giveaway, request, options: options);
  }

  $grpc.ResponseStream<$3.GiveawayCandidateList> get_candidates_for_giveaway(
      $1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$get_candidates_for_giveaway, $async.Stream.fromIterable([request]),
        options: options);
  }
}

abstract class GiveAwayServiceBase extends $grpc.Service {
  $core.String get $name => 'event.GiveAwayService';

  GiveAwayServiceBase() {
    $addMethod($grpc.ServiceMethod<$3.CreateGiveAwayRequest, $1.StringValue>(
        'create_giveaway',
        create_giveaway_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $3.CreateGiveAwayRequest.fromBuffer(value),
        ($1.StringValue value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $3.GiveAway>(
        'get_giveaway',
        get_giveaway_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($3.GiveAway value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.CommonAddress, $3.GiveAwayList>(
        'get_giveaways',
        get_giveaways_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $3.CommonAddress.fromBuffer(value),
        ($3.GiveAwayList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $3.GiveAwayList>(
        'get_giveaways_by_owner',
        get_giveaways_by_owner_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($3.GiveAwayList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.GiveAway, $2.Empty>(
        'update_giveaway',
        update_giveaway_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.GiveAway.fromBuffer(value),
        ($2.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $2.Empty>(
        'delete_giveaway',
        delete_giveaway_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($2.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $3.GiveawayCandidateList>(
        'get_candidates_for_giveaway',
        get_candidates_for_giveaway_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($3.GiveawayCandidateList value) => value.writeToBuffer()));
  }

  $async.Future<$1.StringValue> create_giveaway_Pre($grpc.ServiceCall call,
      $async.Future<$3.CreateGiveAwayRequest> request) async {
    return create_giveaway(call, await request);
  }

  $async.Future<$3.GiveAway> get_giveaway_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async {
    return get_giveaway(call, await request);
  }

  $async.Stream<$3.GiveAwayList> get_giveaways_Pre(
      $grpc.ServiceCall call, $async.Future<$3.CommonAddress> request) async* {
    yield* get_giveaways(call, await request);
  }

  $async.Stream<$3.GiveAwayList> get_giveaways_by_owner_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async* {
    yield* get_giveaways_by_owner(call, await request);
  }

  $async.Future<$2.Empty> update_giveaway_Pre(
      $grpc.ServiceCall call, $async.Future<$3.GiveAway> request) async {
    return update_giveaway(call, await request);
  }

  $async.Future<$2.Empty> delete_giveaway_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async {
    return delete_giveaway(call, await request);
  }

  $async.Stream<$3.GiveawayCandidateList> get_candidates_for_giveaway_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async* {
    yield* get_candidates_for_giveaway(call, await request);
  }

  $async.Future<$1.StringValue> create_giveaway(
      $grpc.ServiceCall call, $3.CreateGiveAwayRequest request);
  $async.Future<$3.GiveAway> get_giveaway(
      $grpc.ServiceCall call, $1.StringValue request);
  $async.Stream<$3.GiveAwayList> get_giveaways(
      $grpc.ServiceCall call, $3.CommonAddress request);
  $async.Stream<$3.GiveAwayList> get_giveaways_by_owner(
      $grpc.ServiceCall call, $1.StringValue request);
  $async.Future<$2.Empty> update_giveaway(
      $grpc.ServiceCall call, $3.GiveAway request);
  $async.Future<$2.Empty> delete_giveaway(
      $grpc.ServiceCall call, $1.StringValue request);
  $async.Stream<$3.GiveawayCandidateList> get_candidates_for_giveaway(
      $grpc.ServiceCall call, $1.StringValue request);
}
