///
//  Generated code. Do not modify.
//  source: event.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use procheEventStatusDescriptor instead')
const ProcheEventStatus$json = const {
  '1': 'ProcheEventStatus',
  '2': const [
    const {'1': 'ACTIVE', '2': 0},
    const {'1': 'CANCELLED', '2': 1},
    const {'1': 'COMPLETED', '2': 2},
  ],
};

/// Descriptor for `ProcheEventStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List procheEventStatusDescriptor = $convert.base64Decode('ChFQcm9jaGVFdmVudFN0YXR1cxIKCgZBQ1RJVkUQABINCglDQU5DRUxMRUQQARINCglDT01QTEVURUQQAg==');
@$core.Deprecated('Use getEventByLocationRequestDescriptor instead')
const GetEventByLocationRequest$json = const {
  '1': 'GetEventByLocationRequest',
  '2': const [
    const {'1': 'latitude', '3': 1, '4': 1, '5': 1, '10': 'latitude'},
    const {'1': 'longitude', '3': 2, '4': 1, '5': 1, '10': 'longitude'},
    const {'1': 'radius', '3': 3, '4': 1, '5': 1, '10': 'radius'},
  ],
};

/// Descriptor for `GetEventByLocationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getEventByLocationRequestDescriptor = $convert.base64Decode('ChlHZXRFdmVudEJ5TG9jYXRpb25SZXF1ZXN0EhoKCGxhdGl0dWRlGAEgASgBUghsYXRpdHVkZRIcCglsb25naXR1ZGUYAiABKAFSCWxvbmdpdHVkZRIWCgZyYWRpdXMYAyABKAFSBnJhZGl1cw==');
@$core.Deprecated('Use createEventRequestDescriptor instead')
const CreateEventRequest$json = const {
  '1': 'CreateEventRequest',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'description', '3': 2, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'location', '3': 3, '4': 1, '5': 9, '10': 'location'},
    const {'1': 'latitude', '3': 4, '4': 1, '5': 1, '10': 'latitude'},
    const {'1': 'longitude', '3': 5, '4': 1, '5': 1, '10': 'longitude'},
    const {'1': 'start_time', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'startTime'},
    const {'1': 'end_time', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'endTime'},
    const {'1': 'duration', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Duration', '10': 'duration'},
    const {'1': 'user_id', '3': 9, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'photos', '3': 10, '4': 3, '5': 9, '10': 'photos'},
    const {'1': 'video', '3': 11, '4': 1, '5': 9, '9': 0, '10': 'video', '17': true},
  ],
  '8': const [
    const {'1': '_video'},
  ],
};

/// Descriptor for `CreateEventRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createEventRequestDescriptor = $convert.base64Decode('ChJDcmVhdGVFdmVudFJlcXVlc3QSEgoEbmFtZRgBIAEoCVIEbmFtZRIgCgtkZXNjcmlwdGlvbhgCIAEoCVILZGVzY3JpcHRpb24SGgoIbG9jYXRpb24YAyABKAlSCGxvY2F0aW9uEhoKCGxhdGl0dWRlGAQgASgBUghsYXRpdHVkZRIcCglsb25naXR1ZGUYBSABKAFSCWxvbmdpdHVkZRI5CgpzdGFydF90aW1lGAYgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJc3RhcnRUaW1lEjUKCGVuZF90aW1lGAcgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIHZW5kVGltZRI1CghkdXJhdGlvbhgIIAEoCzIZLmdvb2dsZS5wcm90b2J1Zi5EdXJhdGlvblIIZHVyYXRpb24SFwoHdXNlcl9pZBgJIAEoCVIGdXNlcklkEhYKBnBob3RvcxgKIAMoCVIGcGhvdG9zEhkKBXZpZGVvGAsgASgJSABSBXZpZGVviAEBQggKBl92aWRlbw==');
@$core.Deprecated('Use procheEventDescriptor instead')
const ProcheEvent$json = const {
  '1': 'ProcheEvent',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'location', '3': 4, '4': 1, '5': 9, '10': 'location'},
    const {'1': 'latitude', '3': 5, '4': 1, '5': 1, '10': 'latitude'},
    const {'1': 'longitude', '3': 6, '4': 1, '5': 1, '10': 'longitude'},
    const {'1': 'start_time', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'startTime'},
    const {'1': 'end_time', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'endTime'},
    const {'1': 'duration', '3': 9, '4': 1, '5': 11, '6': '.google.protobuf.Duration', '10': 'duration'},
    const {'1': 'user_id', '3': 10, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'status', '3': 11, '4': 1, '5': 14, '6': '.event.ProcheEventStatus', '10': 'status'},
    const {'1': 'photos', '3': 12, '4': 3, '5': 9, '10': 'photos'},
    const {'1': 'video', '3': 13, '4': 1, '5': 9, '9': 0, '10': 'video', '17': true},
  ],
  '8': const [
    const {'1': '_video'},
  ],
};

/// Descriptor for `ProcheEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List procheEventDescriptor = $convert.base64Decode('CgtQcm9jaGVFdmVudBIOCgJpZBgBIAEoCVICaWQSEgoEbmFtZRgCIAEoCVIEbmFtZRIgCgtkZXNjcmlwdGlvbhgDIAEoCVILZGVzY3JpcHRpb24SGgoIbG9jYXRpb24YBCABKAlSCGxvY2F0aW9uEhoKCGxhdGl0dWRlGAUgASgBUghsYXRpdHVkZRIcCglsb25naXR1ZGUYBiABKAFSCWxvbmdpdHVkZRI5CgpzdGFydF90aW1lGAcgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJc3RhcnRUaW1lEjUKCGVuZF90aW1lGAggASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIHZW5kVGltZRI1CghkdXJhdGlvbhgJIAEoCzIZLmdvb2dsZS5wcm90b2J1Zi5EdXJhdGlvblIIZHVyYXRpb24SFwoHdXNlcl9pZBgKIAEoCVIGdXNlcklkEjAKBnN0YXR1cxgLIAEoDjIYLmV2ZW50LlByb2NoZUV2ZW50U3RhdHVzUgZzdGF0dXMSFgoGcGhvdG9zGAwgAygJUgZwaG90b3MSGQoFdmlkZW8YDSABKAlIAFIFdmlkZW+IAQFCCAoGX3ZpZGVv');
@$core.Deprecated('Use procheEventListDescriptor instead')
const ProcheEventList$json = const {
  '1': 'ProcheEventList',
  '2': const [
    const {'1': 'events', '3': 1, '4': 3, '5': 11, '6': '.event.ProcheEvent', '10': 'events'},
  ],
};

/// Descriptor for `ProcheEventList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List procheEventListDescriptor = $convert.base64Decode('Cg9Qcm9jaGVFdmVudExpc3QSKgoGZXZlbnRzGAEgAygLMhIuZXZlbnQuUHJvY2hlRXZlbnRSBmV2ZW50cw==');
