///
//  Generated code. Do not modify.
//  source: trip.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use tripEventTypeDescriptor instead')
const TripEventType$json = const {
  '1': 'TripEventType',
  '2': const [
    const {'1': 'EVENT_UNKNOWN', '2': 0},
    const {'1': 'EVENT_BOOKED', '2': 1},
    const {'1': 'EVENT_CANCELLED', '2': 2},
    const {'1': 'EVENT_STARTED', '2': 3},
    const {'1': 'EVENT_COMPLETED', '2': 4},
  ],
};

/// Descriptor for `TripEventType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List tripEventTypeDescriptor = $convert.base64Decode('Cg1UcmlwRXZlbnRUeXBlEhEKDUVWRU5UX1VOS05PV04QABIQCgxFVkVOVF9CT09LRUQQARITCg9FVkVOVF9DQU5DRUxMRUQQAhIRCg1FVkVOVF9TVEFSVEVEEAMSEwoPRVZFTlRfQ09NUExFVEVEEAQ=');
@$core.Deprecated('Use tripListDescriptor instead')
const TripList$json = const {
  '1': 'TripList',
  '2': const [
    const {'1': 'trips', '3': 1, '4': 3, '5': 11, '6': '.trip.Trip', '10': 'trips'},
  ],
};

/// Descriptor for `TripList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tripListDescriptor = $convert.base64Decode('CghUcmlwTGlzdBIgCgV0cmlwcxgBIAMoCzIKLnRyaXAuVHJpcFIFdHJpcHM=');
@$core.Deprecated('Use tripEventListDescriptor instead')
const TripEventList$json = const {
  '1': 'TripEventList',
  '2': const [
    const {'1': 'trip_events', '3': 1, '4': 3, '5': 11, '6': '.trip.TripEvent', '10': 'tripEvents'},
  ],
};

/// Descriptor for `TripEventList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tripEventListDescriptor = $convert.base64Decode('Cg1UcmlwRXZlbnRMaXN0EjAKC3RyaXBfZXZlbnRzGAEgAygLMg8udHJpcC5UcmlwRXZlbnRSCnRyaXBFdmVudHM=');
@$core.Deprecated('Use bookTripRequestDescriptor instead')
const BookTripRequest$json = const {
  '1': 'BookTripRequest',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'origin', '3': 2, '4': 1, '5': 11, '6': '.core.CommonAddress', '10': 'origin'},
    const {'1': 'destination', '3': 3, '4': 1, '5': 11, '6': '.core.CommonAddress', '10': 'destination'},
    const {'1': 'departure_time', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'departureTime'},
    const {'1': 'duration', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Duration', '10': 'duration'},
    const {'1': 'vaccine_card_url', '3': 6, '4': 1, '5': 9, '9': 0, '10': 'vaccineCardUrl', '17': true},
  ],
  '8': const [
    const {'1': '_vaccine_card_url'},
  ],
};

/// Descriptor for `BookTripRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bookTripRequestDescriptor = $convert.base64Decode('Cg9Cb29rVHJpcFJlcXVlc3QSFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklkEisKBm9yaWdpbhgCIAEoCzITLmNvcmUuQ29tbW9uQWRkcmVzc1IGb3JpZ2luEjUKC2Rlc3RpbmF0aW9uGAMgASgLMhMuY29yZS5Db21tb25BZGRyZXNzUgtkZXN0aW5hdGlvbhJBCg5kZXBhcnR1cmVfdGltZRgEIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSDWRlcGFydHVyZVRpbWUSNQoIZHVyYXRpb24YBSABKAsyGS5nb29nbGUucHJvdG9idWYuRHVyYXRpb25SCGR1cmF0aW9uEi0KEHZhY2NpbmVfY2FyZF91cmwYBiABKAlIAFIOdmFjY2luZUNhcmRVcmyIAQFCEwoRX3ZhY2NpbmVfY2FyZF91cmw=');
@$core.Deprecated('Use tripDescriptor instead')
const Trip$json = const {
  '1': 'Trip',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'origin', '3': 3, '4': 1, '5': 11, '6': '.core.CommonAddress', '10': 'origin'},
    const {'1': 'destination', '3': 4, '4': 1, '5': 11, '6': '.core.CommonAddress', '10': 'destination'},
    const {'1': 'departure_time', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'departureTime'},
    const {'1': 'duration', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Duration', '10': 'duration'},
    const {'1': 'created_at', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    const {'1': 'updated_at', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
  ],
};

/// Descriptor for `Trip`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tripDescriptor = $convert.base64Decode('CgRUcmlwEg4KAmlkGAEgASgJUgJpZBIXCgd1c2VyX2lkGAIgASgJUgZ1c2VySWQSKwoGb3JpZ2luGAMgASgLMhMuY29yZS5Db21tb25BZGRyZXNzUgZvcmlnaW4SNQoLZGVzdGluYXRpb24YBCABKAsyEy5jb3JlLkNvbW1vbkFkZHJlc3NSC2Rlc3RpbmF0aW9uEkEKDmRlcGFydHVyZV90aW1lGAUgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFINZGVwYXJ0dXJlVGltZRI1CghkdXJhdGlvbhgGIAEoCzIZLmdvb2dsZS5wcm90b2J1Zi5EdXJhdGlvblIIZHVyYXRpb24SOQoKY3JlYXRlZF9hdBgHIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCWNyZWF0ZWRBdBI5Cgp1cGRhdGVkX2F0GAggASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJdXBkYXRlZEF0');
@$core.Deprecated('Use tripEventDescriptor instead')
const TripEvent$json = const {
  '1': 'TripEvent',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'trip_id', '3': 2, '4': 1, '5': 9, '10': 'tripId'},
    const {'1': 'user_id', '3': 3, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'origin', '3': 4, '4': 1, '5': 11, '6': '.core.CommonAddress', '10': 'origin'},
    const {'1': 'destination', '3': 5, '4': 1, '5': 11, '6': '.core.CommonAddress', '10': 'destination'},
    const {'1': 'departure_time', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'departureTime'},
    const {'1': 'duration', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Duration', '10': 'duration'},
    const {'1': 'created_at', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    const {'1': 'updated_at', '3': 9, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
    const {'1': 'event_time', '3': 10, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'eventTime'},
    const {'1': 'event_type', '3': 11, '4': 1, '5': 14, '6': '.trip.TripEventType', '10': 'eventType'},
  ],
};

/// Descriptor for `TripEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tripEventDescriptor = $convert.base64Decode('CglUcmlwRXZlbnQSDgoCaWQYASABKAlSAmlkEhcKB3RyaXBfaWQYAiABKAlSBnRyaXBJZBIXCgd1c2VyX2lkGAMgASgJUgZ1c2VySWQSKwoGb3JpZ2luGAQgASgLMhMuY29yZS5Db21tb25BZGRyZXNzUgZvcmlnaW4SNQoLZGVzdGluYXRpb24YBSABKAsyEy5jb3JlLkNvbW1vbkFkZHJlc3NSC2Rlc3RpbmF0aW9uEkEKDmRlcGFydHVyZV90aW1lGAYgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFINZGVwYXJ0dXJlVGltZRI1CghkdXJhdGlvbhgHIAEoCzIZLmdvb2dsZS5wcm90b2J1Zi5EdXJhdGlvblIIZHVyYXRpb24SOQoKY3JlYXRlZF9hdBgIIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCWNyZWF0ZWRBdBI5Cgp1cGRhdGVkX2F0GAkgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJdXBkYXRlZEF0EjkKCmV2ZW50X3RpbWUYCiABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUglldmVudFRpbWUSMgoKZXZlbnRfdHlwZRgLIAEoDjITLnRyaXAuVHJpcEV2ZW50VHlwZVIJZXZlbnRUeXBl');
@$core.Deprecated('Use tripEventRequestDescriptor instead')
const TripEventRequest$json = const {
  '1': 'TripEventRequest',
  '2': const [
    const {'1': 'trip_id', '3': 1, '4': 1, '5': 9, '10': 'tripId'},
    const {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'origin', '3': 3, '4': 1, '5': 11, '6': '.core.CommonAddress', '10': 'origin'},
    const {'1': 'destination', '3': 4, '4': 1, '5': 11, '6': '.core.CommonAddress', '10': 'destination'},
    const {'1': 'departure_time', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'departureTime'},
    const {'1': 'duration', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Duration', '10': 'duration'},
    const {'1': 'event_time', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'eventTime'},
    const {'1': 'event_type', '3': 8, '4': 1, '5': 14, '6': '.trip.TripEventType', '10': 'eventType'},
  ],
};

/// Descriptor for `TripEventRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tripEventRequestDescriptor = $convert.base64Decode('ChBUcmlwRXZlbnRSZXF1ZXN0EhcKB3RyaXBfaWQYASABKAlSBnRyaXBJZBIXCgd1c2VyX2lkGAIgASgJUgZ1c2VySWQSKwoGb3JpZ2luGAMgASgLMhMuY29yZS5Db21tb25BZGRyZXNzUgZvcmlnaW4SNQoLZGVzdGluYXRpb24YBCABKAsyEy5jb3JlLkNvbW1vbkFkZHJlc3NSC2Rlc3RpbmF0aW9uEkEKDmRlcGFydHVyZV90aW1lGAUgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFINZGVwYXJ0dXJlVGltZRI1CghkdXJhdGlvbhgGIAEoCzIZLmdvb2dsZS5wcm90b2J1Zi5EdXJhdGlvblIIZHVyYXRpb24SOQoKZXZlbnRfdGltZRgHIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCWV2ZW50VGltZRIyCgpldmVudF90eXBlGAggASgOMhMudHJpcC5UcmlwRXZlbnRUeXBlUglldmVudFR5cGU=');
