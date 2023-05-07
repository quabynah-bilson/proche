///
//  Generated code. Do not modify.
//  source: shared.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'shared.pbenum.dart';

export 'shared.pbenum.dart';

class AppVersion extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AppVersion', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'shared'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'version')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'androidUrl', protoName: 'androidUrl')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iosUrl', protoName: 'iosUrl')
    ..e<AppVersion_UpdateType>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updateType', $pb.PbFieldType.OE, protoName: 'updateType', defaultOrMaker: AppVersion_UpdateType.OPTIONAL, valueOf: AppVersion_UpdateType.valueOf, enumValues: AppVersion_UpdateType.values)
    ..hasRequiredFields = false
  ;

  AppVersion._() : super();
  factory AppVersion({
    $core.String? version,
    $core.String? androidUrl,
    $core.String? iosUrl,
    AppVersion_UpdateType? updateType,
  }) {
    final _result = create();
    if (version != null) {
      _result.version = version;
    }
    if (androidUrl != null) {
      _result.androidUrl = androidUrl;
    }
    if (iosUrl != null) {
      _result.iosUrl = iosUrl;
    }
    if (updateType != null) {
      _result.updateType = updateType;
    }
    return _result;
  }
  factory AppVersion.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AppVersion.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AppVersion clone() => AppVersion()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AppVersion copyWith(void Function(AppVersion) updates) => super.copyWith((message) => updates(message as AppVersion)) as AppVersion; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AppVersion create() => AppVersion._();
  AppVersion createEmptyInstance() => create();
  static $pb.PbList<AppVersion> createRepeated() => $pb.PbList<AppVersion>();
  @$core.pragma('dart2js:noInline')
  static AppVersion getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AppVersion>(create);
  static AppVersion? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get version => $_getSZ(0);
  @$pb.TagNumber(1)
  set version($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearVersion() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get androidUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set androidUrl($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAndroidUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearAndroidUrl() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get iosUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set iosUrl($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIosUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearIosUrl() => clearField(3);

  @$pb.TagNumber(4)
  AppVersion_UpdateType get updateType => $_getN(3);
  @$pb.TagNumber(4)
  set updateType(AppVersion_UpdateType v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasUpdateType() => $_has(3);
  @$pb.TagNumber(4)
  void clearUpdateType() => clearField(4);
}

class AddressWithLatLngName extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AddressWithLatLngName', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'shared'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'address')
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'latitude', $pb.PbFieldType.OD)
    ..a<$core.double>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'longitude', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  AddressWithLatLngName._() : super();
  factory AddressWithLatLngName({
    $core.String? name,
    $core.String? address,
    $core.double? latitude,
    $core.double? longitude,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (address != null) {
      _result.address = address;
    }
    if (latitude != null) {
      _result.latitude = latitude;
    }
    if (longitude != null) {
      _result.longitude = longitude;
    }
    return _result;
  }
  factory AddressWithLatLngName.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddressWithLatLngName.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddressWithLatLngName clone() => AddressWithLatLngName()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddressWithLatLngName copyWith(void Function(AddressWithLatLngName) updates) => super.copyWith((message) => updates(message as AddressWithLatLngName)) as AddressWithLatLngName; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AddressWithLatLngName create() => AddressWithLatLngName._();
  AddressWithLatLngName createEmptyInstance() => create();
  static $pb.PbList<AddressWithLatLngName> createRepeated() => $pb.PbList<AddressWithLatLngName>();
  @$core.pragma('dart2js:noInline')
  static AddressWithLatLngName getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddressWithLatLngName>(create);
  static AddressWithLatLngName? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get address => $_getSZ(1);
  @$pb.TagNumber(2)
  set address($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearAddress() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get latitude => $_getN(2);
  @$pb.TagNumber(3)
  set latitude($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLatitude() => $_has(2);
  @$pb.TagNumber(3)
  void clearLatitude() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get longitude => $_getN(3);
  @$pb.TagNumber(4)
  set longitude($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLongitude() => $_has(3);
  @$pb.TagNumber(4)
  void clearLongitude() => clearField(4);
}

