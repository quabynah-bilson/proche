///
//  Generated code. Do not modify.
//  source: notification.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use registerDeviceRequestDescriptor instead')
const RegisterDeviceRequest$json = const {
  '1': 'RegisterDeviceRequest',
  '2': const [
    const {'1': 'device_type', '3': 2, '4': 1, '5': 9, '10': 'deviceType'},
    const {'1': 'user_id', '3': 3, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `RegisterDeviceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerDeviceRequestDescriptor = $convert.base64Decode('ChVSZWdpc3RlckRldmljZVJlcXVlc3QSHwoLZGV2aWNlX3R5cGUYAiABKAlSCmRldmljZVR5cGUSFwoHdXNlcl9pZBgDIAEoCVIGdXNlcklk');
@$core.Deprecated('Use notificationResponseDescriptor instead')
const NotificationResponse$json = const {
  '1': 'NotificationResponse',
  '2': const [
    const {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'body', '3': 2, '4': 1, '5': 9, '10': 'body'},
    const {'1': 'image_url', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'imageUrl', '17': true},
  ],
  '8': const [
    const {'1': '_image_url'},
  ],
};

/// Descriptor for `NotificationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List notificationResponseDescriptor = $convert.base64Decode('ChROb3RpZmljYXRpb25SZXNwb25zZRIUCgV0aXRsZRgBIAEoCVIFdGl0bGUSEgoEYm9keRgCIAEoCVIEYm9keRIgCglpbWFnZV91cmwYAyABKAlIAFIIaW1hZ2VVcmyIAQFCDAoKX2ltYWdlX3VybA==');
@$core.Deprecated('Use notificationRequestDescriptor instead')
const NotificationRequest$json = const {
  '1': 'NotificationRequest',
  '2': const [
    const {'1': 'tokens', '3': 1, '4': 3, '5': 9, '10': 'tokens'},
    const {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'body', '3': 3, '4': 1, '5': 9, '10': 'body'},
    const {'1': 'channel_id', '3': 4, '4': 1, '5': 9, '10': 'channelId'},
    const {'1': 'image_url', '3': 5, '4': 1, '5': 9, '9': 0, '10': 'imageUrl', '17': true},
  ],
  '8': const [
    const {'1': '_image_url'},
  ],
};

/// Descriptor for `NotificationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List notificationRequestDescriptor = $convert.base64Decode('ChNOb3RpZmljYXRpb25SZXF1ZXN0EhYKBnRva2VucxgBIAMoCVIGdG9rZW5zEhQKBXRpdGxlGAIgASgJUgV0aXRsZRISCgRib2R5GAMgASgJUgRib2R5Eh0KCmNoYW5uZWxfaWQYBCABKAlSCWNoYW5uZWxJZBIgCglpbWFnZV91cmwYBSABKAlIAFIIaW1hZ2VVcmyIAQFCDAoKX2ltYWdlX3VybA==');
