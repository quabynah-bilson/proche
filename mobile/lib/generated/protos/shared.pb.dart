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

class AppService extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AppService', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'shared'), createEmptyInstance: create)
    ..e<AppServiceCredential>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'credential', $pb.PbFieldType.OE, defaultOrMaker: AppServiceCredential.google_auth, valueOf: AppServiceCredential.valueOf, enumValues: AppServiceCredential.values)
    ..hasRequiredFields = false
  ;

  AppService._() : super();
  factory AppService({
    AppServiceCredential? credential,
  }) {
    final _result = create();
    if (credential != null) {
      _result.credential = credential;
    }
    return _result;
  }
  factory AppService.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AppService.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AppService clone() => AppService()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AppService copyWith(void Function(AppService) updates) => super.copyWith((message) => updates(message as AppService)) as AppService; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AppService create() => AppService._();
  AppService createEmptyInstance() => create();
  static $pb.PbList<AppService> createRepeated() => $pb.PbList<AppService>();
  @$core.pragma('dart2js:noInline')
  static AppService getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AppService>(create);
  static AppService? _defaultInstance;

  @$pb.TagNumber(1)
  AppServiceCredential get credential => $_getN(0);
  @$pb.TagNumber(1)
  set credential(AppServiceCredential v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCredential() => $_has(0);
  @$pb.TagNumber(1)
  void clearCredential() => clearField(1);
}

class AppServiceResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AppServiceResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'shared'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'encodedKey')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'encodedSecret')
    ..e<AppServiceCredential>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'credential', $pb.PbFieldType.OE, defaultOrMaker: AppServiceCredential.google_auth, valueOf: AppServiceCredential.valueOf, enumValues: AppServiceCredential.values)
    ..hasRequiredFields = false
  ;

  AppServiceResponse._() : super();
  factory AppServiceResponse({
    $core.String? encodedKey,
    $core.String? encodedSecret,
    AppServiceCredential? credential,
  }) {
    final _result = create();
    if (encodedKey != null) {
      _result.encodedKey = encodedKey;
    }
    if (encodedSecret != null) {
      _result.encodedSecret = encodedSecret;
    }
    if (credential != null) {
      _result.credential = credential;
    }
    return _result;
  }
  factory AppServiceResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AppServiceResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AppServiceResponse clone() => AppServiceResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AppServiceResponse copyWith(void Function(AppServiceResponse) updates) => super.copyWith((message) => updates(message as AppServiceResponse)) as AppServiceResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AppServiceResponse create() => AppServiceResponse._();
  AppServiceResponse createEmptyInstance() => create();
  static $pb.PbList<AppServiceResponse> createRepeated() => $pb.PbList<AppServiceResponse>();
  @$core.pragma('dart2js:noInline')
  static AppServiceResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AppServiceResponse>(create);
  static AppServiceResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get encodedKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set encodedKey($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEncodedKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearEncodedKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get encodedSecret => $_getSZ(1);
  @$pb.TagNumber(2)
  set encodedSecret($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEncodedSecret() => $_has(1);
  @$pb.TagNumber(2)
  void clearEncodedSecret() => clearField(2);

  @$pb.TagNumber(3)
  AppServiceCredential get credential => $_getN(2);
  @$pb.TagNumber(3)
  set credential(AppServiceCredential v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasCredential() => $_has(2);
  @$pb.TagNumber(3)
  void clearCredential() => clearField(3);
}

class ApiVersionResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ApiVersionResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'shared'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'version')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'shouldUpgrade')
    ..hasRequiredFields = false
  ;

  ApiVersionResponse._() : super();
  factory ApiVersionResponse({
    $core.String? version,
    $core.bool? shouldUpgrade,
  }) {
    final _result = create();
    if (version != null) {
      _result.version = version;
    }
    if (shouldUpgrade != null) {
      _result.shouldUpgrade = shouldUpgrade;
    }
    return _result;
  }
  factory ApiVersionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ApiVersionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ApiVersionResponse clone() => ApiVersionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ApiVersionResponse copyWith(void Function(ApiVersionResponse) updates) => super.copyWith((message) => updates(message as ApiVersionResponse)) as ApiVersionResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiVersionResponse create() => ApiVersionResponse._();
  ApiVersionResponse createEmptyInstance() => create();
  static $pb.PbList<ApiVersionResponse> createRepeated() => $pb.PbList<ApiVersionResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiVersionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ApiVersionResponse>(create);
  static ApiVersionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get version => $_getSZ(0);
  @$pb.TagNumber(1)
  set version($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearVersion() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get shouldUpgrade => $_getBF(1);
  @$pb.TagNumber(2)
  set shouldUpgrade($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasShouldUpgrade() => $_has(1);
  @$pb.TagNumber(2)
  void clearShouldUpgrade() => clearField(2);
}

