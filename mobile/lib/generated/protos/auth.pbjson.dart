///
//  Generated code. Do not modify.
//  source: auth.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use verifyPhoneRequestDescriptor instead')
const VerifyPhoneRequest$json = const {
  '1': 'VerifyPhoneRequest',
  '2': const [
    const {'1': 'phone_number', '3': 1, '4': 1, '5': 9, '10': 'phoneNumber'},
    const {'1': 'verification_code', '3': 2, '4': 1, '5': 9, '10': 'verificationCode'},
  ],
};

/// Descriptor for `VerifyPhoneRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyPhoneRequestDescriptor = $convert.base64Decode('ChJWZXJpZnlQaG9uZVJlcXVlc3QSIQoMcGhvbmVfbnVtYmVyGAEgASgJUgtwaG9uZU51bWJlchIrChF2ZXJpZmljYXRpb25fY29kZRgCIAEoCVIQdmVyaWZpY2F0aW9uQ29kZQ==');
@$core.Deprecated('Use loginRequestDescriptor instead')
const LoginRequest$json = const {
  '1': 'LoginRequest',
  '2': const [
    const {'1': 'phone_number', '3': 1, '4': 1, '5': 9, '10': 'phoneNumber'},
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
    const {'1': 'language_id', '3': 3, '4': 1, '5': 9, '10': 'languageId'},
  ],
};

/// Descriptor for `LoginRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginRequestDescriptor = $convert.base64Decode('CgxMb2dpblJlcXVlc3QSIQoMcGhvbmVfbnVtYmVyGAEgASgJUgtwaG9uZU51bWJlchIaCghwYXNzd29yZBgCIAEoCVIIcGFzc3dvcmQSHwoLbGFuZ3VhZ2VfaWQYAyABKAlSCmxhbmd1YWdlSWQ=');
@$core.Deprecated('Use authResponseDescriptor instead')
const AuthResponse$json = const {
  '1': 'AuthResponse',
  '2': const [
    const {'1': 'session', '3': 1, '4': 1, '5': 11, '6': '.auth.Session', '10': 'session'},
  ],
};

/// Descriptor for `AuthResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authResponseDescriptor = $convert.base64Decode('CgxBdXRoUmVzcG9uc2USJwoHc2Vzc2lvbhgBIAEoCzINLmF1dGguU2Vzc2lvblIHc2Vzc2lvbg==');
@$core.Deprecated('Use registerRequestDescriptor instead')
const RegisterRequest$json = const {
  '1': 'RegisterRequest',
  '2': const [
    const {'1': 'phone_number', '3': 1, '4': 1, '5': 9, '10': 'phoneNumber'},
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
    const {'1': 'language_id', '3': 3, '4': 1, '5': 9, '10': 'languageId'},
    const {'1': 'display_name', '3': 4, '4': 1, '5': 9, '10': 'displayName'},
    const {'1': 'avatar_url', '3': 5, '4': 1, '5': 9, '9': 0, '10': 'avatarUrl', '17': true},
    const {'1': 'referral_code', '3': 6, '4': 1, '5': 9, '9': 1, '10': 'referralCode', '17': true},
    const {'1': 'id_card_url', '3': 7, '4': 1, '5': 9, '9': 2, '10': 'idCardUrl', '17': true},
    const {'1': 'vaccine_card_url', '3': 8, '4': 1, '5': 9, '9': 3, '10': 'vaccineCardUrl', '17': true},
  ],
  '8': const [
    const {'1': '_avatar_url'},
    const {'1': '_referral_code'},
    const {'1': '_id_card_url'},
    const {'1': '_vaccine_card_url'},
  ],
};

/// Descriptor for `RegisterRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerRequestDescriptor = $convert.base64Decode('Cg9SZWdpc3RlclJlcXVlc3QSIQoMcGhvbmVfbnVtYmVyGAEgASgJUgtwaG9uZU51bWJlchIaCghwYXNzd29yZBgCIAEoCVIIcGFzc3dvcmQSHwoLbGFuZ3VhZ2VfaWQYAyABKAlSCmxhbmd1YWdlSWQSIQoMZGlzcGxheV9uYW1lGAQgASgJUgtkaXNwbGF5TmFtZRIiCgphdmF0YXJfdXJsGAUgASgJSABSCWF2YXRhclVybIgBARIoCg1yZWZlcnJhbF9jb2RlGAYgASgJSAFSDHJlZmVycmFsQ29kZYgBARIjCgtpZF9jYXJkX3VybBgHIAEoCUgCUglpZENhcmRVcmyIAQESLQoQdmFjY2luZV9jYXJkX3VybBgIIAEoCUgDUg52YWNjaW5lQ2FyZFVybIgBAUINCgtfYXZhdGFyX3VybEIQCg5fcmVmZXJyYWxfY29kZUIOCgxfaWRfY2FyZF91cmxCEwoRX3ZhY2NpbmVfY2FyZF91cmw=');
@$core.Deprecated('Use resetPasswordRequestDescriptor instead')
const ResetPasswordRequest$json = const {
  '1': 'ResetPasswordRequest',
  '2': const [
    const {'1': 'phone_number', '3': 1, '4': 1, '5': 9, '10': 'phoneNumber'},
    const {'1': 'language_id', '3': 3, '4': 1, '5': 9, '10': 'languageId'},
  ],
};

/// Descriptor for `ResetPasswordRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resetPasswordRequestDescriptor = $convert.base64Decode('ChRSZXNldFBhc3N3b3JkUmVxdWVzdBIhCgxwaG9uZV9udW1iZXIYASABKAlSC3Bob25lTnVtYmVyEh8KC2xhbmd1YWdlX2lkGAMgASgJUgpsYW5ndWFnZUlk');
@$core.Deprecated('Use accountDescriptor instead')
const Account$json = const {
  '1': 'Account',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'phone_number', '3': 2, '4': 1, '5': 9, '10': 'phoneNumber'},
    const {'1': 'display_name', '3': 3, '4': 1, '5': 9, '10': 'displayName'},
    const {'1': 'language_id', '3': 4, '4': 1, '5': 9, '10': 'languageId'},
    const {'1': 'created_at', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    const {'1': 'updated_at', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
    const {'1': 'avatar_url', '3': 7, '4': 1, '5': 9, '9': 0, '10': 'avatarUrl', '17': true},
    const {'1': 'id_card_url', '3': 8, '4': 1, '5': 9, '9': 1, '10': 'idCardUrl', '17': true},
    const {'1': 'vaccine_card_url', '3': 9, '4': 1, '5': 9, '9': 2, '10': 'vaccineCardUrl', '17': true},
    const {'1': 'referral_code', '3': 10, '4': 1, '5': 9, '9': 3, '10': 'referralCode', '17': true},
  ],
  '8': const [
    const {'1': '_avatar_url'},
    const {'1': '_id_card_url'},
    const {'1': '_vaccine_card_url'},
    const {'1': '_referral_code'},
  ],
};

/// Descriptor for `Account`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List accountDescriptor = $convert.base64Decode('CgdBY2NvdW50Eg4KAmlkGAEgASgJUgJpZBIhCgxwaG9uZV9udW1iZXIYAiABKAlSC3Bob25lTnVtYmVyEiEKDGRpc3BsYXlfbmFtZRgDIAEoCVILZGlzcGxheU5hbWUSHwoLbGFuZ3VhZ2VfaWQYBCABKAlSCmxhbmd1YWdlSWQSOQoKY3JlYXRlZF9hdBgFIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCWNyZWF0ZWRBdBI5Cgp1cGRhdGVkX2F0GAYgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJdXBkYXRlZEF0EiIKCmF2YXRhcl91cmwYByABKAlIAFIJYXZhdGFyVXJsiAEBEiMKC2lkX2NhcmRfdXJsGAggASgJSAFSCWlkQ2FyZFVybIgBARItChB2YWNjaW5lX2NhcmRfdXJsGAkgASgJSAJSDnZhY2NpbmVDYXJkVXJsiAEBEigKDXJlZmVycmFsX2NvZGUYCiABKAlIA1IMcmVmZXJyYWxDb2RliAEBQg0KC19hdmF0YXJfdXJsQg4KDF9pZF9jYXJkX3VybEITChFfdmFjY2luZV9jYXJkX3VybEIQCg5fcmVmZXJyYWxfY29kZQ==');
@$core.Deprecated('Use sessionDescriptor instead')
const Session$json = const {
  '1': 'Session',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'access_token', '3': 2, '4': 1, '5': 9, '10': 'accessToken'},
    const {'1': 'account_id', '3': 3, '4': 1, '5': 9, '10': 'accountId'},
    const {'1': 'language_id', '3': 4, '4': 1, '5': 9, '10': 'languageId'},
    const {'1': 'created_at', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    const {'1': 'access_token_expires_at', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'accessTokenExpiresAt'},
    const {'1': 'refresh_token', '3': 7, '4': 1, '5': 9, '10': 'refreshToken'},
    const {'1': 'refresh_token_expires_at', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'refreshTokenExpiresAt'},
  ],
};

/// Descriptor for `Session`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sessionDescriptor = $convert.base64Decode('CgdTZXNzaW9uEg4KAmlkGAEgASgJUgJpZBIhCgxhY2Nlc3NfdG9rZW4YAiABKAlSC2FjY2Vzc1Rva2VuEh0KCmFjY291bnRfaWQYAyABKAlSCWFjY291bnRJZBIfCgtsYW5ndWFnZV9pZBgEIAEoCVIKbGFuZ3VhZ2VJZBI5CgpjcmVhdGVkX2F0GAUgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJY3JlYXRlZEF0ElEKF2FjY2Vzc190b2tlbl9leHBpcmVzX2F0GAYgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIUYWNjZXNzVG9rZW5FeHBpcmVzQXQSIwoNcmVmcmVzaF90b2tlbhgHIAEoCVIMcmVmcmVzaFRva2VuElMKGHJlZnJlc2hfdG9rZW5fZXhwaXJlc19hdBgIIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSFXJlZnJlc2hUb2tlbkV4cGlyZXNBdA==');
