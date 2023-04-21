///
//  Generated code. Do not modify.
//  source: event.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'package:protobuf_google/protobuf_google.dart' as $7;
import 'package:protobuf_google/protobuf_google.dart' as $8;

import 'event.pbenum.dart';

export 'event.pbenum.dart';

class CreateEventRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateEventRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'event'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'location')
    ..a<$core.double>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'latitude', $pb.PbFieldType.OD)
    ..a<$core.double>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'longitude', $pb.PbFieldType.OD)
    ..aOM<$7.Timestamp>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'startTime', subBuilder: $7.Timestamp.create)
    ..aOM<$7.Timestamp>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'endTime', subBuilder: $7.Timestamp.create)
    ..aOM<$8.Duration>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'duration', subBuilder: $8.Duration.create)
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..pPS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'photos')
    ..aOS(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'video')
    ..hasRequiredFields = false
  ;

  CreateEventRequest._() : super();
  factory CreateEventRequest({
    $core.String? name,
    $core.String? description,
    $core.String? location,
    $core.double? latitude,
    $core.double? longitude,
    $7.Timestamp? startTime,
    $7.Timestamp? endTime,
    $8.Duration? duration,
    $core.String? userId,
    $core.Iterable<$core.String>? photos,
    $core.String? video,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (description != null) {
      _result.description = description;
    }
    if (location != null) {
      _result.location = location;
    }
    if (latitude != null) {
      _result.latitude = latitude;
    }
    if (longitude != null) {
      _result.longitude = longitude;
    }
    if (startTime != null) {
      _result.startTime = startTime;
    }
    if (endTime != null) {
      _result.endTime = endTime;
    }
    if (duration != null) {
      _result.duration = duration;
    }
    if (userId != null) {
      _result.userId = userId;
    }
    if (photos != null) {
      _result.photos.addAll(photos);
    }
    if (video != null) {
      _result.video = video;
    }
    return _result;
  }
  factory CreateEventRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateEventRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateEventRequest clone() => CreateEventRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateEventRequest copyWith(void Function(CreateEventRequest) updates) => super.copyWith((message) => updates(message as CreateEventRequest)) as CreateEventRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateEventRequest create() => CreateEventRequest._();
  CreateEventRequest createEmptyInstance() => create();
  static $pb.PbList<CreateEventRequest> createRepeated() => $pb.PbList<CreateEventRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateEventRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateEventRequest>(create);
  static CreateEventRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(2)
  set description($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get location => $_getSZ(2);
  @$pb.TagNumber(3)
  set location($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLocation() => $_has(2);
  @$pb.TagNumber(3)
  void clearLocation() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get latitude => $_getN(3);
  @$pb.TagNumber(4)
  set latitude($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLatitude() => $_has(3);
  @$pb.TagNumber(4)
  void clearLatitude() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get longitude => $_getN(4);
  @$pb.TagNumber(5)
  set longitude($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasLongitude() => $_has(4);
  @$pb.TagNumber(5)
  void clearLongitude() => clearField(5);

  @$pb.TagNumber(6)
  $7.Timestamp get startTime => $_getN(5);
  @$pb.TagNumber(6)
  set startTime($7.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasStartTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearStartTime() => clearField(6);
  @$pb.TagNumber(6)
  $7.Timestamp ensureStartTime() => $_ensure(5);

  @$pb.TagNumber(7)
  $7.Timestamp get endTime => $_getN(6);
  @$pb.TagNumber(7)
  set endTime($7.Timestamp v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasEndTime() => $_has(6);
  @$pb.TagNumber(7)
  void clearEndTime() => clearField(7);
  @$pb.TagNumber(7)
  $7.Timestamp ensureEndTime() => $_ensure(6);

  @$pb.TagNumber(8)
  $8.Duration get duration => $_getN(7);
  @$pb.TagNumber(8)
  set duration($8.Duration v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasDuration() => $_has(7);
  @$pb.TagNumber(8)
  void clearDuration() => clearField(8);
  @$pb.TagNumber(8)
  $8.Duration ensureDuration() => $_ensure(7);

  @$pb.TagNumber(9)
  $core.String get userId => $_getSZ(8);
  @$pb.TagNumber(9)
  set userId($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasUserId() => $_has(8);
  @$pb.TagNumber(9)
  void clearUserId() => clearField(9);

  @$pb.TagNumber(10)
  $core.List<$core.String> get photos => $_getList(9);

  @$pb.TagNumber(11)
  $core.String get video => $_getSZ(10);
  @$pb.TagNumber(11)
  set video($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasVideo() => $_has(10);
  @$pb.TagNumber(11)
  void clearVideo() => clearField(11);
}

class ProcheEvent extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ProcheEvent', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'event'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'location')
    ..a<$core.double>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'latitude', $pb.PbFieldType.OD)
    ..a<$core.double>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'longitude', $pb.PbFieldType.OD)
    ..aOM<$7.Timestamp>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'startTime', subBuilder: $7.Timestamp.create)
    ..aOM<$7.Timestamp>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'endTime', subBuilder: $7.Timestamp.create)
    ..aOM<$8.Duration>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'duration', subBuilder: $8.Duration.create)
    ..aOS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..e<ProcheEventStatus>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: ProcheEventStatus.ACTIVE, valueOf: ProcheEventStatus.valueOf, enumValues: ProcheEventStatus.values)
    ..pPS(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'photos')
    ..aOS(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'video')
    ..hasRequiredFields = false
  ;

  ProcheEvent._() : super();
  factory ProcheEvent({
    $core.String? id,
    $core.String? name,
    $core.String? description,
    $core.String? location,
    $core.double? latitude,
    $core.double? longitude,
    $7.Timestamp? startTime,
    $7.Timestamp? endTime,
    $8.Duration? duration,
    $core.String? userId,
    ProcheEventStatus? status,
    $core.Iterable<$core.String>? photos,
    $core.String? video,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (description != null) {
      _result.description = description;
    }
    if (location != null) {
      _result.location = location;
    }
    if (latitude != null) {
      _result.latitude = latitude;
    }
    if (longitude != null) {
      _result.longitude = longitude;
    }
    if (startTime != null) {
      _result.startTime = startTime;
    }
    if (endTime != null) {
      _result.endTime = endTime;
    }
    if (duration != null) {
      _result.duration = duration;
    }
    if (userId != null) {
      _result.userId = userId;
    }
    if (status != null) {
      _result.status = status;
    }
    if (photos != null) {
      _result.photos.addAll(photos);
    }
    if (video != null) {
      _result.video = video;
    }
    return _result;
  }
  factory ProcheEvent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ProcheEvent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ProcheEvent clone() => ProcheEvent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ProcheEvent copyWith(void Function(ProcheEvent) updates) => super.copyWith((message) => updates(message as ProcheEvent)) as ProcheEvent; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ProcheEvent create() => ProcheEvent._();
  ProcheEvent createEmptyInstance() => create();
  static $pb.PbList<ProcheEvent> createRepeated() => $pb.PbList<ProcheEvent>();
  @$core.pragma('dart2js:noInline')
  static ProcheEvent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ProcheEvent>(create);
  static ProcheEvent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get location => $_getSZ(3);
  @$pb.TagNumber(4)
  set location($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLocation() => $_has(3);
  @$pb.TagNumber(4)
  void clearLocation() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get latitude => $_getN(4);
  @$pb.TagNumber(5)
  set latitude($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasLatitude() => $_has(4);
  @$pb.TagNumber(5)
  void clearLatitude() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get longitude => $_getN(5);
  @$pb.TagNumber(6)
  set longitude($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasLongitude() => $_has(5);
  @$pb.TagNumber(6)
  void clearLongitude() => clearField(6);

  @$pb.TagNumber(7)
  $7.Timestamp get startTime => $_getN(6);
  @$pb.TagNumber(7)
  set startTime($7.Timestamp v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasStartTime() => $_has(6);
  @$pb.TagNumber(7)
  void clearStartTime() => clearField(7);
  @$pb.TagNumber(7)
  $7.Timestamp ensureStartTime() => $_ensure(6);

  @$pb.TagNumber(8)
  $7.Timestamp get endTime => $_getN(7);
  @$pb.TagNumber(8)
  set endTime($7.Timestamp v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasEndTime() => $_has(7);
  @$pb.TagNumber(8)
  void clearEndTime() => clearField(8);
  @$pb.TagNumber(8)
  $7.Timestamp ensureEndTime() => $_ensure(7);

  @$pb.TagNumber(9)
  $8.Duration get duration => $_getN(8);
  @$pb.TagNumber(9)
  set duration($8.Duration v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasDuration() => $_has(8);
  @$pb.TagNumber(9)
  void clearDuration() => clearField(9);
  @$pb.TagNumber(9)
  $8.Duration ensureDuration() => $_ensure(8);

  @$pb.TagNumber(10)
  $core.String get userId => $_getSZ(9);
  @$pb.TagNumber(10)
  set userId($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasUserId() => $_has(9);
  @$pb.TagNumber(10)
  void clearUserId() => clearField(10);

  @$pb.TagNumber(11)
  ProcheEventStatus get status => $_getN(10);
  @$pb.TagNumber(11)
  set status(ProcheEventStatus v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasStatus() => $_has(10);
  @$pb.TagNumber(11)
  void clearStatus() => clearField(11);

  @$pb.TagNumber(12)
  $core.List<$core.String> get photos => $_getList(11);

  @$pb.TagNumber(13)
  $core.String get video => $_getSZ(12);
  @$pb.TagNumber(13)
  set video($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasVideo() => $_has(12);
  @$pb.TagNumber(13)
  void clearVideo() => clearField(13);
}

class ProcheEventList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ProcheEventList', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'event'), createEmptyInstance: create)
    ..pc<ProcheEvent>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'events', $pb.PbFieldType.PM, subBuilder: ProcheEvent.create)
    ..hasRequiredFields = false
  ;

  ProcheEventList._() : super();
  factory ProcheEventList({
    $core.Iterable<ProcheEvent>? events,
  }) {
    final _result = create();
    if (events != null) {
      _result.events.addAll(events);
    }
    return _result;
  }
  factory ProcheEventList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ProcheEventList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ProcheEventList clone() => ProcheEventList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ProcheEventList copyWith(void Function(ProcheEventList) updates) => super.copyWith((message) => updates(message as ProcheEventList)) as ProcheEventList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ProcheEventList create() => ProcheEventList._();
  ProcheEventList createEmptyInstance() => create();
  static $pb.PbList<ProcheEventList> createRepeated() => $pb.PbList<ProcheEventList>();
  @$core.pragma('dart2js:noInline')
  static ProcheEventList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ProcheEventList>(create);
  static ProcheEventList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ProcheEvent> get events => $_getList(0);
}

