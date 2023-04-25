///
//  Generated code. Do not modify.
//  source: core_shared.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'auth.pb.dart' as $0;
import 'package:protobuf_google/protobuf_google.dart' as $4;
import 'package:protobuf_google/protobuf_google.dart' as $5;
import 'package:protobuf_google/protobuf_google.dart' as $1;

import 'core_shared.pbenum.dart';

export 'core_shared.pbenum.dart';

class GetPostsForUserResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetPostsForUserResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'core'), createEmptyInstance: create)
    ..pc<ProcheTask>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tasks', $pb.PbFieldType.PM, subBuilder: ProcheTask.create)
    ..pc<ProcheEvent>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'events', $pb.PbFieldType.PM, subBuilder: ProcheEvent.create)
    ..pc<Trip>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'trips', $pb.PbFieldType.PM, subBuilder: Trip.create)
    ..pc<GiveAway>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'giveaways', $pb.PbFieldType.PM, subBuilder: GiveAway.create)
    ..hasRequiredFields = false
  ;

  GetPostsForUserResponse._() : super();
  factory GetPostsForUserResponse({
    $core.Iterable<ProcheTask>? tasks,
    $core.Iterable<ProcheEvent>? events,
    $core.Iterable<Trip>? trips,
    $core.Iterable<GiveAway>? giveaways,
  }) {
    final _result = create();
    if (tasks != null) {
      _result.tasks.addAll(tasks);
    }
    if (events != null) {
      _result.events.addAll(events);
    }
    if (trips != null) {
      _result.trips.addAll(trips);
    }
    if (giveaways != null) {
      _result.giveaways.addAll(giveaways);
    }
    return _result;
  }
  factory GetPostsForUserResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPostsForUserResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPostsForUserResponse clone() => GetPostsForUserResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPostsForUserResponse copyWith(void Function(GetPostsForUserResponse) updates) => super.copyWith((message) => updates(message as GetPostsForUserResponse)) as GetPostsForUserResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetPostsForUserResponse create() => GetPostsForUserResponse._();
  GetPostsForUserResponse createEmptyInstance() => create();
  static $pb.PbList<GetPostsForUserResponse> createRepeated() => $pb.PbList<GetPostsForUserResponse>();
  @$core.pragma('dart2js:noInline')
  static GetPostsForUserResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPostsForUserResponse>(create);
  static GetPostsForUserResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ProcheTask> get tasks => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<ProcheEvent> get events => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<Trip> get trips => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<GiveAway> get giveaways => $_getList(3);
}

class CommonAddress extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CommonAddress', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'core'), createEmptyInstance: create)
    ..a<$core.double>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'latitude', $pb.PbFieldType.OD)
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'longitude', $pb.PbFieldType.OD)
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'radius', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  CommonAddress._() : super();
  factory CommonAddress({
    $core.double? latitude,
    $core.double? longitude,
    $core.double? radius,
  }) {
    final _result = create();
    if (latitude != null) {
      _result.latitude = latitude;
    }
    if (longitude != null) {
      _result.longitude = longitude;
    }
    if (radius != null) {
      _result.radius = radius;
    }
    return _result;
  }
  factory CommonAddress.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CommonAddress.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CommonAddress clone() => CommonAddress()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CommonAddress copyWith(void Function(CommonAddress) updates) => super.copyWith((message) => updates(message as CommonAddress)) as CommonAddress; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CommonAddress create() => CommonAddress._();
  CommonAddress createEmptyInstance() => create();
  static $pb.PbList<CommonAddress> createRepeated() => $pb.PbList<CommonAddress>();
  @$core.pragma('dart2js:noInline')
  static CommonAddress getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CommonAddress>(create);
  static CommonAddress? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get latitude => $_getN(0);
  @$pb.TagNumber(1)
  set latitude($core.double v) { $_setDouble(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLatitude() => $_has(0);
  @$pb.TagNumber(1)
  void clearLatitude() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get longitude => $_getN(1);
  @$pb.TagNumber(2)
  set longitude($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLongitude() => $_has(1);
  @$pb.TagNumber(2)
  void clearLongitude() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get radius => $_getN(2);
  @$pb.TagNumber(3)
  set radius($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRadius() => $_has(2);
  @$pb.TagNumber(3)
  void clearRadius() => clearField(3);
}

class TripCandidateList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TripCandidateList', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'core'), createEmptyInstance: create)
    ..pc<$0.Account>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'candidates', $pb.PbFieldType.PM, subBuilder: $0.Account.create)
    ..hasRequiredFields = false
  ;

  TripCandidateList._() : super();
  factory TripCandidateList({
    $core.Iterable<$0.Account>? candidates,
  }) {
    final _result = create();
    if (candidates != null) {
      _result.candidates.addAll(candidates);
    }
    return _result;
  }
  factory TripCandidateList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TripCandidateList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TripCandidateList clone() => TripCandidateList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TripCandidateList copyWith(void Function(TripCandidateList) updates) => super.copyWith((message) => updates(message as TripCandidateList)) as TripCandidateList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TripCandidateList create() => TripCandidateList._();
  TripCandidateList createEmptyInstance() => create();
  static $pb.PbList<TripCandidateList> createRepeated() => $pb.PbList<TripCandidateList>();
  @$core.pragma('dart2js:noInline')
  static TripCandidateList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TripCandidateList>(create);
  static TripCandidateList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$0.Account> get candidates => $_getList(0);
}

class TripList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TripList', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'core'), createEmptyInstance: create)
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TripEventList', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'core'), createEmptyInstance: create)
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'BookTripRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'core'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOM<CommonAddress>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'origin', subBuilder: CommonAddress.create)
    ..aOM<CommonAddress>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'destination', subBuilder: CommonAddress.create)
    ..aOM<$4.Timestamp>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'departureTime', subBuilder: $4.Timestamp.create)
    ..aOM<$5.Duration>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'duration', subBuilder: $5.Duration.create)
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'vaccineCardUrl')
    ..hasRequiredFields = false
  ;

  BookTripRequest._() : super();
  factory BookTripRequest({
    $core.String? userId,
    CommonAddress? origin,
    CommonAddress? destination,
    $4.Timestamp? departureTime,
    $5.Duration? duration,
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
  CommonAddress get origin => $_getN(1);
  @$pb.TagNumber(2)
  set origin(CommonAddress v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasOrigin() => $_has(1);
  @$pb.TagNumber(2)
  void clearOrigin() => clearField(2);
  @$pb.TagNumber(2)
  CommonAddress ensureOrigin() => $_ensure(1);

  @$pb.TagNumber(3)
  CommonAddress get destination => $_getN(2);
  @$pb.TagNumber(3)
  set destination(CommonAddress v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasDestination() => $_has(2);
  @$pb.TagNumber(3)
  void clearDestination() => clearField(3);
  @$pb.TagNumber(3)
  CommonAddress ensureDestination() => $_ensure(2);

  @$pb.TagNumber(4)
  $4.Timestamp get departureTime => $_getN(3);
  @$pb.TagNumber(4)
  set departureTime($4.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasDepartureTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearDepartureTime() => clearField(4);
  @$pb.TagNumber(4)
  $4.Timestamp ensureDepartureTime() => $_ensure(3);

  @$pb.TagNumber(5)
  $5.Duration get duration => $_getN(4);
  @$pb.TagNumber(5)
  set duration($5.Duration v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasDuration() => $_has(4);
  @$pb.TagNumber(5)
  void clearDuration() => clearField(5);
  @$pb.TagNumber(5)
  $5.Duration ensureDuration() => $_ensure(4);

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Trip', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'core'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOM<CommonAddress>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'origin', subBuilder: CommonAddress.create)
    ..aOM<CommonAddress>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'destination', subBuilder: CommonAddress.create)
    ..aOM<$4.Timestamp>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'departureTime', subBuilder: $4.Timestamp.create)
    ..aOM<$5.Duration>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'duration', subBuilder: $5.Duration.create)
    ..aOM<$4.Timestamp>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdAt', subBuilder: $4.Timestamp.create)
    ..aOM<$4.Timestamp>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updatedAt', subBuilder: $4.Timestamp.create)
    ..hasRequiredFields = false
  ;

  Trip._() : super();
  factory Trip({
    $core.String? id,
    $core.String? userId,
    CommonAddress? origin,
    CommonAddress? destination,
    $4.Timestamp? departureTime,
    $5.Duration? duration,
    $4.Timestamp? createdAt,
    $4.Timestamp? updatedAt,
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
  CommonAddress get origin => $_getN(2);
  @$pb.TagNumber(3)
  set origin(CommonAddress v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasOrigin() => $_has(2);
  @$pb.TagNumber(3)
  void clearOrigin() => clearField(3);
  @$pb.TagNumber(3)
  CommonAddress ensureOrigin() => $_ensure(2);

  @$pb.TagNumber(4)
  CommonAddress get destination => $_getN(3);
  @$pb.TagNumber(4)
  set destination(CommonAddress v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasDestination() => $_has(3);
  @$pb.TagNumber(4)
  void clearDestination() => clearField(4);
  @$pb.TagNumber(4)
  CommonAddress ensureDestination() => $_ensure(3);

  @$pb.TagNumber(5)
  $4.Timestamp get departureTime => $_getN(4);
  @$pb.TagNumber(5)
  set departureTime($4.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasDepartureTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearDepartureTime() => clearField(5);
  @$pb.TagNumber(5)
  $4.Timestamp ensureDepartureTime() => $_ensure(4);

  @$pb.TagNumber(6)
  $5.Duration get duration => $_getN(5);
  @$pb.TagNumber(6)
  set duration($5.Duration v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasDuration() => $_has(5);
  @$pb.TagNumber(6)
  void clearDuration() => clearField(6);
  @$pb.TagNumber(6)
  $5.Duration ensureDuration() => $_ensure(5);

  @$pb.TagNumber(7)
  $4.Timestamp get createdAt => $_getN(6);
  @$pb.TagNumber(7)
  set createdAt($4.Timestamp v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasCreatedAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearCreatedAt() => clearField(7);
  @$pb.TagNumber(7)
  $4.Timestamp ensureCreatedAt() => $_ensure(6);

  @$pb.TagNumber(8)
  $4.Timestamp get updatedAt => $_getN(7);
  @$pb.TagNumber(8)
  set updatedAt($4.Timestamp v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasUpdatedAt() => $_has(7);
  @$pb.TagNumber(8)
  void clearUpdatedAt() => clearField(8);
  @$pb.TagNumber(8)
  $4.Timestamp ensureUpdatedAt() => $_ensure(7);
}

class TripEvent extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TripEvent', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'core'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tripId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOM<CommonAddress>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'origin', subBuilder: CommonAddress.create)
    ..aOM<CommonAddress>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'destination', subBuilder: CommonAddress.create)
    ..aOM<$4.Timestamp>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'departureTime', subBuilder: $4.Timestamp.create)
    ..aOM<$5.Duration>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'duration', subBuilder: $5.Duration.create)
    ..aOM<$4.Timestamp>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdAt', subBuilder: $4.Timestamp.create)
    ..aOM<$4.Timestamp>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updatedAt', subBuilder: $4.Timestamp.create)
    ..aOM<$4.Timestamp>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'eventTime', subBuilder: $4.Timestamp.create)
    ..e<TripEventType>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'eventType', $pb.PbFieldType.OE, defaultOrMaker: TripEventType.EVENT_UNKNOWN, valueOf: TripEventType.valueOf, enumValues: TripEventType.values)
    ..hasRequiredFields = false
  ;

  TripEvent._() : super();
  factory TripEvent({
    $core.String? id,
    $core.String? tripId,
    $core.String? userId,
    CommonAddress? origin,
    CommonAddress? destination,
    $4.Timestamp? departureTime,
    $5.Duration? duration,
    $4.Timestamp? createdAt,
    $4.Timestamp? updatedAt,
    $4.Timestamp? eventTime,
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
  CommonAddress get origin => $_getN(3);
  @$pb.TagNumber(4)
  set origin(CommonAddress v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasOrigin() => $_has(3);
  @$pb.TagNumber(4)
  void clearOrigin() => clearField(4);
  @$pb.TagNumber(4)
  CommonAddress ensureOrigin() => $_ensure(3);

  @$pb.TagNumber(5)
  CommonAddress get destination => $_getN(4);
  @$pb.TagNumber(5)
  set destination(CommonAddress v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasDestination() => $_has(4);
  @$pb.TagNumber(5)
  void clearDestination() => clearField(5);
  @$pb.TagNumber(5)
  CommonAddress ensureDestination() => $_ensure(4);

  @$pb.TagNumber(6)
  $4.Timestamp get departureTime => $_getN(5);
  @$pb.TagNumber(6)
  set departureTime($4.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasDepartureTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearDepartureTime() => clearField(6);
  @$pb.TagNumber(6)
  $4.Timestamp ensureDepartureTime() => $_ensure(5);

  @$pb.TagNumber(7)
  $5.Duration get duration => $_getN(6);
  @$pb.TagNumber(7)
  set duration($5.Duration v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasDuration() => $_has(6);
  @$pb.TagNumber(7)
  void clearDuration() => clearField(7);
  @$pb.TagNumber(7)
  $5.Duration ensureDuration() => $_ensure(6);

  @$pb.TagNumber(8)
  $4.Timestamp get createdAt => $_getN(7);
  @$pb.TagNumber(8)
  set createdAt($4.Timestamp v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasCreatedAt() => $_has(7);
  @$pb.TagNumber(8)
  void clearCreatedAt() => clearField(8);
  @$pb.TagNumber(8)
  $4.Timestamp ensureCreatedAt() => $_ensure(7);

  @$pb.TagNumber(9)
  $4.Timestamp get updatedAt => $_getN(8);
  @$pb.TagNumber(9)
  set updatedAt($4.Timestamp v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasUpdatedAt() => $_has(8);
  @$pb.TagNumber(9)
  void clearUpdatedAt() => clearField(9);
  @$pb.TagNumber(9)
  $4.Timestamp ensureUpdatedAt() => $_ensure(8);

  @$pb.TagNumber(10)
  $4.Timestamp get eventTime => $_getN(9);
  @$pb.TagNumber(10)
  set eventTime($4.Timestamp v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasEventTime() => $_has(9);
  @$pb.TagNumber(10)
  void clearEventTime() => clearField(10);
  @$pb.TagNumber(10)
  $4.Timestamp ensureEventTime() => $_ensure(9);

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TripEventRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'core'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tripId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOM<CommonAddress>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'origin', subBuilder: CommonAddress.create)
    ..aOM<CommonAddress>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'destination', subBuilder: CommonAddress.create)
    ..aOM<$4.Timestamp>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'departureTime', subBuilder: $4.Timestamp.create)
    ..aOM<$5.Duration>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'duration', subBuilder: $5.Duration.create)
    ..aOM<$4.Timestamp>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'eventTime', subBuilder: $4.Timestamp.create)
    ..e<TripEventType>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'eventType', $pb.PbFieldType.OE, defaultOrMaker: TripEventType.EVENT_UNKNOWN, valueOf: TripEventType.valueOf, enumValues: TripEventType.values)
    ..hasRequiredFields = false
  ;

  TripEventRequest._() : super();
  factory TripEventRequest({
    $core.String? tripId,
    $core.String? userId,
    CommonAddress? origin,
    CommonAddress? destination,
    $4.Timestamp? departureTime,
    $5.Duration? duration,
    $4.Timestamp? eventTime,
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
  CommonAddress get origin => $_getN(2);
  @$pb.TagNumber(3)
  set origin(CommonAddress v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasOrigin() => $_has(2);
  @$pb.TagNumber(3)
  void clearOrigin() => clearField(3);
  @$pb.TagNumber(3)
  CommonAddress ensureOrigin() => $_ensure(2);

  @$pb.TagNumber(4)
  CommonAddress get destination => $_getN(3);
  @$pb.TagNumber(4)
  set destination(CommonAddress v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasDestination() => $_has(3);
  @$pb.TagNumber(4)
  void clearDestination() => clearField(4);
  @$pb.TagNumber(4)
  CommonAddress ensureDestination() => $_ensure(3);

  @$pb.TagNumber(5)
  $4.Timestamp get departureTime => $_getN(4);
  @$pb.TagNumber(5)
  set departureTime($4.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasDepartureTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearDepartureTime() => clearField(5);
  @$pb.TagNumber(5)
  $4.Timestamp ensureDepartureTime() => $_ensure(4);

  @$pb.TagNumber(6)
  $5.Duration get duration => $_getN(5);
  @$pb.TagNumber(6)
  set duration($5.Duration v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasDuration() => $_has(5);
  @$pb.TagNumber(6)
  void clearDuration() => clearField(6);
  @$pb.TagNumber(6)
  $5.Duration ensureDuration() => $_ensure(5);

  @$pb.TagNumber(7)
  $4.Timestamp get eventTime => $_getN(6);
  @$pb.TagNumber(7)
  set eventTime($4.Timestamp v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasEventTime() => $_has(6);
  @$pb.TagNumber(7)
  void clearEventTime() => clearField(7);
  @$pb.TagNumber(7)
  $4.Timestamp ensureEventTime() => $_ensure(6);

  @$pb.TagNumber(8)
  TripEventType get eventType => $_getN(7);
  @$pb.TagNumber(8)
  set eventType(TripEventType v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasEventType() => $_has(7);
  @$pb.TagNumber(8)
  void clearEventType() => clearField(8);
}

class ApplyForTaskRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ApplyForTaskRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'core'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'taskId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..hasRequiredFields = false
  ;

  ApplyForTaskRequest._() : super();
  factory ApplyForTaskRequest({
    $core.String? taskId,
    $core.String? userId,
  }) {
    final _result = create();
    if (taskId != null) {
      _result.taskId = taskId;
    }
    if (userId != null) {
      _result.userId = userId;
    }
    return _result;
  }
  factory ApplyForTaskRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ApplyForTaskRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ApplyForTaskRequest clone() => ApplyForTaskRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ApplyForTaskRequest copyWith(void Function(ApplyForTaskRequest) updates) => super.copyWith((message) => updates(message as ApplyForTaskRequest)) as ApplyForTaskRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApplyForTaskRequest create() => ApplyForTaskRequest._();
  ApplyForTaskRequest createEmptyInstance() => create();
  static $pb.PbList<ApplyForTaskRequest> createRepeated() => $pb.PbList<ApplyForTaskRequest>();
  @$core.pragma('dart2js:noInline')
  static ApplyForTaskRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ApplyForTaskRequest>(create);
  static ApplyForTaskRequest? _defaultInstance;

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
}

class TaskCandidateList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TaskCandidateList', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'core'), createEmptyInstance: create)
    ..pc<TaskCandidate>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'candidates', $pb.PbFieldType.PM, subBuilder: TaskCandidate.create)
    ..hasRequiredFields = false
  ;

  TaskCandidateList._() : super();
  factory TaskCandidateList({
    $core.Iterable<TaskCandidate>? candidates,
  }) {
    final _result = create();
    if (candidates != null) {
      _result.candidates.addAll(candidates);
    }
    return _result;
  }
  factory TaskCandidateList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TaskCandidateList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TaskCandidateList clone() => TaskCandidateList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TaskCandidateList copyWith(void Function(TaskCandidateList) updates) => super.copyWith((message) => updates(message as TaskCandidateList)) as TaskCandidateList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TaskCandidateList create() => TaskCandidateList._();
  TaskCandidateList createEmptyInstance() => create();
  static $pb.PbList<TaskCandidateList> createRepeated() => $pb.PbList<TaskCandidateList>();
  @$core.pragma('dart2js:noInline')
  static TaskCandidateList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TaskCandidateList>(create);
  static TaskCandidateList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<TaskCandidate> get candidates => $_getList(0);
}

class TaskCandidate extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TaskCandidate', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'core'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'taskId')
    ..aOM<$0.BusinessAccount>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'account', subBuilder: $0.BusinessAccount.create)
    ..aOM<$4.Timestamp>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdAt', subBuilder: $4.Timestamp.create)
    ..aOM<$4.Timestamp>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updatedAt', subBuilder: $4.Timestamp.create)
    ..aOB(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hired')
    ..hasRequiredFields = false
  ;

  TaskCandidate._() : super();
  factory TaskCandidate({
    $core.String? id,
    $core.String? taskId,
    $0.BusinessAccount? account,
    $4.Timestamp? createdAt,
    $4.Timestamp? updatedAt,
    $core.bool? hired,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (taskId != null) {
      _result.taskId = taskId;
    }
    if (account != null) {
      _result.account = account;
    }
    if (createdAt != null) {
      _result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      _result.updatedAt = updatedAt;
    }
    if (hired != null) {
      _result.hired = hired;
    }
    return _result;
  }
  factory TaskCandidate.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TaskCandidate.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TaskCandidate clone() => TaskCandidate()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TaskCandidate copyWith(void Function(TaskCandidate) updates) => super.copyWith((message) => updates(message as TaskCandidate)) as TaskCandidate; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TaskCandidate create() => TaskCandidate._();
  TaskCandidate createEmptyInstance() => create();
  static $pb.PbList<TaskCandidate> createRepeated() => $pb.PbList<TaskCandidate>();
  @$core.pragma('dart2js:noInline')
  static TaskCandidate getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TaskCandidate>(create);
  static TaskCandidate? _defaultInstance;

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
  $0.BusinessAccount get account => $_getN(2);
  @$pb.TagNumber(3)
  set account($0.BusinessAccount v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasAccount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAccount() => clearField(3);
  @$pb.TagNumber(3)
  $0.BusinessAccount ensureAccount() => $_ensure(2);

  @$pb.TagNumber(4)
  $4.Timestamp get createdAt => $_getN(3);
  @$pb.TagNumber(4)
  set createdAt($4.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasCreatedAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearCreatedAt() => clearField(4);
  @$pb.TagNumber(4)
  $4.Timestamp ensureCreatedAt() => $_ensure(3);

  @$pb.TagNumber(5)
  $4.Timestamp get updatedAt => $_getN(4);
  @$pb.TagNumber(5)
  set updatedAt($4.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasUpdatedAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearUpdatedAt() => clearField(5);
  @$pb.TagNumber(5)
  $4.Timestamp ensureUpdatedAt() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.bool get hired => $_getBF(5);
  @$pb.TagNumber(6)
  set hired($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasHired() => $_has(5);
  @$pb.TagNumber(6)
  void clearHired() => clearField(6);
}

class TaskEventRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TaskEventRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'core'), createEmptyInstance: create)
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CompleteTaskEventRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'core'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'taskId')
    ..aOM<$4.Timestamp>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'endTime', subBuilder: $4.Timestamp.create)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'notes')
    ..hasRequiredFields = false
  ;

  CompleteTaskEventRequest._() : super();
  factory CompleteTaskEventRequest({
    $core.String? taskId,
    $4.Timestamp? endTime,
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
  $4.Timestamp get endTime => $_getN(1);
  @$pb.TagNumber(2)
  set endTime($4.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasEndTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearEndTime() => clearField(2);
  @$pb.TagNumber(2)
  $4.Timestamp ensureEndTime() => $_ensure(1);

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TaskEventList', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'core'), createEmptyInstance: create)
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateTaskEventRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'core'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'taskId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOM<$4.Timestamp>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'startTime', subBuilder: $4.Timestamp.create)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'notes')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'vaccineCardUrl')
    ..hasRequiredFields = false
  ;

  CreateTaskEventRequest._() : super();
  factory CreateTaskEventRequest({
    $core.String? taskId,
    $core.String? userId,
    $4.Timestamp? startTime,
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
  $4.Timestamp get startTime => $_getN(2);
  @$pb.TagNumber(3)
  set startTime($4.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasStartTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearStartTime() => clearField(3);
  @$pb.TagNumber(3)
  $4.Timestamp ensureStartTime() => $_ensure(2);

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateTaskRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'core'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aOM<$4.Timestamp>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dueDate', subBuilder: $4.Timestamp.create)
    ..aOM<$5.Duration>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'duration', subBuilder: $5.Duration.create)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..a<$core.double>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'chargePerHour', $pb.PbFieldType.OD)
    ..aOM<CommonAddress>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'address', subBuilder: CommonAddress.create)
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'imageUrl')
    ..hasRequiredFields = false
  ;

  CreateTaskRequest._() : super();
  factory CreateTaskRequest({
    $core.String? title,
    $core.String? description,
    $4.Timestamp? dueDate,
    $5.Duration? duration,
    $core.String? userId,
    $core.double? chargePerHour,
    CommonAddress? address,
    $core.String? imageUrl,
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
    if (address != null) {
      _result.address = address;
    }
    if (imageUrl != null) {
      _result.imageUrl = imageUrl;
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
  $4.Timestamp get dueDate => $_getN(2);
  @$pb.TagNumber(3)
  set dueDate($4.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasDueDate() => $_has(2);
  @$pb.TagNumber(3)
  void clearDueDate() => clearField(3);
  @$pb.TagNumber(3)
  $4.Timestamp ensureDueDate() => $_ensure(2);

  @$pb.TagNumber(4)
  $5.Duration get duration => $_getN(3);
  @$pb.TagNumber(4)
  set duration($5.Duration v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasDuration() => $_has(3);
  @$pb.TagNumber(4)
  void clearDuration() => clearField(4);
  @$pb.TagNumber(4)
  $5.Duration ensureDuration() => $_ensure(3);

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

  @$pb.TagNumber(7)
  CommonAddress get address => $_getN(6);
  @$pb.TagNumber(7)
  set address(CommonAddress v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasAddress() => $_has(6);
  @$pb.TagNumber(7)
  void clearAddress() => clearField(7);
  @$pb.TagNumber(7)
  CommonAddress ensureAddress() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.String get imageUrl => $_getSZ(7);
  @$pb.TagNumber(8)
  set imageUrl($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasImageUrl() => $_has(7);
  @$pb.TagNumber(8)
  void clearImageUrl() => clearField(8);
}

class UpdateTaskRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateTaskRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'core'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aOM<$4.Timestamp>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dueDate', subBuilder: $4.Timestamp.create)
    ..aOM<$5.Duration>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'duration', subBuilder: $5.Duration.create)
    ..aOM<$1.BoolValue>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'completed', subBuilder: $1.BoolValue.create)
    ..hasRequiredFields = false
  ;

  UpdateTaskRequest._() : super();
  factory UpdateTaskRequest({
    $core.String? id,
    $core.String? title,
    $core.String? description,
    $4.Timestamp? dueDate,
    $5.Duration? duration,
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
  $4.Timestamp get dueDate => $_getN(3);
  @$pb.TagNumber(4)
  set dueDate($4.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasDueDate() => $_has(3);
  @$pb.TagNumber(4)
  void clearDueDate() => clearField(4);
  @$pb.TagNumber(4)
  $4.Timestamp ensureDueDate() => $_ensure(3);

  @$pb.TagNumber(5)
  $5.Duration get duration => $_getN(4);
  @$pb.TagNumber(5)
  set duration($5.Duration v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasDuration() => $_has(4);
  @$pb.TagNumber(5)
  void clearDuration() => clearField(5);
  @$pb.TagNumber(5)
  $5.Duration ensureDuration() => $_ensure(4);

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TaskList', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'core'), createEmptyInstance: create)
    ..pc<ProcheTask>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tasks', $pb.PbFieldType.PM, subBuilder: ProcheTask.create)
    ..hasRequiredFields = false
  ;

  TaskList._() : super();
  factory TaskList({
    $core.Iterable<ProcheTask>? tasks,
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
  $core.List<ProcheTask> get tasks => $_getList(0);
}

class ProcheTask extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ProcheTask', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'core'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aOM<$4.Timestamp>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdAt', subBuilder: $4.Timestamp.create)
    ..aOM<$4.Timestamp>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updatedAt', subBuilder: $4.Timestamp.create)
    ..aOM<$4.Timestamp>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dueDate', subBuilder: $4.Timestamp.create)
    ..aOM<$5.Duration>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'duration', subBuilder: $5.Duration.create)
    ..aOB(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'completed')
    ..a<$core.double>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'chargePerHour', $pb.PbFieldType.OD)
    ..aOS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOM<CommonAddress>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'address', subBuilder: CommonAddress.create)
    ..aOS(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'imageUrl')
    ..a<$core.int>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'numberOfApplicants', $pb.PbFieldType.O3, protoName: 'numberOfApplicants')
    ..hasRequiredFields = false
  ;

  ProcheTask._() : super();
  factory ProcheTask({
    $core.String? id,
    $core.String? title,
    $core.String? description,
    $4.Timestamp? createdAt,
    $4.Timestamp? updatedAt,
    $4.Timestamp? dueDate,
    $5.Duration? duration,
    $core.bool? completed,
    $core.double? chargePerHour,
    $core.String? userId,
    CommonAddress? address,
    $core.String? imageUrl,
    $core.int? numberOfApplicants,
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
    if (imageUrl != null) {
      _result.imageUrl = imageUrl;
    }
    if (numberOfApplicants != null) {
      _result.numberOfApplicants = numberOfApplicants;
    }
    return _result;
  }
  factory ProcheTask.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ProcheTask.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ProcheTask clone() => ProcheTask()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ProcheTask copyWith(void Function(ProcheTask) updates) => super.copyWith((message) => updates(message as ProcheTask)) as ProcheTask; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ProcheTask create() => ProcheTask._();
  ProcheTask createEmptyInstance() => create();
  static $pb.PbList<ProcheTask> createRepeated() => $pb.PbList<ProcheTask>();
  @$core.pragma('dart2js:noInline')
  static ProcheTask getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ProcheTask>(create);
  static ProcheTask? _defaultInstance;

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
  $4.Timestamp get createdAt => $_getN(3);
  @$pb.TagNumber(4)
  set createdAt($4.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasCreatedAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearCreatedAt() => clearField(4);
  @$pb.TagNumber(4)
  $4.Timestamp ensureCreatedAt() => $_ensure(3);

  @$pb.TagNumber(5)
  $4.Timestamp get updatedAt => $_getN(4);
  @$pb.TagNumber(5)
  set updatedAt($4.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasUpdatedAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearUpdatedAt() => clearField(5);
  @$pb.TagNumber(5)
  $4.Timestamp ensureUpdatedAt() => $_ensure(4);

  @$pb.TagNumber(6)
  $4.Timestamp get dueDate => $_getN(5);
  @$pb.TagNumber(6)
  set dueDate($4.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasDueDate() => $_has(5);
  @$pb.TagNumber(6)
  void clearDueDate() => clearField(6);
  @$pb.TagNumber(6)
  $4.Timestamp ensureDueDate() => $_ensure(5);

  @$pb.TagNumber(7)
  $5.Duration get duration => $_getN(6);
  @$pb.TagNumber(7)
  set duration($5.Duration v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasDuration() => $_has(6);
  @$pb.TagNumber(7)
  void clearDuration() => clearField(7);
  @$pb.TagNumber(7)
  $5.Duration ensureDuration() => $_ensure(6);

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
  CommonAddress get address => $_getN(10);
  @$pb.TagNumber(11)
  set address(CommonAddress v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasAddress() => $_has(10);
  @$pb.TagNumber(11)
  void clearAddress() => clearField(11);
  @$pb.TagNumber(11)
  CommonAddress ensureAddress() => $_ensure(10);

  @$pb.TagNumber(12)
  $core.String get imageUrl => $_getSZ(11);
  @$pb.TagNumber(12)
  set imageUrl($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasImageUrl() => $_has(11);
  @$pb.TagNumber(12)
  void clearImageUrl() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get numberOfApplicants => $_getIZ(12);
  @$pb.TagNumber(13)
  set numberOfApplicants($core.int v) { $_setSignedInt32(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasNumberOfApplicants() => $_has(12);
  @$pb.TagNumber(13)
  void clearNumberOfApplicants() => clearField(13);
}

class TaskEvent extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TaskEvent', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'core'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'taskId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOM<$4.Timestamp>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'startTime', subBuilder: $4.Timestamp.create)
    ..aOM<$4.Timestamp>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'endTime', subBuilder: $4.Timestamp.create)
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'notes')
    ..hasRequiredFields = false
  ;

  TaskEvent._() : super();
  factory TaskEvent({
    $core.String? id,
    $core.String? taskId,
    $core.String? userId,
    $4.Timestamp? startTime,
    $4.Timestamp? endTime,
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
  $4.Timestamp get startTime => $_getN(3);
  @$pb.TagNumber(4)
  set startTime($4.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasStartTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearStartTime() => clearField(4);
  @$pb.TagNumber(4)
  $4.Timestamp ensureStartTime() => $_ensure(3);

  @$pb.TagNumber(5)
  $4.Timestamp get endTime => $_getN(4);
  @$pb.TagNumber(5)
  set endTime($4.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasEndTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearEndTime() => clearField(5);
  @$pb.TagNumber(5)
  $4.Timestamp ensureEndTime() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.String get notes => $_getSZ(5);
  @$pb.TagNumber(6)
  set notes($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasNotes() => $_has(5);
  @$pb.TagNumber(6)
  void clearNotes() => clearField(6);
}

class GiveawayCandidateList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GiveawayCandidateList', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'core'), createEmptyInstance: create)
    ..pc<$0.Account>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'candidates', $pb.PbFieldType.PM, subBuilder: $0.Account.create)
    ..hasRequiredFields = false
  ;

  GiveawayCandidateList._() : super();
  factory GiveawayCandidateList({
    $core.Iterable<$0.Account>? candidates,
  }) {
    final _result = create();
    if (candidates != null) {
      _result.candidates.addAll(candidates);
    }
    return _result;
  }
  factory GiveawayCandidateList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GiveawayCandidateList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GiveawayCandidateList clone() => GiveawayCandidateList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GiveawayCandidateList copyWith(void Function(GiveawayCandidateList) updates) => super.copyWith((message) => updates(message as GiveawayCandidateList)) as GiveawayCandidateList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GiveawayCandidateList create() => GiveawayCandidateList._();
  GiveawayCandidateList createEmptyInstance() => create();
  static $pb.PbList<GiveawayCandidateList> createRepeated() => $pb.PbList<GiveawayCandidateList>();
  @$core.pragma('dart2js:noInline')
  static GiveawayCandidateList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GiveawayCandidateList>(create);
  static GiveawayCandidateList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$0.Account> get candidates => $_getList(0);
}

class GiveAwayList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GiveAwayList', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'core'), createEmptyInstance: create)
    ..pc<GiveAway>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'giveaways', $pb.PbFieldType.PM, subBuilder: GiveAway.create)
    ..hasRequiredFields = false
  ;

  GiveAwayList._() : super();
  factory GiveAwayList({
    $core.Iterable<GiveAway>? giveaways,
  }) {
    final _result = create();
    if (giveaways != null) {
      _result.giveaways.addAll(giveaways);
    }
    return _result;
  }
  factory GiveAwayList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GiveAwayList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GiveAwayList clone() => GiveAwayList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GiveAwayList copyWith(void Function(GiveAwayList) updates) => super.copyWith((message) => updates(message as GiveAwayList)) as GiveAwayList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GiveAwayList create() => GiveAwayList._();
  GiveAwayList createEmptyInstance() => create();
  static $pb.PbList<GiveAwayList> createRepeated() => $pb.PbList<GiveAwayList>();
  @$core.pragma('dart2js:noInline')
  static GiveAwayList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GiveAwayList>(create);
  static GiveAwayList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<GiveAway> get giveaways => $_getList(0);
}

class CreateGiveAwayRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateGiveAwayRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'core'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..pPS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'images')
    ..aOM<CommonAddress>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'address', subBuilder: CommonAddress.create)
    ..e<GiveAwayDispatchType>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dispatchType', $pb.PbFieldType.OE, defaultOrMaker: GiveAwayDispatchType.GIVEAWAY_PICKUP, valueOf: GiveAwayDispatchType.valueOf, enumValues: GiveAwayDispatchType.values)
    ..aOM<$5.Duration>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dispatchDuration', subBuilder: $5.Duration.create)
    ..hasRequiredFields = false
  ;

  CreateGiveAwayRequest._() : super();
  factory CreateGiveAwayRequest({
    $core.String? name,
    $core.String? description,
    $core.Iterable<$core.String>? images,
    CommonAddress? address,
    GiveAwayDispatchType? dispatchType,
    $5.Duration? dispatchDuration,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (description != null) {
      _result.description = description;
    }
    if (images != null) {
      _result.images.addAll(images);
    }
    if (address != null) {
      _result.address = address;
    }
    if (dispatchType != null) {
      _result.dispatchType = dispatchType;
    }
    if (dispatchDuration != null) {
      _result.dispatchDuration = dispatchDuration;
    }
    return _result;
  }
  factory CreateGiveAwayRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateGiveAwayRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateGiveAwayRequest clone() => CreateGiveAwayRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateGiveAwayRequest copyWith(void Function(CreateGiveAwayRequest) updates) => super.copyWith((message) => updates(message as CreateGiveAwayRequest)) as CreateGiveAwayRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateGiveAwayRequest create() => CreateGiveAwayRequest._();
  CreateGiveAwayRequest createEmptyInstance() => create();
  static $pb.PbList<CreateGiveAwayRequest> createRepeated() => $pb.PbList<CreateGiveAwayRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateGiveAwayRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateGiveAwayRequest>(create);
  static CreateGiveAwayRequest? _defaultInstance;

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
  $core.List<$core.String> get images => $_getList(2);

  @$pb.TagNumber(4)
  CommonAddress get address => $_getN(3);
  @$pb.TagNumber(4)
  set address(CommonAddress v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasAddress() => $_has(3);
  @$pb.TagNumber(4)
  void clearAddress() => clearField(4);
  @$pb.TagNumber(4)
  CommonAddress ensureAddress() => $_ensure(3);

  @$pb.TagNumber(5)
  GiveAwayDispatchType get dispatchType => $_getN(4);
  @$pb.TagNumber(5)
  set dispatchType(GiveAwayDispatchType v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasDispatchType() => $_has(4);
  @$pb.TagNumber(5)
  void clearDispatchType() => clearField(5);

  @$pb.TagNumber(6)
  $5.Duration get dispatchDuration => $_getN(5);
  @$pb.TagNumber(6)
  set dispatchDuration($5.Duration v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasDispatchDuration() => $_has(5);
  @$pb.TagNumber(6)
  void clearDispatchDuration() => clearField(6);
  @$pb.TagNumber(6)
  $5.Duration ensureDispatchDuration() => $_ensure(5);
}

class GiveAway extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GiveAway', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'core'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..pPS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'images')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'owner')
    ..aOM<$4.Timestamp>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdAt', subBuilder: $4.Timestamp.create)
    ..aOM<$4.Timestamp>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updatedAt', subBuilder: $4.Timestamp.create)
    ..aOM<CommonAddress>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'address', subBuilder: CommonAddress.create)
    ..hasRequiredFields = false
  ;

  GiveAway._() : super();
  factory GiveAway({
    $core.String? id,
    $core.String? name,
    $core.String? description,
    $core.Iterable<$core.String>? images,
    $core.String? owner,
    $4.Timestamp? createdAt,
    $4.Timestamp? updatedAt,
    CommonAddress? address,
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
    if (images != null) {
      _result.images.addAll(images);
    }
    if (owner != null) {
      _result.owner = owner;
    }
    if (createdAt != null) {
      _result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      _result.updatedAt = updatedAt;
    }
    if (address != null) {
      _result.address = address;
    }
    return _result;
  }
  factory GiveAway.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GiveAway.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GiveAway clone() => GiveAway()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GiveAway copyWith(void Function(GiveAway) updates) => super.copyWith((message) => updates(message as GiveAway)) as GiveAway; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GiveAway create() => GiveAway._();
  GiveAway createEmptyInstance() => create();
  static $pb.PbList<GiveAway> createRepeated() => $pb.PbList<GiveAway>();
  @$core.pragma('dart2js:noInline')
  static GiveAway getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GiveAway>(create);
  static GiveAway? _defaultInstance;

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
  $core.List<$core.String> get images => $_getList(3);

  @$pb.TagNumber(5)
  $core.String get owner => $_getSZ(4);
  @$pb.TagNumber(5)
  set owner($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasOwner() => $_has(4);
  @$pb.TagNumber(5)
  void clearOwner() => clearField(5);

  @$pb.TagNumber(6)
  $4.Timestamp get createdAt => $_getN(5);
  @$pb.TagNumber(6)
  set createdAt($4.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasCreatedAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreatedAt() => clearField(6);
  @$pb.TagNumber(6)
  $4.Timestamp ensureCreatedAt() => $_ensure(5);

  @$pb.TagNumber(7)
  $4.Timestamp get updatedAt => $_getN(6);
  @$pb.TagNumber(7)
  set updatedAt($4.Timestamp v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasUpdatedAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearUpdatedAt() => clearField(7);
  @$pb.TagNumber(7)
  $4.Timestamp ensureUpdatedAt() => $_ensure(6);

  @$pb.TagNumber(8)
  CommonAddress get address => $_getN(7);
  @$pb.TagNumber(8)
  set address(CommonAddress v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasAddress() => $_has(7);
  @$pb.TagNumber(8)
  void clearAddress() => clearField(8);
  @$pb.TagNumber(8)
  CommonAddress ensureAddress() => $_ensure(7);
}

class EventCandidateList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EventCandidateList', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'core'), createEmptyInstance: create)
    ..pc<$0.Account>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'candidates', $pb.PbFieldType.PM, subBuilder: $0.Account.create)
    ..hasRequiredFields = false
  ;

  EventCandidateList._() : super();
  factory EventCandidateList({
    $core.Iterable<$0.Account>? candidates,
  }) {
    final _result = create();
    if (candidates != null) {
      _result.candidates.addAll(candidates);
    }
    return _result;
  }
  factory EventCandidateList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EventCandidateList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EventCandidateList clone() => EventCandidateList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EventCandidateList copyWith(void Function(EventCandidateList) updates) => super.copyWith((message) => updates(message as EventCandidateList)) as EventCandidateList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EventCandidateList create() => EventCandidateList._();
  EventCandidateList createEmptyInstance() => create();
  static $pb.PbList<EventCandidateList> createRepeated() => $pb.PbList<EventCandidateList>();
  @$core.pragma('dart2js:noInline')
  static EventCandidateList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EventCandidateList>(create);
  static EventCandidateList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$0.Account> get candidates => $_getList(0);
}

class CreateEventRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateEventRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'core'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'location')
    ..a<$core.double>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'latitude', $pb.PbFieldType.OD)
    ..a<$core.double>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'longitude', $pb.PbFieldType.OD)
    ..aOM<$4.Timestamp>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'startTime', subBuilder: $4.Timestamp.create)
    ..aOM<$4.Timestamp>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'endTime', subBuilder: $4.Timestamp.create)
    ..aOM<$5.Duration>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'duration', subBuilder: $5.Duration.create)
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
    $4.Timestamp? startTime,
    $4.Timestamp? endTime,
    $5.Duration? duration,
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
  $4.Timestamp get startTime => $_getN(5);
  @$pb.TagNumber(6)
  set startTime($4.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasStartTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearStartTime() => clearField(6);
  @$pb.TagNumber(6)
  $4.Timestamp ensureStartTime() => $_ensure(5);

  @$pb.TagNumber(7)
  $4.Timestamp get endTime => $_getN(6);
  @$pb.TagNumber(7)
  set endTime($4.Timestamp v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasEndTime() => $_has(6);
  @$pb.TagNumber(7)
  void clearEndTime() => clearField(7);
  @$pb.TagNumber(7)
  $4.Timestamp ensureEndTime() => $_ensure(6);

  @$pb.TagNumber(8)
  $5.Duration get duration => $_getN(7);
  @$pb.TagNumber(8)
  set duration($5.Duration v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasDuration() => $_has(7);
  @$pb.TagNumber(8)
  void clearDuration() => clearField(8);
  @$pb.TagNumber(8)
  $5.Duration ensureDuration() => $_ensure(7);

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ProcheEvent', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'core'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'location')
    ..a<$core.double>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'latitude', $pb.PbFieldType.OD)
    ..a<$core.double>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'longitude', $pb.PbFieldType.OD)
    ..aOM<$4.Timestamp>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'startTime', subBuilder: $4.Timestamp.create)
    ..aOM<$4.Timestamp>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'endTime', subBuilder: $4.Timestamp.create)
    ..aOM<$5.Duration>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'duration', subBuilder: $5.Duration.create)
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
    $4.Timestamp? startTime,
    $4.Timestamp? endTime,
    $5.Duration? duration,
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
  $4.Timestamp get startTime => $_getN(6);
  @$pb.TagNumber(7)
  set startTime($4.Timestamp v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasStartTime() => $_has(6);
  @$pb.TagNumber(7)
  void clearStartTime() => clearField(7);
  @$pb.TagNumber(7)
  $4.Timestamp ensureStartTime() => $_ensure(6);

  @$pb.TagNumber(8)
  $4.Timestamp get endTime => $_getN(7);
  @$pb.TagNumber(8)
  set endTime($4.Timestamp v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasEndTime() => $_has(7);
  @$pb.TagNumber(8)
  void clearEndTime() => clearField(8);
  @$pb.TagNumber(8)
  $4.Timestamp ensureEndTime() => $_ensure(7);

  @$pb.TagNumber(9)
  $5.Duration get duration => $_getN(8);
  @$pb.TagNumber(9)
  set duration($5.Duration v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasDuration() => $_has(8);
  @$pb.TagNumber(9)
  void clearDuration() => clearField(9);
  @$pb.TagNumber(9)
  $5.Duration ensureDuration() => $_ensure(8);

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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ProcheEventList', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'core'), createEmptyInstance: create)
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

