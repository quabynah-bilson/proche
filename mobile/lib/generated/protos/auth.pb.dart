///
//  Generated code. Do not modify.
//  source: auth.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'package:protobuf_google/protobuf_google.dart' as $3;

class GetCountriesResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetCountriesResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'auth'), createEmptyInstance: create)
    ..pc<Country>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'countries', $pb.PbFieldType.PM, subBuilder: Country.create)
    ..hasRequiredFields = false
  ;

  GetCountriesResponse._() : super();
  factory GetCountriesResponse({
    $core.Iterable<Country>? countries,
  }) {
    final _result = create();
    if (countries != null) {
      _result.countries.addAll(countries);
    }
    return _result;
  }
  factory GetCountriesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetCountriesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetCountriesResponse clone() => GetCountriesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetCountriesResponse copyWith(void Function(GetCountriesResponse) updates) => super.copyWith((message) => updates(message as GetCountriesResponse)) as GetCountriesResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetCountriesResponse create() => GetCountriesResponse._();
  GetCountriesResponse createEmptyInstance() => create();
  static $pb.PbList<GetCountriesResponse> createRepeated() => $pb.PbList<GetCountriesResponse>();
  @$core.pragma('dart2js:noInline')
  static GetCountriesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetCountriesResponse>(create);
  static GetCountriesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Country> get countries => $_getList(0);
}

class ValidateAccessTokenResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ValidateAccessTokenResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'auth'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'accountId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'phoneNumber')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'displayName')
    ..hasRequiredFields = false
  ;

  ValidateAccessTokenResponse._() : super();
  factory ValidateAccessTokenResponse({
    $core.String? accountId,
    $core.String? phoneNumber,
    $core.String? displayName,
  }) {
    final _result = create();
    if (accountId != null) {
      _result.accountId = accountId;
    }
    if (phoneNumber != null) {
      _result.phoneNumber = phoneNumber;
    }
    if (displayName != null) {
      _result.displayName = displayName;
    }
    return _result;
  }
  factory ValidateAccessTokenResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ValidateAccessTokenResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ValidateAccessTokenResponse clone() => ValidateAccessTokenResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ValidateAccessTokenResponse copyWith(void Function(ValidateAccessTokenResponse) updates) => super.copyWith((message) => updates(message as ValidateAccessTokenResponse)) as ValidateAccessTokenResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ValidateAccessTokenResponse create() => ValidateAccessTokenResponse._();
  ValidateAccessTokenResponse createEmptyInstance() => create();
  static $pb.PbList<ValidateAccessTokenResponse> createRepeated() => $pb.PbList<ValidateAccessTokenResponse>();
  @$core.pragma('dart2js:noInline')
  static ValidateAccessTokenResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ValidateAccessTokenResponse>(create);
  static ValidateAccessTokenResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accountId => $_getSZ(0);
  @$pb.TagNumber(1)
  set accountId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccountId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get phoneNumber => $_getSZ(1);
  @$pb.TagNumber(2)
  set phoneNumber($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPhoneNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearPhoneNumber() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get displayName => $_getSZ(2);
  @$pb.TagNumber(3)
  set displayName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDisplayName() => $_has(2);
  @$pb.TagNumber(3)
  void clearDisplayName() => clearField(3);
}

class VerifyPhoneRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'VerifyPhoneRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'auth'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'phoneNumber')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'verificationCode')
    ..hasRequiredFields = false
  ;

  VerifyPhoneRequest._() : super();
  factory VerifyPhoneRequest({
    $core.String? phoneNumber,
    $core.String? verificationCode,
  }) {
    final _result = create();
    if (phoneNumber != null) {
      _result.phoneNumber = phoneNumber;
    }
    if (verificationCode != null) {
      _result.verificationCode = verificationCode;
    }
    return _result;
  }
  factory VerifyPhoneRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VerifyPhoneRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VerifyPhoneRequest clone() => VerifyPhoneRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VerifyPhoneRequest copyWith(void Function(VerifyPhoneRequest) updates) => super.copyWith((message) => updates(message as VerifyPhoneRequest)) as VerifyPhoneRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VerifyPhoneRequest create() => VerifyPhoneRequest._();
  VerifyPhoneRequest createEmptyInstance() => create();
  static $pb.PbList<VerifyPhoneRequest> createRepeated() => $pb.PbList<VerifyPhoneRequest>();
  @$core.pragma('dart2js:noInline')
  static VerifyPhoneRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VerifyPhoneRequest>(create);
  static VerifyPhoneRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get phoneNumber => $_getSZ(0);
  @$pb.TagNumber(1)
  set phoneNumber($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPhoneNumber() => $_has(0);
  @$pb.TagNumber(1)
  void clearPhoneNumber() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get verificationCode => $_getSZ(1);
  @$pb.TagNumber(2)
  set verificationCode($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasVerificationCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearVerificationCode() => clearField(2);
}

class LoginRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LoginRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'auth'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'phoneNumber')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'password')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'countryId')
    ..hasRequiredFields = false
  ;

  LoginRequest._() : super();
  factory LoginRequest({
    $core.String? phoneNumber,
    $core.String? password,
    $core.String? countryId,
  }) {
    final _result = create();
    if (phoneNumber != null) {
      _result.phoneNumber = phoneNumber;
    }
    if (password != null) {
      _result.password = password;
    }
    if (countryId != null) {
      _result.countryId = countryId;
    }
    return _result;
  }
  factory LoginRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoginRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoginRequest clone() => LoginRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoginRequest copyWith(void Function(LoginRequest) updates) => super.copyWith((message) => updates(message as LoginRequest)) as LoginRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LoginRequest create() => LoginRequest._();
  LoginRequest createEmptyInstance() => create();
  static $pb.PbList<LoginRequest> createRepeated() => $pb.PbList<LoginRequest>();
  @$core.pragma('dart2js:noInline')
  static LoginRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginRequest>(create);
  static LoginRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get phoneNumber => $_getSZ(0);
  @$pb.TagNumber(1)
  set phoneNumber($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPhoneNumber() => $_has(0);
  @$pb.TagNumber(1)
  void clearPhoneNumber() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get countryId => $_getSZ(2);
  @$pb.TagNumber(3)
  set countryId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCountryId() => $_has(2);
  @$pb.TagNumber(3)
  void clearCountryId() => clearField(3);
}

class RegisterRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RegisterRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'auth'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'phoneNumber')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'password')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'displayName')
    ..a<$core.List<$core.int>>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'avatarUrl', $pb.PbFieldType.OY)
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'referralCode')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'idCardUrl')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'vaccineCardUrl')
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'countryId')
    ..hasRequiredFields = false
  ;

  RegisterRequest._() : super();
  factory RegisterRequest({
    $core.String? phoneNumber,
    $core.String? password,
    $core.String? displayName,
    $core.List<$core.int>? avatarUrl,
    $core.String? referralCode,
    $core.String? idCardUrl,
    $core.String? vaccineCardUrl,
    $core.String? countryId,
  }) {
    final _result = create();
    if (phoneNumber != null) {
      _result.phoneNumber = phoneNumber;
    }
    if (password != null) {
      _result.password = password;
    }
    if (displayName != null) {
      _result.displayName = displayName;
    }
    if (avatarUrl != null) {
      _result.avatarUrl = avatarUrl;
    }
    if (referralCode != null) {
      _result.referralCode = referralCode;
    }
    if (idCardUrl != null) {
      _result.idCardUrl = idCardUrl;
    }
    if (vaccineCardUrl != null) {
      _result.vaccineCardUrl = vaccineCardUrl;
    }
    if (countryId != null) {
      _result.countryId = countryId;
    }
    return _result;
  }
  factory RegisterRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RegisterRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RegisterRequest clone() => RegisterRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RegisterRequest copyWith(void Function(RegisterRequest) updates) => super.copyWith((message) => updates(message as RegisterRequest)) as RegisterRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RegisterRequest create() => RegisterRequest._();
  RegisterRequest createEmptyInstance() => create();
  static $pb.PbList<RegisterRequest> createRepeated() => $pb.PbList<RegisterRequest>();
  @$core.pragma('dart2js:noInline')
  static RegisterRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RegisterRequest>(create);
  static RegisterRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get phoneNumber => $_getSZ(0);
  @$pb.TagNumber(1)
  set phoneNumber($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPhoneNumber() => $_has(0);
  @$pb.TagNumber(1)
  void clearPhoneNumber() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);

  @$pb.TagNumber(4)
  $core.String get displayName => $_getSZ(2);
  @$pb.TagNumber(4)
  set displayName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasDisplayName() => $_has(2);
  @$pb.TagNumber(4)
  void clearDisplayName() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.int> get avatarUrl => $_getN(3);
  @$pb.TagNumber(5)
  set avatarUrl($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(5)
  $core.bool hasAvatarUrl() => $_has(3);
  @$pb.TagNumber(5)
  void clearAvatarUrl() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get referralCode => $_getSZ(4);
  @$pb.TagNumber(6)
  set referralCode($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(6)
  $core.bool hasReferralCode() => $_has(4);
  @$pb.TagNumber(6)
  void clearReferralCode() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get idCardUrl => $_getSZ(5);
  @$pb.TagNumber(7)
  set idCardUrl($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(7)
  $core.bool hasIdCardUrl() => $_has(5);
  @$pb.TagNumber(7)
  void clearIdCardUrl() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get vaccineCardUrl => $_getSZ(6);
  @$pb.TagNumber(8)
  set vaccineCardUrl($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(8)
  $core.bool hasVaccineCardUrl() => $_has(6);
  @$pb.TagNumber(8)
  void clearVaccineCardUrl() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get countryId => $_getSZ(7);
  @$pb.TagNumber(9)
  set countryId($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(9)
  $core.bool hasCountryId() => $_has(7);
  @$pb.TagNumber(9)
  void clearCountryId() => clearField(9);
}

class ResetPasswordRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ResetPasswordRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'auth'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'phoneNumber')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'password')
    ..hasRequiredFields = false
  ;

  ResetPasswordRequest._() : super();
  factory ResetPasswordRequest({
    $core.String? phoneNumber,
    $core.String? password,
  }) {
    final _result = create();
    if (phoneNumber != null) {
      _result.phoneNumber = phoneNumber;
    }
    if (password != null) {
      _result.password = password;
    }
    return _result;
  }
  factory ResetPasswordRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResetPasswordRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResetPasswordRequest clone() => ResetPasswordRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResetPasswordRequest copyWith(void Function(ResetPasswordRequest) updates) => super.copyWith((message) => updates(message as ResetPasswordRequest)) as ResetPasswordRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResetPasswordRequest create() => ResetPasswordRequest._();
  ResetPasswordRequest createEmptyInstance() => create();
  static $pb.PbList<ResetPasswordRequest> createRepeated() => $pb.PbList<ResetPasswordRequest>();
  @$core.pragma('dart2js:noInline')
  static ResetPasswordRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResetPasswordRequest>(create);
  static ResetPasswordRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get phoneNumber => $_getSZ(0);
  @$pb.TagNumber(1)
  set phoneNumber($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPhoneNumber() => $_has(0);
  @$pb.TagNumber(1)
  void clearPhoneNumber() => clearField(1);

  @$pb.TagNumber(4)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(4)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(4)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(4)
  void clearPassword() => clearField(4);
}

class Account extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Account', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'auth'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'phoneNumber')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'displayName')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'languageId')
    ..aOM<$3.Timestamp>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdAt', subBuilder: $3.Timestamp.create)
    ..aOM<$3.Timestamp>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updatedAt', subBuilder: $3.Timestamp.create)
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'avatarUrl')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'idCardUrl')
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'vaccineCardUrl')
    ..aOS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'referralCode')
    ..aOS(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'countryId')
    ..aOS(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId')
    ..aOS(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceToken')
    ..aOS(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceType')
    ..hasRequiredFields = false
  ;

  Account._() : super();
  factory Account({
    $core.String? id,
    $core.String? phoneNumber,
    $core.String? displayName,
    $core.String? languageId,
    $3.Timestamp? createdAt,
    $3.Timestamp? updatedAt,
    $core.String? avatarUrl,
    $core.String? idCardUrl,
    $core.String? vaccineCardUrl,
    $core.String? referralCode,
    $core.String? countryId,
    $core.String? deviceId,
    $core.String? deviceToken,
    $core.String? deviceType,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (phoneNumber != null) {
      _result.phoneNumber = phoneNumber;
    }
    if (displayName != null) {
      _result.displayName = displayName;
    }
    if (languageId != null) {
      _result.languageId = languageId;
    }
    if (createdAt != null) {
      _result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      _result.updatedAt = updatedAt;
    }
    if (avatarUrl != null) {
      _result.avatarUrl = avatarUrl;
    }
    if (idCardUrl != null) {
      _result.idCardUrl = idCardUrl;
    }
    if (vaccineCardUrl != null) {
      _result.vaccineCardUrl = vaccineCardUrl;
    }
    if (referralCode != null) {
      _result.referralCode = referralCode;
    }
    if (countryId != null) {
      _result.countryId = countryId;
    }
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (deviceToken != null) {
      _result.deviceToken = deviceToken;
    }
    if (deviceType != null) {
      _result.deviceType = deviceType;
    }
    return _result;
  }
  factory Account.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Account.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Account clone() => Account()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Account copyWith(void Function(Account) updates) => super.copyWith((message) => updates(message as Account)) as Account; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Account create() => Account._();
  Account createEmptyInstance() => create();
  static $pb.PbList<Account> createRepeated() => $pb.PbList<Account>();
  @$core.pragma('dart2js:noInline')
  static Account getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Account>(create);
  static Account? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get phoneNumber => $_getSZ(1);
  @$pb.TagNumber(2)
  set phoneNumber($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPhoneNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearPhoneNumber() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get displayName => $_getSZ(2);
  @$pb.TagNumber(3)
  set displayName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDisplayName() => $_has(2);
  @$pb.TagNumber(3)
  void clearDisplayName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get languageId => $_getSZ(3);
  @$pb.TagNumber(4)
  set languageId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLanguageId() => $_has(3);
  @$pb.TagNumber(4)
  void clearLanguageId() => clearField(4);

  @$pb.TagNumber(5)
  $3.Timestamp get createdAt => $_getN(4);
  @$pb.TagNumber(5)
  set createdAt($3.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasCreatedAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreatedAt() => clearField(5);
  @$pb.TagNumber(5)
  $3.Timestamp ensureCreatedAt() => $_ensure(4);

  @$pb.TagNumber(6)
  $3.Timestamp get updatedAt => $_getN(5);
  @$pb.TagNumber(6)
  set updatedAt($3.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasUpdatedAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearUpdatedAt() => clearField(6);
  @$pb.TagNumber(6)
  $3.Timestamp ensureUpdatedAt() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.String get avatarUrl => $_getSZ(6);
  @$pb.TagNumber(7)
  set avatarUrl($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasAvatarUrl() => $_has(6);
  @$pb.TagNumber(7)
  void clearAvatarUrl() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get idCardUrl => $_getSZ(7);
  @$pb.TagNumber(8)
  set idCardUrl($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasIdCardUrl() => $_has(7);
  @$pb.TagNumber(8)
  void clearIdCardUrl() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get vaccineCardUrl => $_getSZ(8);
  @$pb.TagNumber(9)
  set vaccineCardUrl($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasVaccineCardUrl() => $_has(8);
  @$pb.TagNumber(9)
  void clearVaccineCardUrl() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get referralCode => $_getSZ(9);
  @$pb.TagNumber(10)
  set referralCode($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasReferralCode() => $_has(9);
  @$pb.TagNumber(10)
  void clearReferralCode() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get countryId => $_getSZ(10);
  @$pb.TagNumber(11)
  set countryId($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasCountryId() => $_has(10);
  @$pb.TagNumber(11)
  void clearCountryId() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get deviceId => $_getSZ(11);
  @$pb.TagNumber(12)
  set deviceId($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasDeviceId() => $_has(11);
  @$pb.TagNumber(12)
  void clearDeviceId() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get deviceToken => $_getSZ(12);
  @$pb.TagNumber(13)
  set deviceToken($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasDeviceToken() => $_has(12);
  @$pb.TagNumber(13)
  void clearDeviceToken() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get deviceType => $_getSZ(13);
  @$pb.TagNumber(14)
  set deviceType($core.String v) { $_setString(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasDeviceType() => $_has(13);
  @$pb.TagNumber(14)
  void clearDeviceType() => clearField(14);
}

class AccessTokenStore extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AccessTokenStore', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'auth'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'accessToken')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'refreshToken')
    ..hasRequiredFields = false
  ;

  AccessTokenStore._() : super();
  factory AccessTokenStore({
    $core.String? accessToken,
    $core.String? refreshToken,
  }) {
    final _result = create();
    if (accessToken != null) {
      _result.accessToken = accessToken;
    }
    if (refreshToken != null) {
      _result.refreshToken = refreshToken;
    }
    return _result;
  }
  factory AccessTokenStore.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AccessTokenStore.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AccessTokenStore clone() => AccessTokenStore()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AccessTokenStore copyWith(void Function(AccessTokenStore) updates) => super.copyWith((message) => updates(message as AccessTokenStore)) as AccessTokenStore; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AccessTokenStore create() => AccessTokenStore._();
  AccessTokenStore createEmptyInstance() => create();
  static $pb.PbList<AccessTokenStore> createRepeated() => $pb.PbList<AccessTokenStore>();
  @$core.pragma('dart2js:noInline')
  static AccessTokenStore getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AccessTokenStore>(create);
  static AccessTokenStore? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accessToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set accessToken($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccessToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccessToken() => clearField(1);

  @$pb.TagNumber(3)
  $core.String get refreshToken => $_getSZ(1);
  @$pb.TagNumber(3)
  set refreshToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasRefreshToken() => $_has(1);
  @$pb.TagNumber(3)
  void clearRefreshToken() => clearField(3);
}

class Country extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Country', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'auth'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dialCode')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'currency')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'currencySymbol')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'flagUrl')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'languageId')
    ..hasRequiredFields = false
  ;

  Country._() : super();
  factory Country({
    $core.String? id,
    $core.String? name,
    $core.String? code,
    $core.String? dialCode,
    $core.String? currency,
    $core.String? currencySymbol,
    $core.String? flagUrl,
    $core.String? languageId,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (code != null) {
      _result.code = code;
    }
    if (dialCode != null) {
      _result.dialCode = dialCode;
    }
    if (currency != null) {
      _result.currency = currency;
    }
    if (currencySymbol != null) {
      _result.currencySymbol = currencySymbol;
    }
    if (flagUrl != null) {
      _result.flagUrl = flagUrl;
    }
    if (languageId != null) {
      _result.languageId = languageId;
    }
    return _result;
  }
  factory Country.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Country.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Country clone() => Country()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Country copyWith(void Function(Country) updates) => super.copyWith((message) => updates(message as Country)) as Country; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Country create() => Country._();
  Country createEmptyInstance() => create();
  static $pb.PbList<Country> createRepeated() => $pb.PbList<Country>();
  @$core.pragma('dart2js:noInline')
  static Country getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Country>(create);
  static Country? _defaultInstance;

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
  $core.String get code => $_getSZ(2);
  @$pb.TagNumber(3)
  set code($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCode() => $_has(2);
  @$pb.TagNumber(3)
  void clearCode() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get dialCode => $_getSZ(3);
  @$pb.TagNumber(4)
  set dialCode($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDialCode() => $_has(3);
  @$pb.TagNumber(4)
  void clearDialCode() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get currency => $_getSZ(4);
  @$pb.TagNumber(5)
  set currency($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCurrency() => $_has(4);
  @$pb.TagNumber(5)
  void clearCurrency() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get currencySymbol => $_getSZ(5);
  @$pb.TagNumber(6)
  set currencySymbol($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCurrencySymbol() => $_has(5);
  @$pb.TagNumber(6)
  void clearCurrencySymbol() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get flagUrl => $_getSZ(6);
  @$pb.TagNumber(7)
  set flagUrl($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasFlagUrl() => $_has(6);
  @$pb.TagNumber(7)
  void clearFlagUrl() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get languageId => $_getSZ(7);
  @$pb.TagNumber(8)
  set languageId($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasLanguageId() => $_has(7);
  @$pb.TagNumber(8)
  void clearLanguageId() => clearField(8);
}

