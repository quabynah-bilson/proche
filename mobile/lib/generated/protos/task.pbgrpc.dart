///
//  Generated code. Do not modify.
//  source: task.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'core_shared.pb.dart' as $3;
import 'package:protobuf_google/protobuf_google.dart' as $1;
import 'package:protobuf_google/protobuf_google.dart' as $2;
export 'task.pb.dart';

class TaskServiceClient extends $grpc.Client {
  static final _$create_task =
      $grpc.ClientMethod<$3.CreateTaskRequest, $3.ProcheTask>(
          '/task.TaskService/create_task',
          ($3.CreateTaskRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.ProcheTask.fromBuffer(value));
  static final _$get_task = $grpc.ClientMethod<$1.StringValue, $3.ProcheTask>(
      '/task.TaskService/get_task',
      ($1.StringValue value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.ProcheTask.fromBuffer(value));
  static final _$get_tasks = $grpc.ClientMethod<$3.CommonAddress, $3.TaskList>(
      '/task.TaskService/get_tasks',
      ($3.CommonAddress value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.TaskList.fromBuffer(value));
  static final _$get_tasks_for_current_user =
      $grpc.ClientMethod<$2.Empty, $3.TaskList>(
          '/task.TaskService/get_tasks_for_current_user',
          ($2.Empty value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.TaskList.fromBuffer(value));
  static final _$update_task =
      $grpc.ClientMethod<$3.UpdateTaskRequest, $3.ProcheTask>(
          '/task.TaskService/update_task',
          ($3.UpdateTaskRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.ProcheTask.fromBuffer(value));
  static final _$delete_task = $grpc.ClientMethod<$1.StringValue, $2.Empty>(
      '/task.TaskService/delete_task',
      ($1.StringValue value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.Empty.fromBuffer(value));
  static final _$create_task_event =
      $grpc.ClientMethod<$3.CreateTaskEventRequest, $3.TaskEvent>(
          '/task.TaskService/create_task_event',
          ($3.CreateTaskEventRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.TaskEvent.fromBuffer(value));
  static final _$get_task_event =
      $grpc.ClientMethod<$1.StringValue, $3.TaskEvent>(
          '/task.TaskService/get_task_event',
          ($1.StringValue value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.TaskEvent.fromBuffer(value));
  static final _$get_task_events =
      $grpc.ClientMethod<$1.StringValue, $3.TaskEventList>(
          '/task.TaskService/get_task_events',
          ($1.StringValue value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.TaskEventList.fromBuffer(value));
  static final _$cancel_task_event =
      $grpc.ClientMethod<$1.StringValue, $3.TaskEvent>(
          '/task.TaskService/cancel_task_event',
          ($1.StringValue value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.TaskEvent.fromBuffer(value));
  static final _$complete_task_event =
      $grpc.ClientMethod<$3.CompleteTaskEventRequest, $3.TaskEvent>(
          '/task.TaskService/complete_task_event',
          ($3.CompleteTaskEventRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.TaskEvent.fromBuffer(value));
  static final _$get_task_events_for_user =
      $grpc.ClientMethod<$1.StringValue, $3.TaskEventList>(
          '/task.TaskService/get_task_events_for_user',
          ($1.StringValue value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.TaskEventList.fromBuffer(value));
  static final _$get_task_events_for_task =
      $grpc.ClientMethod<$1.StringValue, $3.TaskEventList>(
          '/task.TaskService/get_task_events_for_task',
          ($1.StringValue value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.TaskEventList.fromBuffer(value));
  static final _$get_task_events_for_user_and_task =
      $grpc.ClientMethod<$3.TaskEventRequest, $3.TaskEventList>(
          '/task.TaskService/get_task_events_for_user_and_task',
          ($3.TaskEventRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.TaskEventList.fromBuffer(value));
  static final _$delete_task_event =
      $grpc.ClientMethod<$1.StringValue, $2.Empty>(
          '/task.TaskService/delete_task_event',
          ($1.StringValue value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.Empty.fromBuffer(value));
  static final _$delete_task_events_for_task =
      $grpc.ClientMethod<$1.StringValue, $2.Empty>(
          '/task.TaskService/delete_task_events_for_task',
          ($1.StringValue value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.Empty.fromBuffer(value));
  static final _$delete_task_events_for_user =
      $grpc.ClientMethod<$1.StringValue, $2.Empty>(
          '/task.TaskService/delete_task_events_for_user',
          ($1.StringValue value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.Empty.fromBuffer(value));
  static final _$delete_task_events_for_user_and_task =
      $grpc.ClientMethod<$3.TaskEventRequest, $2.Empty>(
          '/task.TaskService/delete_task_events_for_user_and_task',
          ($3.TaskEventRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.Empty.fromBuffer(value));
  static final _$get_candidates_for_task =
      $grpc.ClientMethod<$1.StringValue, $3.TaskCandidateList>(
          '/task.TaskService/get_candidates_for_task',
          ($1.StringValue value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $3.TaskCandidateList.fromBuffer(value));
  static final _$apply_for_task =
      $grpc.ClientMethod<$3.ApplyForTaskRequest, $2.Empty>(
          '/task.TaskService/apply_for_task',
          ($3.ApplyForTaskRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.Empty.fromBuffer(value));

  TaskServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$3.ProcheTask> create_task($3.CreateTaskRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$create_task, request, options: options);
  }

  $grpc.ResponseStream<$3.ProcheTask> get_task($1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$get_task, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$3.TaskList> get_tasks($3.CommonAddress request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$get_tasks, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$3.TaskList> get_tasks_for_current_user($2.Empty request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$get_tasks_for_current_user, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$3.ProcheTask> update_task($3.UpdateTaskRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$update_task, request, options: options);
  }

  $grpc.ResponseFuture<$2.Empty> delete_task($1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$delete_task, request, options: options);
  }

  $grpc.ResponseFuture<$3.TaskEvent> create_task_event(
      $3.CreateTaskEventRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$create_task_event, request, options: options);
  }

  $grpc.ResponseStream<$3.TaskEvent> get_task_event($1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$get_task_event, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$3.TaskEventList> get_task_events($1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$get_task_events, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$3.TaskEvent> cancel_task_event($1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$cancel_task_event, request, options: options);
  }

  $grpc.ResponseFuture<$3.TaskEvent> complete_task_event(
      $3.CompleteTaskEventRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$complete_task_event, request, options: options);
  }

  $grpc.ResponseStream<$3.TaskEventList> get_task_events_for_user(
      $1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$get_task_events_for_user, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$3.TaskEventList> get_task_events_for_task(
      $1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$get_task_events_for_task, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$3.TaskEventList> get_task_events_for_user_and_task(
      $3.TaskEventRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$get_task_events_for_user_and_task,
        $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$2.Empty> delete_task_event($1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$delete_task_event, request, options: options);
  }

  $grpc.ResponseFuture<$2.Empty> delete_task_events_for_task(
      $1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$delete_task_events_for_task, request,
        options: options);
  }

  $grpc.ResponseFuture<$2.Empty> delete_task_events_for_user(
      $1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$delete_task_events_for_user, request,
        options: options);
  }

  $grpc.ResponseFuture<$2.Empty> delete_task_events_for_user_and_task(
      $3.TaskEventRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$delete_task_events_for_user_and_task, request,
        options: options);
  }

  $grpc.ResponseStream<$3.TaskCandidateList> get_candidates_for_task(
      $1.StringValue request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$get_candidates_for_task, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$2.Empty> apply_for_task($3.ApplyForTaskRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$apply_for_task, request, options: options);
  }
}

abstract class TaskServiceBase extends $grpc.Service {
  $core.String get $name => 'task.TaskService';

  TaskServiceBase() {
    $addMethod($grpc.ServiceMethod<$3.CreateTaskRequest, $3.ProcheTask>(
        'create_task',
        create_task_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.CreateTaskRequest.fromBuffer(value),
        ($3.ProcheTask value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $3.ProcheTask>(
        'get_task',
        get_task_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($3.ProcheTask value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.CommonAddress, $3.TaskList>(
        'get_tasks',
        get_tasks_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $3.CommonAddress.fromBuffer(value),
        ($3.TaskList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.Empty, $3.TaskList>(
        'get_tasks_for_current_user',
        get_tasks_for_current_user_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $2.Empty.fromBuffer(value),
        ($3.TaskList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.UpdateTaskRequest, $3.ProcheTask>(
        'update_task',
        update_task_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.UpdateTaskRequest.fromBuffer(value),
        ($3.ProcheTask value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $2.Empty>(
        'delete_task',
        delete_task_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($2.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.CreateTaskEventRequest, $3.TaskEvent>(
        'create_task_event',
        create_task_event_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $3.CreateTaskEventRequest.fromBuffer(value),
        ($3.TaskEvent value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $3.TaskEvent>(
        'get_task_event',
        get_task_event_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($3.TaskEvent value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $3.TaskEventList>(
        'get_task_events',
        get_task_events_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($3.TaskEventList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $3.TaskEvent>(
        'cancel_task_event',
        cancel_task_event_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($3.TaskEvent value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.CompleteTaskEventRequest, $3.TaskEvent>(
        'complete_task_event',
        complete_task_event_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $3.CompleteTaskEventRequest.fromBuffer(value),
        ($3.TaskEvent value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $3.TaskEventList>(
        'get_task_events_for_user',
        get_task_events_for_user_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($3.TaskEventList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $3.TaskEventList>(
        'get_task_events_for_task',
        get_task_events_for_task_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($3.TaskEventList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.TaskEventRequest, $3.TaskEventList>(
        'get_task_events_for_user_and_task',
        get_task_events_for_user_and_task_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $3.TaskEventRequest.fromBuffer(value),
        ($3.TaskEventList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $2.Empty>(
        'delete_task_event',
        delete_task_event_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($2.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $2.Empty>(
        'delete_task_events_for_task',
        delete_task_events_for_task_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($2.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $2.Empty>(
        'delete_task_events_for_user',
        delete_task_events_for_user_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($2.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.TaskEventRequest, $2.Empty>(
        'delete_task_events_for_user_and_task',
        delete_task_events_for_user_and_task_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.TaskEventRequest.fromBuffer(value),
        ($2.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.StringValue, $3.TaskCandidateList>(
        'get_candidates_for_task',
        get_candidates_for_task_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $1.StringValue.fromBuffer(value),
        ($3.TaskCandidateList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.ApplyForTaskRequest, $2.Empty>(
        'apply_for_task',
        apply_for_task_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $3.ApplyForTaskRequest.fromBuffer(value),
        ($2.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$3.ProcheTask> create_task_Pre($grpc.ServiceCall call,
      $async.Future<$3.CreateTaskRequest> request) async {
    return create_task(call, await request);
  }

  $async.Stream<$3.ProcheTask> get_task_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async* {
    yield* get_task(call, await request);
  }

  $async.Stream<$3.TaskList> get_tasks_Pre(
      $grpc.ServiceCall call, $async.Future<$3.CommonAddress> request) async* {
    yield* get_tasks(call, await request);
  }

  $async.Stream<$3.TaskList> get_tasks_for_current_user_Pre(
      $grpc.ServiceCall call, $async.Future<$2.Empty> request) async* {
    yield* get_tasks_for_current_user(call, await request);
  }

  $async.Future<$3.ProcheTask> update_task_Pre($grpc.ServiceCall call,
      $async.Future<$3.UpdateTaskRequest> request) async {
    return update_task(call, await request);
  }

  $async.Future<$2.Empty> delete_task_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async {
    return delete_task(call, await request);
  }

  $async.Future<$3.TaskEvent> create_task_event_Pre($grpc.ServiceCall call,
      $async.Future<$3.CreateTaskEventRequest> request) async {
    return create_task_event(call, await request);
  }

  $async.Stream<$3.TaskEvent> get_task_event_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async* {
    yield* get_task_event(call, await request);
  }

  $async.Stream<$3.TaskEventList> get_task_events_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async* {
    yield* get_task_events(call, await request);
  }

  $async.Future<$3.TaskEvent> cancel_task_event_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async {
    return cancel_task_event(call, await request);
  }

  $async.Future<$3.TaskEvent> complete_task_event_Pre($grpc.ServiceCall call,
      $async.Future<$3.CompleteTaskEventRequest> request) async {
    return complete_task_event(call, await request);
  }

  $async.Stream<$3.TaskEventList> get_task_events_for_user_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async* {
    yield* get_task_events_for_user(call, await request);
  }

  $async.Stream<$3.TaskEventList> get_task_events_for_task_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async* {
    yield* get_task_events_for_task(call, await request);
  }

  $async.Stream<$3.TaskEventList> get_task_events_for_user_and_task_Pre(
      $grpc.ServiceCall call,
      $async.Future<$3.TaskEventRequest> request) async* {
    yield* get_task_events_for_user_and_task(call, await request);
  }

  $async.Future<$2.Empty> delete_task_event_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async {
    return delete_task_event(call, await request);
  }

  $async.Future<$2.Empty> delete_task_events_for_task_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async {
    return delete_task_events_for_task(call, await request);
  }

  $async.Future<$2.Empty> delete_task_events_for_user_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async {
    return delete_task_events_for_user(call, await request);
  }

  $async.Future<$2.Empty> delete_task_events_for_user_and_task_Pre(
      $grpc.ServiceCall call,
      $async.Future<$3.TaskEventRequest> request) async {
    return delete_task_events_for_user_and_task(call, await request);
  }

  $async.Stream<$3.TaskCandidateList> get_candidates_for_task_Pre(
      $grpc.ServiceCall call, $async.Future<$1.StringValue> request) async* {
    yield* get_candidates_for_task(call, await request);
  }

  $async.Future<$2.Empty> apply_for_task_Pre($grpc.ServiceCall call,
      $async.Future<$3.ApplyForTaskRequest> request) async {
    return apply_for_task(call, await request);
  }

  $async.Future<$3.ProcheTask> create_task(
      $grpc.ServiceCall call, $3.CreateTaskRequest request);
  $async.Stream<$3.ProcheTask> get_task(
      $grpc.ServiceCall call, $1.StringValue request);
  $async.Stream<$3.TaskList> get_tasks(
      $grpc.ServiceCall call, $3.CommonAddress request);
  $async.Stream<$3.TaskList> get_tasks_for_current_user(
      $grpc.ServiceCall call, $2.Empty request);
  $async.Future<$3.ProcheTask> update_task(
      $grpc.ServiceCall call, $3.UpdateTaskRequest request);
  $async.Future<$2.Empty> delete_task(
      $grpc.ServiceCall call, $1.StringValue request);
  $async.Future<$3.TaskEvent> create_task_event(
      $grpc.ServiceCall call, $3.CreateTaskEventRequest request);
  $async.Stream<$3.TaskEvent> get_task_event(
      $grpc.ServiceCall call, $1.StringValue request);
  $async.Stream<$3.TaskEventList> get_task_events(
      $grpc.ServiceCall call, $1.StringValue request);
  $async.Future<$3.TaskEvent> cancel_task_event(
      $grpc.ServiceCall call, $1.StringValue request);
  $async.Future<$3.TaskEvent> complete_task_event(
      $grpc.ServiceCall call, $3.CompleteTaskEventRequest request);
  $async.Stream<$3.TaskEventList> get_task_events_for_user(
      $grpc.ServiceCall call, $1.StringValue request);
  $async.Stream<$3.TaskEventList> get_task_events_for_task(
      $grpc.ServiceCall call, $1.StringValue request);
  $async.Stream<$3.TaskEventList> get_task_events_for_user_and_task(
      $grpc.ServiceCall call, $3.TaskEventRequest request);
  $async.Future<$2.Empty> delete_task_event(
      $grpc.ServiceCall call, $1.StringValue request);
  $async.Future<$2.Empty> delete_task_events_for_task(
      $grpc.ServiceCall call, $1.StringValue request);
  $async.Future<$2.Empty> delete_task_events_for_user(
      $grpc.ServiceCall call, $1.StringValue request);
  $async.Future<$2.Empty> delete_task_events_for_user_and_task(
      $grpc.ServiceCall call, $3.TaskEventRequest request);
  $async.Stream<$3.TaskCandidateList> get_candidates_for_task(
      $grpc.ServiceCall call, $1.StringValue request);
  $async.Future<$2.Empty> apply_for_task(
      $grpc.ServiceCall call, $3.ApplyForTaskRequest request);
}
