///
//  Generated code. Do not modify.
//  source: shared.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use appVersionDescriptor instead')
const AppVersion$json = const {
  '1': 'AppVersion',
  '2': const [
    const {'1': 'version', '3': 1, '4': 1, '5': 9, '10': 'version'},
    const {'1': 'androidUrl', '3': 2, '4': 1, '5': 9, '10': 'androidUrl'},
    const {'1': 'iosUrl', '3': 3, '4': 1, '5': 9, '10': 'iosUrl'},
    const {'1': 'updateType', '3': 4, '4': 1, '5': 14, '6': '.shared.AppVersion.UpdateType', '10': 'updateType'},
  ],
  '4': const [AppVersion_UpdateType$json],
};

@$core.Deprecated('Use appVersionDescriptor instead')
const AppVersion_UpdateType$json = const {
  '1': 'UpdateType',
  '2': const [
    const {'1': 'OPTIONAL', '2': 0},
    const {'1': 'MANDATORY', '2': 1},
  ],
};

/// Descriptor for `AppVersion`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List appVersionDescriptor = $convert.base64Decode('CgpBcHBWZXJzaW9uEhgKB3ZlcnNpb24YASABKAlSB3ZlcnNpb24SHgoKYW5kcm9pZFVybBgCIAEoCVIKYW5kcm9pZFVybBIWCgZpb3NVcmwYAyABKAlSBmlvc1VybBI9Cgp1cGRhdGVUeXBlGAQgASgOMh0uc2hhcmVkLkFwcFZlcnNpb24uVXBkYXRlVHlwZVIKdXBkYXRlVHlwZSIpCgpVcGRhdGVUeXBlEgwKCE9QVElPTkFMEAASDQoJTUFOREFUT1JZEAE=');
@$core.Deprecated('Use addressWithLatLngNameDescriptor instead')
const AddressWithLatLngName$json = const {
  '1': 'AddressWithLatLngName',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'name', '17': true},
    const {'1': 'address', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'address', '17': true},
    const {'1': 'latitude', '3': 3, '4': 1, '5': 1, '10': 'latitude'},
    const {'1': 'longitude', '3': 4, '4': 1, '5': 1, '10': 'longitude'},
  ],
  '8': const [
    const {'1': '_name'},
    const {'1': '_address'},
  ],
};

/// Descriptor for `AddressWithLatLngName`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addressWithLatLngNameDescriptor = $convert.base64Decode('ChVBZGRyZXNzV2l0aExhdExuZ05hbWUSFwoEbmFtZRgBIAEoCUgAUgRuYW1liAEBEh0KB2FkZHJlc3MYAiABKAlIAVIHYWRkcmVzc4gBARIaCghsYXRpdHVkZRgDIAEoAVIIbGF0aXR1ZGUSHAoJbG9uZ2l0dWRlGAQgASgBUglsb25naXR1ZGVCBwoFX25hbWVCCgoIX2FkZHJlc3M=');
