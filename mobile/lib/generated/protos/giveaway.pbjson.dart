///
//  Generated code. Do not modify.
//  source: giveaway.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use giveAwayDispatchTypeDescriptor instead')
const GiveAwayDispatchType$json = const {
  '1': 'GiveAwayDispatchType',
  '2': const [
    const {'1': 'GIVEAWAY_PICKUP', '2': 0},
    const {'1': 'GIVEAWAY_DELIVERY', '2': 1},
  ],
};

/// Descriptor for `GiveAwayDispatchType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List giveAwayDispatchTypeDescriptor = $convert.base64Decode('ChRHaXZlQXdheURpc3BhdGNoVHlwZRITCg9HSVZFQVdBWV9QSUNLVVAQABIVChFHSVZFQVdBWV9ERUxJVkVSWRAB');
@$core.Deprecated('Use giveAwayListDescriptor instead')
const GiveAwayList$json = const {
  '1': 'GiveAwayList',
  '2': const [
    const {'1': 'giveaways', '3': 1, '4': 3, '5': 11, '6': '.event.GiveAway', '10': 'giveaways'},
  ],
};

/// Descriptor for `GiveAwayList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List giveAwayListDescriptor = $convert.base64Decode('CgxHaXZlQXdheUxpc3QSLQoJZ2l2ZWF3YXlzGAEgAygLMg8uZXZlbnQuR2l2ZUF3YXlSCWdpdmVhd2F5cw==');
@$core.Deprecated('Use createGiveAwayRequestDescriptor instead')
const CreateGiveAwayRequest$json = const {
  '1': 'CreateGiveAwayRequest',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'description', '3': 2, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'images', '3': 3, '4': 3, '5': 9, '10': 'images'},
    const {'1': 'address', '3': 4, '4': 1, '5': 11, '6': '.core.CommonAddress', '10': 'address'},
    const {'1': 'dispatch_type', '3': 5, '4': 1, '5': 14, '6': '.event.GiveAwayDispatchType', '10': 'dispatchType'},
    const {'1': 'dispatch_duration', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Duration', '10': 'dispatchDuration'},
  ],
};

/// Descriptor for `CreateGiveAwayRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createGiveAwayRequestDescriptor = $convert.base64Decode('ChVDcmVhdGVHaXZlQXdheVJlcXVlc3QSEgoEbmFtZRgBIAEoCVIEbmFtZRIgCgtkZXNjcmlwdGlvbhgCIAEoCVILZGVzY3JpcHRpb24SFgoGaW1hZ2VzGAMgAygJUgZpbWFnZXMSLQoHYWRkcmVzcxgEIAEoCzITLmNvcmUuQ29tbW9uQWRkcmVzc1IHYWRkcmVzcxJACg1kaXNwYXRjaF90eXBlGAUgASgOMhsuZXZlbnQuR2l2ZUF3YXlEaXNwYXRjaFR5cGVSDGRpc3BhdGNoVHlwZRJGChFkaXNwYXRjaF9kdXJhdGlvbhgGIAEoCzIZLmdvb2dsZS5wcm90b2J1Zi5EdXJhdGlvblIQZGlzcGF0Y2hEdXJhdGlvbg==');
@$core.Deprecated('Use giveAwayDescriptor instead')
const GiveAway$json = const {
  '1': 'GiveAway',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'images', '3': 4, '4': 3, '5': 9, '10': 'images'},
    const {'1': 'owner', '3': 5, '4': 1, '5': 9, '10': 'owner'},
    const {'1': 'created_at', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    const {'1': 'updated_at', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
    const {'1': 'address', '3': 8, '4': 1, '5': 11, '6': '.core.CommonAddress', '10': 'address'},
  ],
};

/// Descriptor for `GiveAway`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List giveAwayDescriptor = $convert.base64Decode('CghHaXZlQXdheRIOCgJpZBgBIAEoCVICaWQSEgoEbmFtZRgCIAEoCVIEbmFtZRIgCgtkZXNjcmlwdGlvbhgDIAEoCVILZGVzY3JpcHRpb24SFgoGaW1hZ2VzGAQgAygJUgZpbWFnZXMSFAoFb3duZXIYBSABKAlSBW93bmVyEjkKCmNyZWF0ZWRfYXQYBiABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgljcmVhdGVkQXQSOQoKdXBkYXRlZF9hdBgHIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCXVwZGF0ZWRBdBItCgdhZGRyZXNzGAggASgLMhMuY29yZS5Db21tb25BZGRyZXNzUgdhZGRyZXNz');
