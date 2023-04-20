///
//  Generated code. Do not modify.
//  source: trip.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'core_shared.pb.dart' as $2;
import 'package:protobuf_google/protobuf_google.dart' as $7;
import 'package:protobuf_google/protobuf_google.dart' as $8;

import 'trip.pbenum.dart';

export 'trip.pbenum.dart';

class TripList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TripList', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'trip'), createEmptyInstance: create)
    ..pc<Trip>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'trips', $pb.PbFieldType.PM, subBuilder: Trip.create)
    ..hasRequiredFields = false
  ;

  TripList._() : super();
  factory TripList({
    $core.Iterable<Trip>? trips,
  }) {
    final _result = create();
    if (trips != null) {
      _result.trips.addAll(trips);
    }
    return _result;
  }
  factory TripList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TripList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TripList clone() => TripList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TripList copyWith(void Function(TripList) updates) => super.copyWith((message) => updates(message as TripList)) as TripList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TripList create() => TripList._();
  TripList createEmptyInstance() => create();
  static $pb.PbList<TripList> createRepeated() => $pb.PbList<TripList>();
  @$core.pragma('dart2js:noInline')
  static TripList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TripList>(create);
  static TripList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Trip> get trips => $_getList(0);
}

class TripEventList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TripEventList', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'trip'), createEmptyInstance: create)
    ..pc<TripEvent>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tripEvents', $pb.PbFieldType.PM, subBuilder: TripEvent.create)
    ..hasRequiredFields = false
  ;

  TripEventList._() : super();
  factory TripEventList({
    $core.Iterable<TripEvent>? tripEvents,
  }) {
    final _result = create();
    if (tripEvents != null) {
      _result.tripEvents.addAll(tripEvents);
    }
    return _result;
  }
  factory TripEventList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TripEventList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TripEventList clone() => TripEventList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TripEventList copyWith(void Function(TripEventList) updates) => super.copyWith((message) => updates(message as TripEventList)) as TripEventList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TripEventList create() => TripEventList._();
  TripEventList createEmptyInstance() => create();
  static $pb.PbList<TripEventList> createRepeated() => $pb.PbList<TripEventList>();
  @$core.pragma('dart2js:noInline')
  static TripEventList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TripEventList>(create);
  static TripEventList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<TripEvent> get tripEvents => $_getList(0);
}

class BookTripRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'BookTripRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'trip'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOM<$2.CommonAddress>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'origin', subBuilder: $2.CommonAddress.create)
    ..aOM<$2.CommonAddress>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'destination', subBuilder: $2.CommonAddress.create)
    ..aOM<$7.Timestamp>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'departureTime', subBuilder: $7.Timestamp.create)
    ..aOM<$8.Duration>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'duration', subBuilder: $8.Duration.create)
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'vaccineCardUrl')
    ..hasRequiredFields = false
  ;

  BookTripRequest._() : super();
  factory BookTripRequest({
    $core.String? userId,
    $2.CommonAddress? origin,
    $2.CommonAddress? destination,
    $7.Timestamp? departureTime,
    $8.Duration? duration,
    $core.String? vaccineCardUrl,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (origin != null) {
      _result.origin = origin;
    }
    if (destination != null) {
      _result.destination = destination;
    }
    if (departureTime != null) {
      _result.departureTime = departureTime;
    }
    if (duration != null) {
      _result.duration = duration;
    }
    if (vaccineCardUrl != null) {
      _result.vaccineCardUrl = vaccineCardUrl;
    }
    return _result;
  }
  factory BookTripRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BookTripRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BookTripRequest clone() => BookTripRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BookTripRequest copyWith(void Function(BookTripRequest) updates) => super.copyWith((message) => updates(message as BookTripRequest)) as BookTripRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BookTripRequest create() => BookTripRequest._();
  BookTripRequest createEmptyInstance() => create();
  static $pb.PbList<BookTripRequest> createRepeated() => $pb.PbList<BookTripRequest>();
  @$core.pragma('dart2js:noInline')
  static BookTripRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BookTripRequest>(create);
  static BookTripRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $2.CommonAddress get origin => $_getN(1);
  @$pb.TagNumber(2)
  set origin($2.CommonAddress v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasOrigin() => $_has(1);
  @$pb.TagNumber(2)
  void clearOrigin() => clearField(2);
  @$pb.TagNumber(2)
  $2.CommonAddress ensureOrigin() => $_ensure(1);

  @$pb.TagNumber(3)
  $2.CommonAddress get destination => $_getN(2);
  @$pb.TagNumber(3)
  set destination($2.CommonAddress v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasDestination() => $_has(2);
  @$pb.TagNumber(3)
  void clearDestination() => clearField(3);
  @$pb.TagNumber(3)
  $2.CommonAddress ensureDestination() => $_ensure(2);

  @$pb.TagNumber(4)
  $7.Timestamp get departureTime => $_getN(3);
  @$pb.TagNumber(4)
  set departureTime($7.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasDepartureTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearDepartureTime() => clearField(4);
  @$pb.TagNumber(4)
  $7.Timestamp ensureDepartureTime() => $_ensure(3);

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
  $core.String get vaccineCardUrl => $_getSZ(5);
  @$pb.TagNumber(6)
  set vaccineCardUrl($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasVaccineCardUrl() => $_has(5);
  @$pb.TagNumber(6)
  void clearVaccineCardUrl() => clearField(6);
}

class Trip extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Trip', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'trip'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOM<$2.CommonAddress>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'origin', subBuilder: $2.CommonAddress.create)
    ..aOM<$2.CommonAddress>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'destination', subBuilder: $2.CommonAddress.create)
    ..aOM<$7.Timestamp>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'departureTime', subBuilder: $7.Timestamp.create)
    ..aOM<$8.Duration>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'duration', subBuilder: $8.Duration.create)
    ..aOM<$7.Timestamp>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdAt', subBuilder: $7.Timestamp.create)
    ..aOM<$7.Timestamp>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updatedAt', subBuilder: $7.Timestamp.create)
    ..hasRequiredFields = false
  ;

  Trip._() : super();
  factory Trip({
    $core.String? id,
    $core.String? userId,
    $2.CommonAddress? origin,
    $2.CommonAddress? destination,
    $7.Timestamp? departureTime,
    $8.Duration? duration,
    $7.Timestamp? createdAt,
    $7.Timestamp? updatedAt,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (userId != null) {
      _result.userId = userId;
    }
    if (origin != null) {
      _result.origin = origin;
    }
    if (destination != null) {
      _result.destination = destination;
    }
    if (departureTime != null) {
      _result.departureTime = departureTime;
    }
    if (duration != null) {
      _result.duration = duration;
    }
    if (createdAt != null) {
      _result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      _result.updatedAt = updatedAt;
    }
    return _result;
  }
  factory Trip.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Trip.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Trip clone() => Trip()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Trip copyWith(void Function(Trip) updates) => super.copyWith((message) => updates(message as Trip)) as Trip; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Trip create() => Trip._();
  Trip createEmptyInstance() => create();
  static $pb.PbList<Trip> createRepeated() => $pb.PbList<Trip>();
  @$core.pragma('dart2js:noInline')
  static Trip getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Trip>(create);
  static Trip? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  @$pb.TagNumber(3)
  $2.CommonAddress get origin => $_getN(2);
  @$pb.TagNumber(3)
  set origin($2.CommonAddress v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasOrigin() => $_has(2);
  @$pb.TagNumber(3)
  void clearOrigin() => clearField(3);
  @$pb.TagNumber(3)
  $2.CommonAddress ensureOrigin() => $_ensure(2);

  @$pb.TagNumber(4)
  $2.CommonAddress get destination => $_getN(3);
  @$pb.TagNumber(4)
  set destination($2.CommonAddress v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasDestination() => $_has(3);
  @$pb.TagNumber(4)
  void clearDestination() => clearField(4);
  @$pb.TagNumber(4)
  $2.CommonAddress ensureDestination() => $_ensure(3);

  @$pb.TagNumber(5)
  $7.Timestamp get departureTime => $_getN(4);
  @$pb.TagNumber(5)
  set departureTime($7.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasDepartureTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearDepartureTime() => clearField(5);
  @$pb.TagNumber(5)
  $7.Timestamp ensureDepartureTime() => $_ensure(4);

  @$pb.TagNumber(6)
  $8.Duration get duration => $_getN(5);
  @$pb.TagNumber(6)
  set duration($8.Duration v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasDuration() => $_has(5);
  @$pb.TagNumber(6)
  void clearDuration() => clearField(6);
  @$pb.TagNumber(6)
  $8.Duration ensureDuration() => $_ensure(5);

  @$pb.TagNumber(7)
  $7.Timestamp get createdAt => $_getN(6);
  @$pb.TagNumber(7)
  set createdAt($7.Timestamp v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasCreatedAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearCreatedAt() => clearField(7);
  @$pb.TagNumber(7)
  $7.Timestamp ensureCreatedAt() => $_ensure(6);

  @$pb.TagNumber(8)
  $7.Timestamp get updatedAt => $_getN(7);
  @$pb.TagNumber(8)
  set updatedAt($7.Timestamp v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasUpdatedAt() => $_has(7);
  @$pb.TagNumber(8)
  void clearUpdatedAt() => clearField(8);
  @$pb.TagNumber(8)
  $7.Timestamp ensureUpdatedAt() => $_ensure(7);
}

class TripEvent extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TripEvent', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'trip'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tripId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOM<$2.CommonAddress>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'origin', subBuilder: $2.CommonAddress.create)
    ..aOM<$2.CommonAddress>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'destination', subBuilder: $2.CommonAddress.create)
    ..aOM<$7.Timestamp>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'departureTime', subBuilder: $7.Timestamp.create)
    ..aOM<$8.Duration>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'duration', subBuilder: $8.Duration.create)
    ..aOM<$7.Timestamp>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdAt', subBuilder: $7.Timestamp.create)
    ..aOM<$7.Timestamp>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updatedAt', subBuilder: $7.Timestamp.create)
    ..aOM<$7.Timestamp>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'eventTime', subBuilder: $7.Timestamp.create)
    ..e<TripEventType>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'eventType', $pb.PbFieldType.OE, defaultOrMaker: TripEventType.EVENT_UNKNOWN, valueOf: TripEventType.valueOf, enumValues: TripEventType.values)
    ..hasRequiredFields = false
  ;

  TripEvent._() : super();
  factory TripEvent({
    $core.String? id,
    $core.String? tripId,
    $core.String? userId,
    $2.CommonAddress? origin,
    $2.CommonAddress? destination,
    $7.Timestamp? departureTime,
    $8.Duration? duration,
    $7.Timestamp? createdAt,
    $7.Timestamp? updatedAt,
    $7.Timestamp? eventTime,
    TripEventType? eventType,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (tripId != null) {
      _result.tripId = tripId;
    }
    if (userId != null) {
      _result.userId = userId;
    }
    if (origin != null) {
      _result.origin = origin;
    }
    if (destination != null) {
      _result.destination = destination;
    }
    if (departureTime != null) {
      _result.departureTime = departureTime;
    }
    if (duration != null) {
      _result.duration = duration;
    }
    if (createdAt != null) {
      _result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      _result.updatedAt = updatedAt;
    }
    if (eventTime != null) {
      _result.eventTime = eventTime;
    }
    if (eventType != null) {
      _result.eventType = eventType;
    }
    return _result;
  }
  factory TripEvent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TripEvent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TripEvent clone() => TripEvent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TripEvent copyWith(void Function(TripEvent) updates) => super.copyWith((message) => updates(message as TripEvent)) as TripEvent; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TripEvent create() => TripEvent._();
  TripEvent createEmptyInstance() => create();
  static $pb.PbList<TripEvent> createRepeated() => $pb.PbList<TripEvent>();
  @$core.pragma('dart2js:noInline')
  static TripEvent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TripEvent>(create);
  static TripEvent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get tripId => $_getSZ(1);
  @$pb.TagNumber(2)
  set tripId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTripId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTripId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get userId => $_getSZ(2);
  @$pb.TagNumber(3)
  set userId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUserId() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserId() => clearField(3);

  @$pb.TagNumber(4)
  $2.CommonAddress get origin => $_getN(3);
  @$pb.TagNumber(4)
  set origin($2.CommonAddress v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasOrigin() => $_has(3);
  @$pb.TagNumber(4)
  void clearOrigin() => clearField(4);
  @$pb.TagNumber(4)
  $2.CommonAddress ensureOrigin() => $_ensure(3);

  @$pb.TagNumber(5)
  $2.CommonAddress get destination => $_getN(4);
  @$pb.TagNumber(5)
  set destination($2.CommonAddress v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasDestination() => $_has(4);
  @$pb.TagNumber(5)
  void clearDestination() => clearField(5);
  @$pb.TagNumber(5)
  $2.CommonAddress ensureDestination() => $_ensure(4);

  @$pb.TagNumber(6)
  $7.Timestamp get departureTime => $_getN(5);
  @$pb.TagNumber(6)
  set departureTime($7.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasDepartureTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearDepartureTime() => clearField(6);
  @$pb.TagNumber(6)
  $7.Timestamp ensureDepartureTime() => $_ensure(5);

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
  $7.Timestamp get createdAt => $_getN(7);
  @$pb.TagNumber(8)
  set createdAt($7.Timestamp v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasCreatedAt() => $_has(7);
  @$pb.TagNumber(8)
  void clearCreatedAt() => clearField(8);
  @$pb.TagNumber(8)
  $7.Timestamp ensureCreatedAt() => $_ensure(7);

  @$pb.TagNumber(9)
  $7.Timestamp get updatedAt => $_getN(8);
  @$pb.TagNumber(9)
  set updatedAt($7.Timestamp v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasUpdatedAt() => $_has(8);
  @$pb.TagNumber(9)
  void clearUpdatedAt() => clearField(9);
  @$pb.TagNumber(9)
  $7.Timestamp ensureUpdatedAt() => $_ensure(8);

  @$pb.TagNumber(10)
  $7.Timestamp get eventTime => $_getN(9);
  @$pb.TagNumber(10)
  set eventTime($7.Timestamp v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasEventTime() => $_has(9);
  @$pb.TagNumber(10)
  void clearEventTime() => clearField(10);
  @$pb.TagNumber(10)
  $7.Timestamp ensureEventTime() => $_ensure(9);

  @$pb.TagNumber(11)
  TripEventType get eventType => $_getN(10);
  @$pb.TagNumber(11)
  set eventType(TripEventType v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasEventType() => $_has(10);
  @$pb.TagNumber(11)
  void clearEventType() => clearField(11);
}

class TripEventRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TripEventRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'trip'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tripId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOM<$2.CommonAddress>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'origin', subBuilder: $2.CommonAddress.create)
    ..aOM<$2.CommonAddress>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'destination', subBuilder: $2.CommonAddress.create)
    ..aOM<$7.Timestamp>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'departureTime', subBuilder: $7.Timestamp.create)
    ..aOM<$8.Duration>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'duration', subBuilder: $8.Duration.create)
    ..aOM<$7.Timestamp>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'eventTime', subBuilder: $7.Timestamp.create)
    ..e<TripEventType>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'eventType', $pb.PbFieldType.OE, defaultOrMaker: TripEventType.EVENT_UNKNOWN, valueOf: TripEventType.valueOf, enumValues: TripEventType.values)
    ..hasRequiredFields = false
  ;

  TripEventRequest._() : super();
  factory TripEventRequest({
    $core.String? tripId,
    $core.String? userId,
    $2.CommonAddress? origin,
    $2.CommonAddress? destination,
    $7.Timestamp? departureTime,
    $8.Duration? duration,
    $7.Timestamp? eventTime,
    TripEventType? eventType,
  }) {
    final _result = create();
    if (tripId != null) {
      _result.tripId = tripId;
    }
    if (userId != null) {
      _result.userId = userId;
    }
    if (origin != null) {
      _result.origin = origin;
    }
    if (destination != null) {
      _result.destination = destination;
    }
    if (departureTime != null) {
      _result.departureTime = departureTime;
    }
    if (duration != null) {
      _result.duration = duration;
    }
    if (eventTime != null) {
      _result.eventTime = eventTime;
    }
    if (eventType != null) {
      _result.eventType = eventType;
    }
    return _result;
  }
  factory TripEventRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TripEventRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TripEventRequest clone() => TripEventRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TripEventRequest copyWith(void Function(TripEventRequest) updates) => super.copyWith((message) => updates(message as TripEventRequest)) as TripEventRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TripEventRequest create() => TripEventRequest._();
  TripEventRequest createEmptyInstance() => create();
  static $pb.PbList<TripEventRequest> createRepeated() => $pb.PbList<TripEventRequest>();
  @$core.pragma('dart2js:noInline')
  static TripEventRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TripEventRequest>(create);
  static TripEventRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tripId => $_getSZ(0);
  @$pb.TagNumber(1)
  set tripId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTripId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTripId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  @$pb.TagNumber(3)
  $2.CommonAddress get origin => $_getN(2);
  @$pb.TagNumber(3)
  set origin($2.CommonAddress v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasOrigin() => $_has(2);
  @$pb.TagNumber(3)
  void clearOrigin() => clearField(3);
  @$pb.TagNumber(3)
  $2.CommonAddress ensureOrigin() => $_ensure(2);

  @$pb.TagNumber(4)
  $2.CommonAddress get destination => $_getN(3);
  @$pb.TagNumber(4)
  set destination($2.CommonAddress v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasDestination() => $_has(3);
  @$pb.TagNumber(4)
  void clearDestination() => clearField(4);
  @$pb.TagNumber(4)
  $2.CommonAddress ensureDestination() => $_ensure(3);

  @$pb.TagNumber(5)
  $7.Timestamp get departureTime => $_getN(4);
  @$pb.TagNumber(5)
  set departureTime($7.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasDepartureTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearDepartureTime() => clearField(5);
  @$pb.TagNumber(5)
  $7.Timestamp ensureDepartureTime() => $_ensure(4);

  @$pb.TagNumber(6)
  $8.Duration get duration => $_getN(5);
  @$pb.TagNumber(6)
  set duration($8.Duration v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasDuration() => $_has(5);
  @$pb.TagNumber(6)
  void clearDuration() => clearField(6);
  @$pb.TagNumber(6)
  $8.Duration ensureDuration() => $_ensure(5);

  @$pb.TagNumber(7)
  $7.Timestamp get eventTime => $_getN(6);
  @$pb.TagNumber(7)
  set eventTime($7.Timestamp v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasEventTime() => $_has(6);
  @$pb.TagNumber(7)
  void clearEventTime() => clearField(7);
  @$pb.TagNumber(7)
  $7.Timestamp ensureEventTime() => $_ensure(6);

  @$pb.TagNumber(8)
  TripEventType get eventType => $_getN(7);
  @$pb.TagNumber(8)
  set eventType(TripEventType v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasEventType() => $_has(7);
  @$pb.TagNumber(8)
  void clearEventType() => clearField(8);
}

