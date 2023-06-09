///
//  Generated code. Do not modify.
//  source: auth.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use createBusinessAccountRequestDescriptor instead')
const CreateBusinessAccountRequest$json = const {
  '1': 'CreateBusinessAccountRequest',
  '2': const [
    const {'1': 'account_id', '3': 1, '4': 1, '5': 9, '10': 'accountId'},
    const {'1': 'specialization', '3': 2, '4': 1, '5': 9, '10': 'specialization'},
    const {'1': 'hourly_rate', '3': 3, '4': 1, '5': 1, '10': 'hourlyRate'},
  ],
};

/// Descriptor for `CreateBusinessAccountRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createBusinessAccountRequestDescriptor = $convert.base64Decode('ChxDcmVhdGVCdXNpbmVzc0FjY291bnRSZXF1ZXN0Eh0KCmFjY291bnRfaWQYASABKAlSCWFjY291bnRJZBImCg5zcGVjaWFsaXphdGlvbhgCIAEoCVIOc3BlY2lhbGl6YXRpb24SHwoLaG91cmx5X3JhdGUYAyABKAFSCmhvdXJseVJhdGU=');
@$core.Deprecated('Use getCountriesResponseDescriptor instead')
const GetCountriesResponse$json = const {
  '1': 'GetCountriesResponse',
  '2': const [
    const {'1': 'countries', '3': 1, '4': 3, '5': 11, '6': '.auth.Country', '10': 'countries'},
  ],
};

/// Descriptor for `GetCountriesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCountriesResponseDescriptor = $convert.base64Decode('ChRHZXRDb3VudHJpZXNSZXNwb25zZRIrCgljb3VudHJpZXMYASADKAsyDS5hdXRoLkNvdW50cnlSCWNvdW50cmllcw==');
@$core.Deprecated('Use validateAccessTokenResponseDescriptor instead')
const ValidateAccessTokenResponse$json = const {
  '1': 'ValidateAccessTokenResponse',
  '2': const [
    const {'1': 'account_id', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'accountId', '17': true},
    const {'1': 'phone_number', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'phoneNumber', '17': true},
    const {'1': 'display_name', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'displayName', '17': true},
  ],
  '8': const [
    const {'1': '_account_id'},
    const {'1': '_phone_number'},
    const {'1': '_display_name'},
  ],
};

/// Descriptor for `ValidateAccessTokenResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List validateAccessTokenResponseDescriptor = $convert.base64Decode('ChtWYWxpZGF0ZUFjY2Vzc1Rva2VuUmVzcG9uc2USIgoKYWNjb3VudF9pZBgBIAEoCUgAUglhY2NvdW50SWSIAQESJgoMcGhvbmVfbnVtYmVyGAIgASgJSAFSC3Bob25lTnVtYmVyiAEBEiYKDGRpc3BsYXlfbmFtZRgDIAEoCUgCUgtkaXNwbGF5TmFtZYgBAUINCgtfYWNjb3VudF9pZEIPCg1fcGhvbmVfbnVtYmVyQg8KDV9kaXNwbGF5X25hbWU=');
@$core.Deprecated('Use loginRequestDescriptor instead')
const LoginRequest$json = const {
  '1': 'LoginRequest',
  '2': const [
    const {'1': 'phone_number', '3': 1, '4': 1, '5': 9, '10': 'phoneNumber'},
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
    const {'1': 'country_id', '3': 3, '4': 1, '5': 9, '10': 'countryId'},
  ],
};

/// Descriptor for `LoginRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginRequestDescriptor = $convert.base64Decode('CgxMb2dpblJlcXVlc3QSIQoMcGhvbmVfbnVtYmVyGAEgASgJUgtwaG9uZU51bWJlchIaCghwYXNzd29yZBgCIAEoCVIIcGFzc3dvcmQSHQoKY291bnRyeV9pZBgDIAEoCVIJY291bnRyeUlk');
@$core.Deprecated('Use registerRequestDescriptor instead')
const RegisterRequest$json = const {
  '1': 'RegisterRequest',
  '2': const [
    const {'1': 'phone_number', '3': 1, '4': 1, '5': 9, '10': 'phoneNumber'},
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
    const {'1': 'display_name', '3': 4, '4': 1, '5': 9, '10': 'displayName'},
    const {'1': 'avatar_url', '3': 5, '4': 1, '5': 12, '9': 0, '10': 'avatarUrl', '17': true},
    const {'1': 'referral_code', '3': 6, '4': 1, '5': 9, '9': 1, '10': 'referralCode', '17': true},
    const {'1': 'id_card_url', '3': 7, '4': 1, '5': 9, '9': 2, '10': 'idCardUrl', '17': true},
    const {'1': 'vaccine_card_url', '3': 8, '4': 1, '5': 9, '9': 3, '10': 'vaccineCardUrl', '17': true},
    const {'1': 'country_id', '3': 9, '4': 1, '5': 9, '10': 'countryId'},
  ],
  '8': const [
    const {'1': '_avatar_url'},
    const {'1': '_referral_code'},
    const {'1': '_id_card_url'},
    const {'1': '_vaccine_card_url'},
  ],
};

/// Descriptor for `RegisterRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerRequestDescriptor = $convert.base64Decode('Cg9SZWdpc3RlclJlcXVlc3QSIQoMcGhvbmVfbnVtYmVyGAEgASgJUgtwaG9uZU51bWJlchIaCghwYXNzd29yZBgCIAEoCVIIcGFzc3dvcmQSIQoMZGlzcGxheV9uYW1lGAQgASgJUgtkaXNwbGF5TmFtZRIiCgphdmF0YXJfdXJsGAUgASgMSABSCWF2YXRhclVybIgBARIoCg1yZWZlcnJhbF9jb2RlGAYgASgJSAFSDHJlZmVycmFsQ29kZYgBARIjCgtpZF9jYXJkX3VybBgHIAEoCUgCUglpZENhcmRVcmyIAQESLQoQdmFjY2luZV9jYXJkX3VybBgIIAEoCUgDUg52YWNjaW5lQ2FyZFVybIgBARIdCgpjb3VudHJ5X2lkGAkgASgJUgljb3VudHJ5SWRCDQoLX2F2YXRhcl91cmxCEAoOX3JlZmVycmFsX2NvZGVCDgoMX2lkX2NhcmRfdXJsQhMKEV92YWNjaW5lX2NhcmRfdXJs');
@$core.Deprecated('Use resetPasswordRequestDescriptor instead')
const ResetPasswordRequest$json = const {
  '1': 'ResetPasswordRequest',
  '2': const [
    const {'1': 'phone_number', '3': 1, '4': 1, '5': 9, '10': 'phoneNumber'},
    const {'1': 'password', '3': 4, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `ResetPasswordRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resetPasswordRequestDescriptor = $convert.base64Decode('ChRSZXNldFBhc3N3b3JkUmVxdWVzdBIhCgxwaG9uZV9udW1iZXIYASABKAlSC3Bob25lTnVtYmVyEhoKCHBhc3N3b3JkGAQgASgJUghwYXNzd29yZA==');
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
    const {'1': 'country_id', '3': 11, '4': 1, '5': 9, '10': 'countryId'},
    const {'1': 'device_id', '3': 12, '4': 1, '5': 9, '9': 4, '10': 'deviceId', '17': true},
    const {'1': 'device_token', '3': 13, '4': 1, '5': 9, '9': 5, '10': 'deviceToken', '17': true},
    const {'1': 'device_type', '3': 14, '4': 1, '5': 9, '9': 6, '10': 'deviceType', '17': true},
    const {'1': 'is_verified', '3': 15, '4': 1, '5': 8, '9': 7, '10': 'isVerified', '17': true},
    const {'1': 'is_public_account', '3': 16, '4': 1, '5': 8, '9': 8, '10': 'isPublicAccount', '17': true},
  ],
  '8': const [
    const {'1': '_avatar_url'},
    const {'1': '_id_card_url'},
    const {'1': '_vaccine_card_url'},
    const {'1': '_referral_code'},
    const {'1': '_device_id'},
    const {'1': '_device_token'},
    const {'1': '_device_type'},
    const {'1': '_is_verified'},
    const {'1': '_is_public_account'},
  ],
};

/// Descriptor for `Account`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List accountDescriptor = $convert.base64Decode('CgdBY2NvdW50Eg4KAmlkGAEgASgJUgJpZBIhCgxwaG9uZV9udW1iZXIYAiABKAlSC3Bob25lTnVtYmVyEiEKDGRpc3BsYXlfbmFtZRgDIAEoCVILZGlzcGxheU5hbWUSHwoLbGFuZ3VhZ2VfaWQYBCABKAlSCmxhbmd1YWdlSWQSOQoKY3JlYXRlZF9hdBgFIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCWNyZWF0ZWRBdBI5Cgp1cGRhdGVkX2F0GAYgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJdXBkYXRlZEF0EiIKCmF2YXRhcl91cmwYByABKAlIAFIJYXZhdGFyVXJsiAEBEiMKC2lkX2NhcmRfdXJsGAggASgJSAFSCWlkQ2FyZFVybIgBARItChB2YWNjaW5lX2NhcmRfdXJsGAkgASgJSAJSDnZhY2NpbmVDYXJkVXJsiAEBEigKDXJlZmVycmFsX2NvZGUYCiABKAlIA1IMcmVmZXJyYWxDb2RliAEBEh0KCmNvdW50cnlfaWQYCyABKAlSCWNvdW50cnlJZBIgCglkZXZpY2VfaWQYDCABKAlIBFIIZGV2aWNlSWSIAQESJgoMZGV2aWNlX3Rva2VuGA0gASgJSAVSC2RldmljZVRva2VuiAEBEiQKC2RldmljZV90eXBlGA4gASgJSAZSCmRldmljZVR5cGWIAQESJAoLaXNfdmVyaWZpZWQYDyABKAhIB1IKaXNWZXJpZmllZIgBARIvChFpc19wdWJsaWNfYWNjb3VudBgQIAEoCEgIUg9pc1B1YmxpY0FjY291bnSIAQFCDQoLX2F2YXRhcl91cmxCDgoMX2lkX2NhcmRfdXJsQhMKEV92YWNjaW5lX2NhcmRfdXJsQhAKDl9yZWZlcnJhbF9jb2RlQgwKCl9kZXZpY2VfaWRCDwoNX2RldmljZV90b2tlbkIOCgxfZGV2aWNlX3R5cGVCDgoMX2lzX3ZlcmlmaWVkQhQKEl9pc19wdWJsaWNfYWNjb3VudA==');
@$core.Deprecated('Use businessAccountDescriptor instead')
const BusinessAccount$json = const {
  '1': 'BusinessAccount',
  '2': const [
    const {'1': 'owner', '3': 1, '4': 1, '5': 11, '6': '.auth.Account', '10': 'owner'},
    const {'1': 'specialization', '3': 2, '4': 1, '5': 9, '10': 'specialization'},
    const {'1': 'jobs_completed', '3': 3, '4': 1, '5': 5, '10': 'jobsCompleted'},
    const {'1': 'hourly_rate', '3': 4, '4': 1, '5': 1, '10': 'hourlyRate'},
    const {'1': 'ratings', '3': 5, '4': 1, '5': 1, '10': 'ratings'},
  ],
};

/// Descriptor for `BusinessAccount`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List businessAccountDescriptor = $convert.base64Decode('Cg9CdXNpbmVzc0FjY291bnQSIwoFb3duZXIYASABKAsyDS5hdXRoLkFjY291bnRSBW93bmVyEiYKDnNwZWNpYWxpemF0aW9uGAIgASgJUg5zcGVjaWFsaXphdGlvbhIlCg5qb2JzX2NvbXBsZXRlZBgDIAEoBVINam9ic0NvbXBsZXRlZBIfCgtob3VybHlfcmF0ZRgEIAEoAVIKaG91cmx5UmF0ZRIYCgdyYXRpbmdzGAUgASgBUgdyYXRpbmdz');
@$core.Deprecated('Use accessTokenStoreDescriptor instead')
const AccessTokenStore$json = const {
  '1': 'AccessTokenStore',
  '2': const [
    const {'1': 'access_token', '3': 1, '4': 1, '5': 9, '10': 'accessToken'},
    const {'1': 'refresh_token', '3': 3, '4': 1, '5': 9, '10': 'refreshToken'},
  ],
};

/// Descriptor for `AccessTokenStore`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List accessTokenStoreDescriptor = $convert.base64Decode('ChBBY2Nlc3NUb2tlblN0b3JlEiEKDGFjY2Vzc190b2tlbhgBIAEoCVILYWNjZXNzVG9rZW4SIwoNcmVmcmVzaF90b2tlbhgDIAEoCVIMcmVmcmVzaFRva2Vu');
@$core.Deprecated('Use countryDescriptor instead')
const Country$json = const {
  '1': 'Country',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'code', '3': 3, '4': 1, '5': 9, '10': 'code'},
    const {'1': 'dial_code', '3': 4, '4': 1, '5': 9, '10': 'dialCode'},
    const {'1': 'currency', '3': 5, '4': 1, '5': 9, '10': 'currency'},
    const {'1': 'currency_symbol', '3': 6, '4': 1, '5': 9, '10': 'currencySymbol'},
    const {'1': 'flag_url', '3': 7, '4': 1, '5': 9, '10': 'flagUrl'},
    const {'1': 'language_id', '3': 8, '4': 1, '5': 9, '10': 'languageId'},
  ],
};

/// Descriptor for `Country`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List countryDescriptor = $convert.base64Decode('CgdDb3VudHJ5Eg4KAmlkGAEgASgJUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEhIKBGNvZGUYAyABKAlSBGNvZGUSGwoJZGlhbF9jb2RlGAQgASgJUghkaWFsQ29kZRIaCghjdXJyZW5jeRgFIAEoCVIIY3VycmVuY3kSJwoPY3VycmVuY3lfc3ltYm9sGAYgASgJUg5jdXJyZW5jeVN5bWJvbBIZCghmbGFnX3VybBgHIAEoCVIHZmxhZ1VybBIfCgtsYW5ndWFnZV9pZBgIIAEoCVIKbGFuZ3VhZ2VJZA==');
