///
//  Generated code. Do not modify.
//  source: task.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'task.pb.dart' as $0;
import 'package:protobuf_google/protobuf_google.dart' as $1;
import 'core_shared.pb.dart' as $2;
import 'package:protobuf_google/protobuf_google.dart' as $3;
export 'task.pb.dart';

class TaskServiceClient extends $grpc.Client {
  static final _$create_task =
      $grpc.ClientMethod<$0.CreateTaskRequest, $0.Task>(
          '/task.TaskService/create_task',
          ($0.CreateTaskRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Task.fromBuffer(value));
  static final _$get_task = $grpc.ClientMethod<$1.StringValue, $0.Task>(
      '/task.TaskService/get_task',
      ($1.StringValue value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Task.fromBuffer(value));
  static final _$get_tasks = $grpc.ClientMethod<$2.CommonAddress, $0.TaskList>(
      '/task.TaskService/get_tasks',
      ($2.CommonAddress value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.TaskList.fromBuffer(value));
  static final _$update_task =
      $grpc.ClientMethod<$0.UpdateTaskRequest, $0.Task>(
          '/task.TaskService/update_task',
          ($0.UpdateTaskRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Task.fromBuffer(value));
  static final _$delete_task = $grpc.ClientMethod<$1.StringValue, $3.Empty>(
      '/task.TaskService/delete_task',
      ($1.StringValue value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.Empty.fromBuffer(value));
  static final _$create_task_event =
      $grpc.ClientMethod<$0.CreateTaskEventRequest, $0.TaskEvent>(
          '/task.TaskService/create_task_event',
          ($0.CreateTaskEventRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.TaskEvent.fromBuffer(value));
  static final _$get_task_event =
      $grpc.ClientMethod<$1.StringValue, $0.TaskEvent>(
          '/task.TaskService/get_task_event',
          ($1.StringValue value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.TaskEvent.fromBuffer(value));
  static final _$get_task_events =
      $grpc.ClientMethod<$1.StringValue, $0.TaskEventList>(
          '/task.TaskService/get_task_events',
          ($1.StringValue value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.TaskEventList.fromBuffer(value));
  static final _$cancel_task_event =
      $grpc.ClientMethod<$1.StringValue, $0.TaskEvent>(
          '/task.TaskService/cancel_task_event',
          ($1.StringValue value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.TaskEvent.fromBuffer(value));
  static final _$complete_task_event =
      $grpc.ClientMethod<$0.CompleteTaskEventRequest, $0.TaskEvent>(
          '/task.TaskService/complete_task_event',
          ($0.CompleteTaskEventRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.TaskEvent.fromBuffer(value));
  static final _$get_task_events_for_user =
      $grpc.ClientMethod<$1.StringValue, $0.TaskEventList>(
          '/task.TaskService/get_task_events_for_user',
          ($1.StringValue value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.TaskEventList.fromBuffer(value));
  static final _$get_task_events_for_task =
      $grpc.ClientMethod<$1.StringValue, $0.TaskEventList>(
          '/task.TaskService/get_task_events_for_task',
          ($1.StringValue value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.TaskEventList.fromBuffer(value));
  static final _$get_task_events_for_user_and_task =
      $grpc.ClientMethod<$0.TaskEventRequest, $0.TaskEventList>(
          '/task.TaskService/get_task_events_for_user_and_task',
          ($0.TaskEventRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.TaskEventList.fromBuffer(value));
  static final _$delete_task_event =
      $grpc.ClientMethod<$1.StringValue, $3.Empty>(
          '/task.TaskService/delete_task_event',
          ($1.StringValue value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.Empty.fromBuffer(value));
  static final _$delete_task_events_for_task =
      $grpc.ClientMethod<$1.StringValue, $3.Empty>(
          '/task.TaskService/delete_task_events_for_task',
          ($1.StringValue value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.Empty.fromBuffer(value));
  static final _$delete_task_events_for_user =
      $grpc.ClientMethod<$1.StringValue, $3.Empty>(
          '/task.TaskService/delete_task_events_for_user',
          ($1.StringValue value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.Empty.fromBuffer(value));
  static final _$delete_task_events_for_user_and_task =
      $grpc.ClientMethod<$0.TaskEventRequest, $3.Empty>(
          '/task.TaskService/delete_task_events_for_user_and_task',
          ($0.TaskEventRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.Empty.fromBuffer(value));

  TaskServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.Task> create_task($0.CreateTaskRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$create_task, request, options: options);
  }

  $grpc.ResponseStream<$0.Task> get_task($1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$get_task, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$0.TaskList> get_tasks($2.CommonAddress request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$get_tasks, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$0.Task> update_task($0.UpdateTaskRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$update_task, request, options: options);
  }

  $grpc.ResponseFuture<$3.Empty> delete_task($1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$delete_task, request, options: options);
  }

  $grpc.ResponseFuture<$0.TaskEvent> create_task_event(
      $0.CreateTaskEventRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$create_task_event, request, options: options);
  }

  $grpc.ResponseStream<$0.TaskEvent> get_task_event($1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$get_task_event, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$0.TaskEventList> get_task_events($1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$get_task_events, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$0.TaskEvent> cancel_task_event($1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$cancel_task_event, request, options: options);
  }

  $grpc.ResponseFuture<$0.TaskEvent> complete_task_event(
      $0.CompleteTaskEventRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$complete_task_event, request, options: options);
  }

  $grpc.ResponseStream<$0.TaskEventList> get_task_events_for_user(
      $1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$get_task_events_for_user, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$0.TaskEventList> get_task_events_for_task(
      $1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$get_task_events_for_task, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$0.TaskEventList> get_task_events_for_user_and_task(
      $0.TaskEventRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$get_task_events_for_user_and_task,
        $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$3.Empty> delete_task_event($1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$delete_task_event, request, options: options);
  }

  $grpc.ResponseFuture<$3.Empty> delete_task_events_for_task(
      $1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$delete_task_events_for_task, request,
        options: options);
  }

  $grpc.ResponseFuture<$3.Empty> delete_task_events_for_user(
      $1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$delete_task_events_for_user, request,
        options: options);
  }

  $grpc.ResponseFuture<$3.Empty> delete_task_events_for_user_and_task(
      $0.TaskEventRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$delete_task_events_for_user_and_task, request,
        options: options);
  }
}

abstract class TaskServiceBase extends $grpc.Service {
  $core.String get $name => 'task.TaskService';

  TaskServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CreateTaskRequest, $0.Task>(
        'create_task',
        create_task_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateTaskRequest.fromBuffer(value),
        ($0.Task value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $0.Task>(
        'get_task',
        get_task_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($0.Task value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.CommonAddress, $0.TaskList>(
        'get_tasks',
        get_tasks_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $2.CommonAddress.fromBuffer(value),
        ($0.TaskList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateTaskRequest, $0.Task>(
        'update_task',
        update_task_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateTaskRequest.fromBuffer(value),
        ($0.Task value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $3.Empty>(
        'delete_task',
        delete_task_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($3.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateTaskEventRequest, $0.TaskEvent>(
        'create_task_event',
        create_task_event_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CreateTaskEventRequest.fromBuffer(value),
        ($0.TaskEvent value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $0.TaskEvent>(
        'get_task_event',
        get_task_event_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($0.TaskEvent value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $0.TaskEventList>(
        'get_task_events',
        get_task_events_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($0.TaskEventList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $0.TaskEvent>(
        'cancel_task_event',
        cancel_task_event_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($0.TaskEvent value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CompleteTaskEventRequest, $0.TaskEvent>(
        'complete_task_event',
        complete_task_event_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CompleteTaskEventRequest.fromBuffer(value),
        ($0.TaskEvent value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $0.TaskEventList>(
        'get_task_events_for_user',
        get_task_events_for_user_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($0.TaskEventList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $0.TaskEventList>(
        'get_task_events_for_task',
        get_task_events_for_task_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($0.TaskEventList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TaskEventRequest, $0.TaskEventList>(
        'get_task_events_for_user_and_task',
        get_task_events_for_user_and_task_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.TaskEventRequest.fromBuffer(value),
        ($0.TaskEventList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $3.Empty>(
        'delete_task_event',
        delete_task_event_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($3.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $3.Empty>(
        'delete_task_events_for_task',
        delete_task_events_for_task_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($3.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $3.Empty>(
        'delete_task_events_for_user',
        delete_task_events_for_user_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($3.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TaskEventRequest, $3.Empty>(
        'delete_task_events_for_user_and_task',
        delete_task_events_for_user_and_task_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TaskEventRequest.fromBuffer(value),
        ($3.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$0.Task> create_task_Pre($grpc.ServiceCall call,
      $async.Future<$0.CreateTaskRequest> request) async {
    return create_task(call, await request);
  }

  $async.Stream<$0.Task> get_task_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async* {
    yield* get_task(call, await request);
  }

  $async.Stream<$0.TaskList> get_tasks_Pre(
      $grpc.ServiceCall call, $async.Future<$2.CommonAddress> request) async* {
    yield* get_tasks(call, await request);
  }

  $async.Future<$0.Task> update_task_Pre($grpc.ServiceCall call,
      $async.Future<$0.UpdateTaskRequest> request) async {
    return update_task(call, await request);
  }

  $async.Future<$3.Empty> delete_task_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async {
    return delete_task(call, await request);
  }

  $async.Future<$0.TaskEvent> create_task_event_Pre($grpc.ServiceCall call,
      $async.Future<$0.CreateTaskEventRequest> request) async {
    return create_task_event(call, await request);
  }

  $async.Stream<$0.TaskEvent> get_task_event_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async* {
    yield* get_task_event(call, await request);
  }

  $async.Stream<$0.TaskEventList> get_task_events_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async* {
    yield* get_task_events(call, await request);
  }

  $async.Future<$0.TaskEvent> cancel_task_event_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async {
    return cancel_task_event(call, await request);
  }

  $async.Future<$0.TaskEvent> complete_task_event_Pre($grpc.ServiceCall call,
      $async.Future<$0.CompleteTaskEventRequest> request) async {
    return complete_task_event(call, await request);
  }

  $async.Stream<$0.TaskEventList> get_task_events_for_user_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async* {
    yield* get_task_events_for_user(call, await request);
  }

  $async.Stream<$0.TaskEventList> get_task_events_for_task_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async* {
    yield* get_task_events_for_task(call, await request);
  }

  $async.Stream<$0.TaskEventList> get_task_events_for_user_and_task_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.TaskEventRequest> request) async* {
    yield* get_task_events_for_user_and_task(call, await request);
  }

  $async.Future<$3.Empty> delete_task_event_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async {
    return delete_task_event(call, await request);
  }

  $async.Future<$3.Empty> delete_task_events_for_task_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async {
    return delete_task_events_for_task(call, await request);
  }

  $async.Future<$3.Empty> delete_task_events_for_user_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async {
    return delete_task_events_for_user(call, await request);
  }

  $async.Future<$3.Empty> delete_task_events_for_user_and_task_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.TaskEventRequest> request) async {
    return delete_task_events_for_user_and_task(call, await request);
  }

  $async.Future<$0.Task> create_task(
      $grpc.ServiceCall call, $0.CreateTaskRequest request);
  $async.Stream<$0.Task> get_task(
      $grpc.ServiceCall call, $1.StringValue request);
  $async.Stream<$0.TaskList> get_tasks(
      $grpc.ServiceCall call, $2.CommonAddress request);
  $async.Future<$0.Task> update_task(
      $grpc.ServiceCall call, $0.UpdateTaskRequest request);
  $async.Future<$3.Empty> delete_task(
      $grpc.ServiceCall call, $1.StringValue request);
  $async.Future<$0.TaskEvent> create_task_event(
      $grpc.ServiceCall call, $0.CreateTaskEventRequest request);
  $async.Stream<$0.TaskEvent> get_task_event(
      $grpc.ServiceCall call, $1.StringValue request);
  $async.Stream<$0.TaskEventList> get_task_events(
      $grpc.ServiceCall call, $1.StringValue request);
  $async.Future<$0.TaskEvent> cancel_task_event(
      $grpc.ServiceCall call, $1.StringValue request);
  $async.Future<$0.TaskEvent> complete_task_event(
      $grpc.ServiceCall call, $0.CompleteTaskEventRequest request);
  $async.Stream<$0.TaskEventList> get_task_events_for_user(
      $grpc.ServiceCall call, $1.StringValue request);
  $async.Stream<$0.TaskEventList> get_task_events_for_task(
      $grpc.ServiceCall call, $1.StringValue request);
  $async.Stream<$0.TaskEventList> get_task_events_for_user_and_task(
      $grpc.ServiceCall call, $0.TaskEventRequest request);
  $async.Future<$3.Empty> delete_task_event(
      $grpc.ServiceCall call, $1.StringValue request);
  $async.Future<$3.Empty> delete_task_events_for_task(
      $grpc.ServiceCall call, $1.StringValue request);
  $async.Future<$3.Empty> delete_task_events_for_user(
      $grpc.ServiceCall call, $1.StringValue request);
  $async.Future<$3.Empty> delete_task_events_for_user_and_task(
      $grpc.ServiceCall call, $0.TaskEventRequest request);
}
