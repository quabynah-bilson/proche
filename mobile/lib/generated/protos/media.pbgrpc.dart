///
//  Generated code. Do not modify.
//  source: media.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'media.pb.dart' as $0;
import 'package:protobuf_google/protobuf_google.dart' as $1;
import 'package:protobuf_google/protobuf_google.dart' as $2;
export 'media.pb.dart';

class MediaServiceClient extends $grpc.Client {
  static final _$upload_media =
      $grpc.ClientMethod<$0.UploadMediaRequest, $1.StringValue>(
          '/media.MediaService/upload_media',
          ($0.UploadMediaRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value));
  static final _$get_media = $grpc.ClientMethod<$1.StringValue, $1.StringValue>(
      '/media.MediaService/get_media',
      ($1.StringValue value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value));
  static final _$delete_media = $grpc.ClientMethod<$1.StringValue, $2.Empty>(
      '/media.MediaService/delete_media',
      ($1.StringValue value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.Empty.fromBuffer(value));

  MediaServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.StringValue> upload_media(
      $0.UploadMediaRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$upload_media, request, options: options);
  }

  $grpc.ResponseFuture<$1.StringValue> get_media($1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$get_media, request, options: options);
  }

  $grpc.ResponseFuture<$2.Empty> delete_media($1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$delete_media, request, options: options);
  }
}

abstract class MediaServiceBase extends $grpc.Service {
  $core.String get $name => 'media.MediaService';

  MediaServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.UploadMediaRequest, $1.StringValue>(
        'upload_media',
        upload_media_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UploadMediaRequest.fromBuffer(value),
        ($1.StringValue value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $1.StringValue>(
        'get_media',
        get_media_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($1.StringValue value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $2.Empty>(
        'delete_media',
        delete_media_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($2.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$1.StringValue> upload_media_Pre($grpc.ServiceCall call,
      $async.Future<$0.UploadMediaRequest> request) async {
    return upload_media(call, await request);
  }

  $async.Future<$1.StringValue> get_media_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async {
    return get_media(call, await request);
  }

  $async.Future<$2.Empty> delete_media_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async {
    return delete_media(call, await request);
  }

  $async.Future<$1.StringValue> upload_media(
      $grpc.ServiceCall call, $0.UploadMediaRequest request);
  $async.Future<$1.StringValue> get_media(
      $grpc.ServiceCall call, $1.StringValue request);
  $async.Future<$2.Empty> delete_media(
      $grpc.ServiceCall call, $1.StringValue request);
}
