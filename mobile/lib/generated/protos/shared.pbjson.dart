///
//  Generated code. Do not modify.
//  source: shared.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use appServiceCredentialDescriptor instead')
const AppServiceCredential$json = const {
  '1': 'AppServiceCredential',
  '2': const [
    const {'1': 'google_auth', '2': 0},
    const {'1': 'google_maps', '2': 1},
  ],
};

/// Descriptor for `AppServiceCredential`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List appServiceCredentialDescriptor = $convert.base64Decode('ChRBcHBTZXJ2aWNlQ3JlZGVudGlhbBIPCgtnb29nbGVfYXV0aBAAEg8KC2dvb2dsZV9tYXBzEAE=');
@$core.Deprecated('Use appServiceDescriptor instead')
const AppService$json = const {
  '1': 'AppService',
  '2': const [
    const {'1': 'credential', '3': 1, '4': 1, '5': 14, '6': '.shared.AppServiceCredential', '10': 'credential'},
  ],
};

/// Descriptor for `AppService`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List appServiceDescriptor = $convert.base64Decode('CgpBcHBTZXJ2aWNlEjwKCmNyZWRlbnRpYWwYASABKA4yHC5zaGFyZWQuQXBwU2VydmljZUNyZWRlbnRpYWxSCmNyZWRlbnRpYWw=');
@$core.Deprecated('Use appServiceResponseDescriptor instead')
const AppServiceResponse$json = const {
  '1': 'AppServiceResponse',
  '2': const [
    const {'1': 'encoded_key', '3': 1, '4': 1, '5': 9, '10': 'encodedKey'},
    const {'1': 'encoded_secret', '3': 2, '4': 1, '5': 9, '10': 'encodedSecret'},
    const {'1': 'credential', '3': 3, '4': 1, '5': 14, '6': '.shared.AppServiceCredential', '10': 'credential'},
  ],
};

/// Descriptor for `AppServiceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List appServiceResponseDescriptor = $convert.base64Decode('ChJBcHBTZXJ2aWNlUmVzcG9uc2USHwoLZW5jb2RlZF9rZXkYASABKAlSCmVuY29kZWRLZXkSJQoOZW5jb2RlZF9zZWNyZXQYAiABKAlSDWVuY29kZWRTZWNyZXQSPAoKY3JlZGVudGlhbBgDIAEoDjIcLnNoYXJlZC5BcHBTZXJ2aWNlQ3JlZGVudGlhbFIKY3JlZGVudGlhbA==');
@$core.Deprecated('Use apiVersionResponseDescriptor instead')
const ApiVersionResponse$json = const {
  '1': 'ApiVersionResponse',
  '2': const [
    const {'1': 'version', '3': 1, '4': 1, '5': 9, '10': 'version'},
    const {'1': 'should_upgrade', '3': 2, '4': 1, '5': 8, '10': 'shouldUpgrade'},
  ],
};

/// Descriptor for `ApiVersionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List apiVersionResponseDescriptor = $convert.base64Decode('ChJBcGlWZXJzaW9uUmVzcG9uc2USGAoHdmVyc2lvbhgBIAEoCVIHdmVyc2lvbhIlCg5zaG91bGRfdXBncmFkZRgCIAEoCFINc2hvdWxkVXBncmFkZQ==');
