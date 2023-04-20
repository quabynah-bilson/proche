///
//  Generated code. Do not modify.
//  source: task.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'package:protobuf_google/protobuf_google.dart' as $7;
import 'package:protobuf_google/protobuf_google.dart' as $8;
import 'package:protobuf_google/protobuf_google.dart' as $1;
import 'core_shared.pb.dart' as $2;

class TaskEventRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TaskEventRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'task'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'taskId')
    ..hasRequiredFields = false
  ;

  TaskEventRequest._() : super();
  factory TaskEventRequest({
    $core.String? userId,
    $core.String? taskId,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (taskId != null) {
      _result.taskId = taskId;
    }
    return _result;
  }
  factory TaskEventRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TaskEventRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TaskEventRequest clone() => TaskEventRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TaskEventRequest copyWith(void Function(TaskEventRequest) updates) => super.copyWith((message) => updates(message as TaskEventRequest)) as TaskEventRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TaskEventRequest create() => TaskEventRequest._();
  TaskEventRequest createEmptyInstance() => create();
  static $pb.PbList<TaskEventRequest> createRepeated() => $pb.PbList<TaskEventRequest>();
  @$core.pragma('dart2js:noInline')
  static TaskEventRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TaskEventRequest>(create);
  static TaskEventRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get taskId => $_getSZ(1);
  @$pb.TagNumber(2)
  set taskId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTaskId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTaskId() => clearField(2);
}

class CompleteTaskEventRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CompleteTaskEventRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'task'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'taskId')
    ..aOM<$7.Timestamp>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'endTime', subBuilder: $7.Timestamp.create)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'notes')
    ..hasRequiredFields = false
  ;

  CompleteTaskEventRequest._() : super();
  factory CompleteTaskEventRequest({
    $core.String? taskId,
    $7.Timestamp? endTime,
    $core.String? notes,
  }) {
    final _result = create();
    if (taskId != null) {
      _result.taskId = taskId;
    }
    if (endTime != null) {
      _result.endTime = endTime;
    }
    if (notes != null) {
      _result.notes = notes;
    }
    return _result;
  }
  factory CompleteTaskEventRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CompleteTaskEventRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CompleteTaskEventRequest clone() => CompleteTaskEventRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CompleteTaskEventRequest copyWith(void Function(CompleteTaskEventRequest) updates) => super.copyWith((message) => updates(message as CompleteTaskEventRequest)) as CompleteTaskEventRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CompleteTaskEventRequest create() => CompleteTaskEventRequest._();
  CompleteTaskEventRequest createEmptyInstance() => create();
  static $pb.PbList<CompleteTaskEventRequest> createRepeated() => $pb.PbList<CompleteTaskEventRequest>();
  @$core.pragma('dart2js:noInline')
  static CompleteTaskEventRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CompleteTaskEventRequest>(create);
  static CompleteTaskEventRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get taskId => $_getSZ(0);
  @$pb.TagNumber(1)
  set taskId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTaskId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTaskId() => clearField(1);

  @$pb.TagNumber(2)
  $7.Timestamp get endTime => $_getN(1);
  @$pb.TagNumber(2)
  set endTime($7.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasEndTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearEndTime() => clearField(2);
  @$pb.TagNumber(2)
  $7.Timestamp ensureEndTime() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get notes => $_getSZ(2);
  @$pb.TagNumber(3)
  set notes($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNotes() => $_has(2);
  @$pb.TagNumber(3)
  void clearNotes() => clearField(3);
}

class TaskEventList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TaskEventList', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'task'), createEmptyInstance: create)
    ..pc<TaskEvent>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'taskEvents', $pb.PbFieldType.PM, subBuilder: TaskEvent.create)
    ..hasRequiredFields = false
  ;

  TaskEventList._() : super();
  factory TaskEventList({
    $core.Iterable<TaskEvent>? taskEvents,
  }) {
    final _result = create();
    if (taskEvents != null) {
      _result.taskEvents.addAll(taskEvents);
    }
    return _result;
  }
  factory TaskEventList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TaskEventList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TaskEventList clone() => TaskEventList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TaskEventList copyWith(void Function(TaskEventList) updates) => super.copyWith((message) => updates(message as TaskEventList)) as TaskEventList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TaskEventList create() => TaskEventList._();
  TaskEventList createEmptyInstance() => create();
  static $pb.PbList<TaskEventList> createRepeated() => $pb.PbList<TaskEventList>();
  @$core.pragma('dart2js:noInline')
  static TaskEventList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TaskEventList>(create);
  static TaskEventList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<TaskEvent> get taskEvents => $_getList(0);
}

class CreateTaskEventRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateTaskEventRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'task'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'taskId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOM<$7.Timestamp>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'startTime', subBuilder: $7.Timestamp.create)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'notes')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'vaccineCardUrl')
    ..hasRequiredFields = false
  ;

  CreateTaskEventRequest._() : super();
  factory CreateTaskEventRequest({
    $core.String? taskId,
    $core.String? userId,
    $7.Timestamp? startTime,
    $core.String? notes,
    $core.String? vaccineCardUrl,
  }) {
    final _result = create();
    if (taskId != null) {
      _result.taskId = taskId;
    }
    if (userId != null) {
      _result.userId = userId;
    }
    if (startTime != null) {
      _result.startTime = startTime;
    }
    if (notes != null) {
      _result.notes = notes;
    }
    if (vaccineCardUrl != null) {
      _result.vaccineCardUrl = vaccineCardUrl;
    }
    return _result;
  }
  factory CreateTaskEventRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateTaskEventRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateTaskEventRequest clone() => CreateTaskEventRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateTaskEventRequest copyWith(void Function(CreateTaskEventRequest) updates) => super.copyWith((message) => updates(message as CreateTaskEventRequest)) as CreateTaskEventRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateTaskEventRequest create() => CreateTaskEventRequest._();
  CreateTaskEventRequest createEmptyInstance() => create();
  static $pb.PbList<CreateTaskEventRequest> createRepeated() => $pb.PbList<CreateTaskEventRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateTaskEventRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateTaskEventRequest>(create);
  static CreateTaskEventRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get taskId => $_getSZ(0);
  @$pb.TagNumber(1)
  set taskId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTaskId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTaskId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  @$pb.TagNumber(3)
  $7.Timestamp get startTime => $_getN(2);
  @$pb.TagNumber(3)
  set startTime($7.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasStartTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearStartTime() => clearField(3);
  @$pb.TagNumber(3)
  $7.Timestamp ensureStartTime() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get notes => $_getSZ(3);
  @$pb.TagNumber(4)
  set notes($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasNotes() => $_has(3);
  @$pb.TagNumber(4)
  void clearNotes() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get vaccineCardUrl => $_getSZ(4);
  @$pb.TagNumber(5)
  set vaccineCardUrl($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasVaccineCardUrl() => $_has(4);
  @$pb.TagNumber(5)
  void clearVaccineCardUrl() => clearField(5);
}

class CreateTaskRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateTaskRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'task'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aOM<$7.Timestamp>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dueDate', subBuilder: $7.Timestamp.create)
    ..aOM<$8.Duration>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'duration', subBuilder: $8.Duration.create)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..a<$core.double>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'chargePerHour', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  CreateTaskRequest._() : super();
  factory CreateTaskRequest({
    $core.String? title,
    $core.String? description,
    $7.Timestamp? dueDate,
    $8.Duration? duration,
    $core.String? userId,
    $core.double? chargePerHour,
  }) {
    final _result = create();
    if (title != null) {
      _result.title = title;
    }
    if (description != null) {
      _result.description = description;
    }
    if (dueDate != null) {
      _result.dueDate = dueDate;
    }
    if (duration != null) {
      _result.duration = duration;
    }
    if (userId != null) {
      _result.userId = userId;
    }
    if (chargePerHour != null) {
      _result.chargePerHour = chargePerHour;
    }
    return _result;
  }
  factory CreateTaskRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateTaskRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateTaskRequest clone() => CreateTaskRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateTaskRequest copyWith(void Function(CreateTaskRequest) updates) => super.copyWith((message) => updates(message as CreateTaskRequest)) as CreateTaskRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateTaskRequest create() => CreateTaskRequest._();
  CreateTaskRequest createEmptyInstance() => create();
  static $pb.PbList<CreateTaskRequest> createRepeated() => $pb.PbList<CreateTaskRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateTaskRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateTaskRequest>(create);
  static CreateTaskRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(2)
  set description($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => clearField(2);

  @$pb.TagNumber(3)
  $7.Timestamp get dueDate => $_getN(2);
  @$pb.TagNumber(3)
  set dueDate($7.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasDueDate() => $_has(2);
  @$pb.TagNumber(3)
  void clearDueDate() => clearField(3);
  @$pb.TagNumber(3)
  $7.Timestamp ensureDueDate() => $_ensure(2);

  @$pb.TagNumber(4)
  $8.Duration get duration => $_getN(3);
  @$pb.TagNumber(4)
  set duration($8.Duration v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasDuration() => $_has(3);
  @$pb.TagNumber(4)
  void clearDuration() => clearField(4);
  @$pb.TagNumber(4)
  $8.Duration ensureDuration() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.String get userId => $_getSZ(4);
  @$pb.TagNumber(5)
  set userId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasUserId() => $_has(4);
  @$pb.TagNumber(5)
  void clearUserId() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get chargePerHour => $_getN(5);
  @$pb.TagNumber(6)
  set chargePerHour($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasChargePerHour() => $_has(5);
  @$pb.TagNumber(6)
  void clearChargePerHour() => clearField(6);
}

class UpdateTaskRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateTaskRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'task'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aOM<$7.Timestamp>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dueDate', subBuilder: $7.Timestamp.create)
    ..aOM<$8.Duration>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'duration', subBuilder: $8.Duration.create)
    ..aOM<$1.BoolValue>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'completed', subBuilder: $1.BoolValue.create)
    ..hasRequiredFields = false
  ;

  UpdateTaskRequest._() : super();
  factory UpdateTaskRequest({
    $core.String? id,
    $core.String? title,
    $core.String? description,
    $7.Timestamp? dueDate,
    $8.Duration? duration,
    $1.BoolValue? completed,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (title != null) {
      _result.title = title;
    }
    if (description != null) {
      _result.description = description;
    }
    if (dueDate != null) {
      _result.dueDate = dueDate;
    }
    if (duration != null) {
      _result.duration = duration;
    }
    if (completed != null) {
      _result.completed = completed;
    }
    return _result;
  }
  factory UpdateTaskRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateTaskRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateTaskRequest clone() => UpdateTaskRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateTaskRequest copyWith(void Function(UpdateTaskRequest) updates) => super.copyWith((message) => updates(message as UpdateTaskRequest)) as UpdateTaskRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateTaskRequest create() => UpdateTaskRequest._();
  UpdateTaskRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateTaskRequest> createRepeated() => $pb.PbList<UpdateTaskRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateTaskRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateTaskRequest>(create);
  static UpdateTaskRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);

  @$pb.TagNumber(4)
  $7.Timestamp get dueDate => $_getN(3);
  @$pb.TagNumber(4)
  set dueDate($7.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasDueDate() => $_has(3);
  @$pb.TagNumber(4)
  void clearDueDate() => clearField(4);
  @$pb.TagNumber(4)
  $7.Timestamp ensureDueDate() => $_ensure(3);

  @$pb.TagNumber(5)
  $8.Duration get duration => $_getN(4);
  @$pb.TagNumber(5)
  set duration($8.Duration v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasDuration() => $_has(4);
  @$pb.TagNumber(5)
  void clearDuration() => clearField(5);
  @$pb.TagNumber(5)
  $8.Duration ensureDuration() => $_ensure(4);

  @$pb.TagNumber(6)
  $1.BoolValue get completed => $_getN(5);
  @$pb.TagNumber(6)
  set completed($1.BoolValue v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasCompleted() => $_has(5);
  @$pb.TagNumber(6)
  void clearCompleted() => clearField(6);
  @$pb.TagNumber(6)
  $1.BoolValue ensureCompleted() => $_ensure(5);
}

class TaskList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TaskList', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'task'), createEmptyInstance: create)
    ..pc<Task>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tasks', $pb.PbFieldType.PM, subBuilder: Task.create)
    ..hasRequiredFields = false
  ;

  TaskList._() : super();
  factory TaskList({
    $core.Iterable<Task>? tasks,
  }) {
    final _result = create();
    if (tasks != null) {
      _result.tasks.addAll(tasks);
    }
    return _result;
  }
  factory TaskList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TaskList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TaskList clone() => TaskList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TaskList copyWith(void Function(TaskList) updates) => super.copyWith((message) => updates(message as TaskList)) as TaskList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TaskList create() => TaskList._();
  TaskList createEmptyInstance() => create();
  static $pb.PbList<TaskList> createRepeated() => $pb.PbList<TaskList>();
  @$core.pragma('dart2js:noInline')
  static TaskList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TaskList>(create);
  static TaskList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Task> get tasks => $_getList(0);
}

class Task extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Task', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'task'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aOM<$7.Timestamp>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdAt', subBuilder: $7.Timestamp.create)
    ..aOM<$7.Timestamp>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updatedAt', subBuilder: $7.Timestamp.create)
    ..aOM<$7.Timestamp>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dueDate', subBuilder: $7.Timestamp.create)
    ..aOM<$8.Duration>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'duration', subBuilder: $8.Duration.create)
    ..aOB(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'completed')
    ..a<$core.double>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'chargePerHour', $pb.PbFieldType.OD)
    ..aOS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOM<$2.CommonAddress>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'address', subBuilder: $2.CommonAddress.create)
    ..hasRequiredFields = false
  ;

  Task._() : super();
  factory Task({
    $core.String? id,
    $core.String? title,
    $core.String? description,
    $7.Timestamp? createdAt,
    $7.Timestamp? updatedAt,
    $7.Timestamp? dueDate,
    $8.Duration? duration,
    $core.bool? completed,
    $core.double? chargePerHour,
    $core.String? userId,
    $2.CommonAddress? address,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (title != null) {
      _result.title = title;
    }
    if (description != null) {
      _result.description = description;
    }
    if (createdAt != null) {
      _result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      _result.updatedAt = updatedAt;
    }
    if (dueDate != null) {
      _result.dueDate = dueDate;
    }
    if (duration != null) {
      _result.duration = duration;
    }
    if (completed != null) {
      _result.completed = completed;
    }
    if (chargePerHour != null) {
      _result.chargePerHour = chargePerHour;
    }
    if (userId != null) {
      _result.userId = userId;
    }
    if (address != null) {
      _result.address = address;
    }
    return _result;
  }
  factory Task.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Task.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Task clone() => Task()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Task copyWith(void Function(Task) updates) => super.copyWith((message) => updates(message as Task)) as Task; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Task create() => Task._();
  Task createEmptyInstance() => create();
  static $pb.PbList<Task> createRepeated() => $pb.PbList<Task>();
  @$core.pragma('dart2js:noInline')
  static Task getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Task>(create);
  static Task? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);

  @$pb.TagNumber(4)
  $7.Timestamp get createdAt => $_getN(3);
  @$pb.TagNumber(4)
  set createdAt($7.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasCreatedAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearCreatedAt() => clearField(4);
  @$pb.TagNumber(4)
  $7.Timestamp ensureCreatedAt() => $_ensure(3);

  @$pb.TagNumber(5)
  $7.Timestamp get updatedAt => $_getN(4);
  @$pb.TagNumber(5)
  set updatedAt($7.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasUpdatedAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearUpdatedAt() => clearField(5);
  @$pb.TagNumber(5)
  $7.Timestamp ensureUpdatedAt() => $_ensure(4);

  @$pb.TagNumber(6)
  $7.Timestamp get dueDate => $_getN(5);
  @$pb.TagNumber(6)
  set dueDate($7.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasDueDate() => $_has(5);
  @$pb.TagNumber(6)
  void clearDueDate() => clearField(6);
  @$pb.TagNumber(6)
  $7.Timestamp ensureDueDate() => $_ensure(5);

  @$pb.TagNumber(7)
  $8.Duration get duration => $_getN(6);
  @$pb.TagNumber(7)
  set duration($8.Duration v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasDuration() => $_has(6);
  @$pb.TagNumber(7)
  void clearDuration() => clearField(7);
  @$pb.TagNumber(7)
  $8.Duration ensureDuration() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.bool get completed => $_getBF(7);
  @$pb.TagNumber(8)
  set completed($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasCompleted() => $_has(7);
  @$pb.TagNumber(8)
  void clearCompleted() => clearField(8);

  @$pb.TagNumber(9)
  $core.double get chargePerHour => $_getN(8);
  @$pb.TagNumber(9)
  set chargePerHour($core.double v) { $_setDouble(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasChargePerHour() => $_has(8);
  @$pb.TagNumber(9)
  void clearChargePerHour() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get userId => $_getSZ(9);
  @$pb.TagNumber(10)
  set userId($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasUserId() => $_has(9);
  @$pb.TagNumber(10)
  void clearUserId() => clearField(10);

  @$pb.TagNumber(11)
  $2.CommonAddress get address => $_getN(10);
  @$pb.TagNumber(11)
  set address($2.CommonAddress v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasAddress() => $_has(10);
  @$pb.TagNumber(11)
  void clearAddress() => clearField(11);
  @$pb.TagNumber(11)
  $2.CommonAddress ensureAddress() => $_ensure(10);
}

class TaskEvent extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TaskEvent', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'task'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'taskId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOM<$7.Timestamp>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'startTime', subBuilder: $7.Timestamp.create)
    ..aOM<$7.Timestamp>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'endTime', subBuilder: $7.Timestamp.create)
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'notes')
    ..hasRequiredFields = false
  ;

  TaskEvent._() : super();
  factory TaskEvent({
    $core.String? id,
    $core.String? taskId,
    $core.String? userId,
    $7.Timestamp? startTime,
    $7.Timestamp? endTime,
    $core.String? notes,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (taskId != null) {
      _result.taskId = taskId;
    }
    if (userId != null) {
      _result.userId = userId;
    }
    if (startTime != null) {
      _result.startTime = startTime;
    }
    if (endTime != null) {
      _result.endTime = endTime;
    }
    if (notes != null) {
      _result.notes = notes;
    }
    return _result;
  }
  factory TaskEvent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TaskEvent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TaskEvent clone() => TaskEvent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TaskEvent copyWith(void Function(TaskEvent) updates) => super.copyWith((message) => updates(message as TaskEvent)) as TaskEvent; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TaskEvent create() => TaskEvent._();
  TaskEvent createEmptyInstance() => create();
  static $pb.PbList<TaskEvent> createRepeated() => $pb.PbList<TaskEvent>();
  @$core.pragma('dart2js:noInline')
  static TaskEvent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TaskEvent>(create);
  static TaskEvent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get taskId => $_getSZ(1);
  @$pb.TagNumber(2)
  set taskId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTaskId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTaskId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get userId => $_getSZ(2);
  @$pb.TagNumber(3)
  set userId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUserId() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserId() => clearField(3);

  @$pb.TagNumber(4)
  $7.Timestamp get startTime => $_getN(3);
  @$pb.TagNumber(4)
  set startTime($7.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasStartTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearStartTime() => clearField(4);
  @$pb.TagNumber(4)
  $7.Timestamp ensureStartTime() => $_ensure(3);

  @$pb.TagNumber(5)
  $7.Timestamp get endTime => $_getN(4);
  @$pb.TagNumber(5)
  set endTime($7.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasEndTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearEndTime() => clearField(5);
  @$pb.TagNumber(5)
  $7.Timestamp ensureEndTime() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.String get notes => $_getSZ(5);
  @$pb.TagNumber(6)
  set notes($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasNotes() => $_has(5);
  @$pb.TagNumber(6)
  void clearNotes() => clearField(6);
}

