///
//  Generated code. Do not modify.
//  source: giveaway.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'core_shared.pb.dart' as $2;
import 'package:protobuf_google/protobuf_google.dart' as $8;
import 'package:protobuf_google/protobuf_google.dart' as $7;

import 'giveaway.pbenum.dart';

export 'giveaway.pbenum.dart';

class GiveAwayList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GiveAwayList', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'event'), createEmptyInstance: create)
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateGiveAwayRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'event'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..pPS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'images')
    ..aOM<$2.CommonAddress>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'address', subBuilder: $2.CommonAddress.create)
    ..e<GiveAwayDispatchType>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dispatchType', $pb.PbFieldType.OE, defaultOrMaker: GiveAwayDispatchType.GIVEAWAY_PICKUP, valueOf: GiveAwayDispatchType.valueOf, enumValues: GiveAwayDispatchType.values)
    ..aOM<$8.Duration>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dispatchDuration', subBuilder: $8.Duration.create)
    ..hasRequiredFields = false
  ;

  CreateGiveAwayRequest._() : super();
  factory CreateGiveAwayRequest({
    $core.String? name,
    $core.String? description,
    $core.Iterable<$core.String>? images,
    $2.CommonAddress? address,
    GiveAwayDispatchType? dispatchType,
    $8.Duration? dispatchDuration,
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
  $2.CommonAddress get address => $_getN(3);
  @$pb.TagNumber(4)
  set address($2.CommonAddress v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasAddress() => $_has(3);
  @$pb.TagNumber(4)
  void clearAddress() => clearField(4);
  @$pb.TagNumber(4)
  $2.CommonAddress ensureAddress() => $_ensure(3);

  @$pb.TagNumber(5)
  GiveAwayDispatchType get dispatchType => $_getN(4);
  @$pb.TagNumber(5)
  set dispatchType(GiveAwayDispatchType v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasDispatchType() => $_has(4);
  @$pb.TagNumber(5)
  void clearDispatchType() => clearField(5);

  @$pb.TagNumber(6)
  $8.Duration get dispatchDuration => $_getN(5);
  @$pb.TagNumber(6)
  set dispatchDuration($8.Duration v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasDispatchDuration() => $_has(5);
  @$pb.TagNumber(6)
  void clearDispatchDuration() => clearField(6);
  @$pb.TagNumber(6)
  $8.Duration ensureDispatchDuration() => $_ensure(5);
}

class GiveAway extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GiveAway', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'event'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..pPS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'images')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'owner')
    ..aOM<$7.Timestamp>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdAt', subBuilder: $7.Timestamp.create)
    ..aOM<$7.Timestamp>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updatedAt', subBuilder: $7.Timestamp.create)
    ..aOM<$2.CommonAddress>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'address', subBuilder: $2.CommonAddress.create)
    ..hasRequiredFields = false
  ;

  GiveAway._() : super();
  factory GiveAway({
    $core.String? id,
    $core.String? name,
    $core.String? description,
    $core.Iterable<$core.String>? images,
    $core.String? owner,
    $7.Timestamp? createdAt,
    $7.Timestamp? updatedAt,
    $2.CommonAddress? address,
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
  $7.Timestamp get createdAt => $_getN(5);
  @$pb.TagNumber(6)
  set createdAt($7.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasCreatedAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreatedAt() => clearField(6);
  @$pb.TagNumber(6)
  $7.Timestamp ensureCreatedAt() => $_ensure(5);

  @$pb.TagNumber(7)
  $7.Timestamp get updatedAt => $_getN(6);
  @$pb.TagNumber(7)
  set updatedAt($7.Timestamp v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasUpdatedAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearUpdatedAt() => clearField(7);
  @$pb.TagNumber(7)
  $7.Timestamp ensureUpdatedAt() => $_ensure(6);

  @$pb.TagNumber(8)
  $2.CommonAddress get address => $_getN(7);
  @$pb.TagNumber(8)
  set address($2.CommonAddress v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasAddress() => $_has(7);
  @$pb.TagNumber(8)
  void clearAddress() => clearField(8);
  @$pb.TagNumber(8)
  $2.CommonAddress ensureAddress() => $_ensure(7);
}

