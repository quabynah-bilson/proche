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
    const {'1': 'origin', '3': 2, '4': 1, '5': 11, '6': '.trip.TripCoordinates', '10': 'origin'},
    const {'1': 'destination', '3': 3, '4': 1, '5': 11, '6': '.trip.TripCoordinates', '10': 'destination'},
    const {'1': 'departure_time', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'departureTime'},
    const {'1': 'duration', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Duration', '10': 'duration'},
    const {'1': 'vaccine_card_url', '3': 6, '4': 1, '5': 9, '9': 0, '10': 'vaccineCardUrl', '17': true},
  ],
  '8': const [
    const {'1': '_vaccine_card_url'},
  ],
};

/// Descriptor for `BookTripRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bookTripRequestDescriptor = $convert.base64Decode('Cg9Cb29rVHJpcFJlcXVlc3QSFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklkEi0KBm9yaWdpbhgCIAEoCzIVLnRyaXAuVHJpcENvb3JkaW5hdGVzUgZvcmlnaW4SNwoLZGVzdGluYXRpb24YAyABKAsyFS50cmlwLlRyaXBDb29yZGluYXRlc1ILZGVzdGluYXRpb24SQQoOZGVwYXJ0dXJlX3RpbWUYBCABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUg1kZXBhcnR1cmVUaW1lEjUKCGR1cmF0aW9uGAUgASgLMhkuZ29vZ2xlLnByb3RvYnVmLkR1cmF0aW9uUghkdXJhdGlvbhItChB2YWNjaW5lX2NhcmRfdXJsGAYgASgJSABSDnZhY2NpbmVDYXJkVXJsiAEBQhMKEV92YWNjaW5lX2NhcmRfdXJs');
@$core.Deprecated('Use tripDescriptor instead')
const Trip$json = const {
  '1': 'Trip',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'origin', '3': 3, '4': 1, '5': 11, '6': '.trip.TripCoordinates', '10': 'origin'},
    const {'1': 'destination', '3': 4, '4': 1, '5': 11, '6': '.trip.TripCoordinates', '10': 'destination'},
    const {'1': 'departure_time', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'departureTime'},
    const {'1': 'duration', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Duration', '10': 'duration'},
    const {'1': 'created_at', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    const {'1': 'updated_at', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
  ],
};

/// Descriptor for `Trip`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tripDescriptor = $convert.base64Decode('CgRUcmlwEg4KAmlkGAEgASgJUgJpZBIXCgd1c2VyX2lkGAIgASgJUgZ1c2VySWQSLQoGb3JpZ2luGAMgASgLMhUudHJpcC5UcmlwQ29vcmRpbmF0ZXNSBm9yaWdpbhI3CgtkZXN0aW5hdGlvbhgEIAEoCzIVLnRyaXAuVHJpcENvb3JkaW5hdGVzUgtkZXN0aW5hdGlvbhJBCg5kZXBhcnR1cmVfdGltZRgFIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSDWRlcGFydHVyZVRpbWUSNQoIZHVyYXRpb24YBiABKAsyGS5nb29nbGUucHJvdG9idWYuRHVyYXRpb25SCGR1cmF0aW9uEjkKCmNyZWF0ZWRfYXQYByABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgljcmVhdGVkQXQSOQoKdXBkYXRlZF9hdBgIIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCXVwZGF0ZWRBdA==');
@$core.Deprecated('Use tripEventDescriptor instead')
const TripEvent$json = const {
  '1': 'TripEvent',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'trip_id', '3': 2, '4': 1, '5': 9, '10': 'tripId'},
    const {'1': 'user_id', '3': 3, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'origin', '3': 4, '4': 1, '5': 11, '6': '.trip.TripCoordinates', '10': 'origin'},
    const {'1': 'destination', '3': 5, '4': 1, '5': 11, '6': '.trip.TripCoordinates', '10': 'destination'},
    const {'1': 'departure_time', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'departureTime'},
    const {'1': 'duration', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Duration', '10': 'duration'},
    const {'1': 'created_at', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    const {'1': 'updated_at', '3': 9, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
    const {'1': 'event_time', '3': 10, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'eventTime'},
    const {'1': 'event_type', '3': 11, '4': 1, '5': 14, '6': '.trip.TripEventType', '10': 'eventType'},
  ],
};

/// Descriptor for `TripEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tripEventDescriptor = $convert.base64Decode('CglUcmlwRXZlbnQSDgoCaWQYASABKAlSAmlkEhcKB3RyaXBfaWQYAiABKAlSBnRyaXBJZBIXCgd1c2VyX2lkGAMgASgJUgZ1c2VySWQSLQoGb3JpZ2luGAQgASgLMhUudHJpcC5UcmlwQ29vcmRpbmF0ZXNSBm9yaWdpbhI3CgtkZXN0aW5hdGlvbhgFIAEoCzIVLnRyaXAuVHJpcENvb3JkaW5hdGVzUgtkZXN0aW5hdGlvbhJBCg5kZXBhcnR1cmVfdGltZRgGIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSDWRlcGFydHVyZVRpbWUSNQoIZHVyYXRpb24YByABKAsyGS5nb29nbGUucHJvdG9idWYuRHVyYXRpb25SCGR1cmF0aW9uEjkKCmNyZWF0ZWRfYXQYCCABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgljcmVhdGVkQXQSOQoKdXBkYXRlZF9hdBgJIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCXVwZGF0ZWRBdBI5CgpldmVudF90aW1lGAogASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJZXZlbnRUaW1lEjIKCmV2ZW50X3R5cGUYCyABKA4yEy50cmlwLlRyaXBFdmVudFR5cGVSCWV2ZW50VHlwZQ==');
@$core.Deprecated('Use tripEventRequestDescriptor instead')
const TripEventRequest$json = const {
  '1': 'TripEventRequest',
  '2': const [
    const {'1': 'trip_id', '3': 1, '4': 1, '5': 9, '10': 'tripId'},
    const {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'origin', '3': 3, '4': 1, '5': 11, '6': '.trip.TripCoordinates', '10': 'origin'},
    const {'1': 'destination', '3': 4, '4': 1, '5': 11, '6': '.trip.TripCoordinates', '10': 'destination'},
    const {'1': 'departure_time', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'departureTime'},
    const {'1': 'duration', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Duration', '10': 'duration'},
    const {'1': 'event_time', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'eventTime'},
    const {'1': 'event_type', '3': 8, '4': 1, '5': 14, '6': '.trip.TripEventType', '10': 'eventType'},
  ],
};

/// Descriptor for `TripEventRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tripEventRequestDescriptor = $convert.base64Decode('ChBUcmlwRXZlbnRSZXF1ZXN0EhcKB3RyaXBfaWQYASABKAlSBnRyaXBJZBIXCgd1c2VyX2lkGAIgASgJUgZ1c2VySWQSLQoGb3JpZ2luGAMgASgLMhUudHJpcC5UcmlwQ29vcmRpbmF0ZXNSBm9yaWdpbhI3CgtkZXN0aW5hdGlvbhgEIAEoCzIVLnRyaXAuVHJpcENvb3JkaW5hdGVzUgtkZXN0aW5hdGlvbhJBCg5kZXBhcnR1cmVfdGltZRgFIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSDWRlcGFydHVyZVRpbWUSNQoIZHVyYXRpb24YBiABKAsyGS5nb29nbGUucHJvdG9idWYuRHVyYXRpb25SCGR1cmF0aW9uEjkKCmV2ZW50X3RpbWUYByABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUglldmVudFRpbWUSMgoKZXZlbnRfdHlwZRgIIAEoDjITLnRyaXAuVHJpcEV2ZW50VHlwZVIJZXZlbnRUeXBl');
@$core.Deprecated('Use tripCoordinatesDescriptor instead')
const TripCoordinates$json = const {
  '1': 'TripCoordinates',
  '2': const [
    const {'1': 'latitude', '3': 1, '4': 1, '5': 1, '10': 'latitude'},
    const {'1': 'longitude', '3': 2, '4': 1, '5': 1, '10': 'longitude'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'name', '17': true},
  ],
  '8': const [
    const {'1': '_name'},
  ],
};

/// Descriptor for `TripCoordinates`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tripCoordinatesDescriptor = $convert.base64Decode('Cg9UcmlwQ29vcmRpbmF0ZXMSGgoIbGF0aXR1ZGUYASABKAFSCGxhdGl0dWRlEhwKCWxvbmdpdHVkZRgCIAEoAVIJbG9uZ2l0dWRlEhcKBG5hbWUYAyABKAlIAFIEbmFtZYgBAUIHCgVfbmFtZQ==');
