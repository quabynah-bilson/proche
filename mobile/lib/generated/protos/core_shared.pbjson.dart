///
//  Generated code. Do not modify.
//  source: core_shared.proto
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
@$core.Deprecated('Use getPostsForUserResponseDescriptor instead')
const GetPostsForUserResponse$json = const {
  '1': 'GetPostsForUserResponse',
  '2': const [
    const {'1': 'tasks', '3': 1, '4': 3, '5': 11, '6': '.core.ProcheTask', '10': 'tasks'},
    const {'1': 'events', '3': 2, '4': 3, '5': 11, '6': '.core.ProcheEvent', '10': 'events'},
    const {'1': 'trips', '3': 3, '4': 3, '5': 11, '6': '.core.Trip', '10': 'trips'},
    const {'1': 'giveaways', '3': 4, '4': 3, '5': 11, '6': '.core.GiveAway', '10': 'giveaways'},
  ],
};

/// Descriptor for `GetPostsForUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPostsForUserResponseDescriptor = $convert.base64Decode('ChdHZXRQb3N0c0ZvclVzZXJSZXNwb25zZRImCgV0YXNrcxgBIAMoCzIQLmNvcmUuUHJvY2hlVGFza1IFdGFza3MSKQoGZXZlbnRzGAIgAygLMhEuY29yZS5Qcm9jaGVFdmVudFIGZXZlbnRzEiAKBXRyaXBzGAMgAygLMgouY29yZS5UcmlwUgV0cmlwcxIsCglnaXZlYXdheXMYBCADKAsyDi5jb3JlLkdpdmVBd2F5UglnaXZlYXdheXM=');
@$core.Deprecated('Use commonAddressDescriptor instead')
const CommonAddress$json = const {
  '1': 'CommonAddress',
  '2': const [
    const {'1': 'latitude', '3': 1, '4': 1, '5': 1, '10': 'latitude'},
    const {'1': 'longitude', '3': 2, '4': 1, '5': 1, '10': 'longitude'},
    const {'1': 'radius', '3': 3, '4': 1, '5': 1, '10': 'radius'},
  ],
};

/// Descriptor for `CommonAddress`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List commonAddressDescriptor = $convert.base64Decode('Cg1Db21tb25BZGRyZXNzEhoKCGxhdGl0dWRlGAEgASgBUghsYXRpdHVkZRIcCglsb25naXR1ZGUYAiABKAFSCWxvbmdpdHVkZRIWCgZyYWRpdXMYAyABKAFSBnJhZGl1cw==');
@$core.Deprecated('Use tripCandidateListDescriptor instead')
const TripCandidateList$json = const {
  '1': 'TripCandidateList',
  '2': const [
    const {'1': 'candidates', '3': 1, '4': 3, '5': 11, '6': '.auth.Account', '10': 'candidates'},
  ],
};

/// Descriptor for `TripCandidateList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tripCandidateListDescriptor = $convert.base64Decode('ChFUcmlwQ2FuZGlkYXRlTGlzdBItCgpjYW5kaWRhdGVzGAEgAygLMg0uYXV0aC5BY2NvdW50UgpjYW5kaWRhdGVz');
@$core.Deprecated('Use tripListDescriptor instead')
const TripList$json = const {
  '1': 'TripList',
  '2': const [
    const {'1': 'trips', '3': 1, '4': 3, '5': 11, '6': '.core.Trip', '10': 'trips'},
  ],
};

/// Descriptor for `TripList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tripListDescriptor = $convert.base64Decode('CghUcmlwTGlzdBIgCgV0cmlwcxgBIAMoCzIKLmNvcmUuVHJpcFIFdHJpcHM=');
@$core.Deprecated('Use tripEventListDescriptor instead')
const TripEventList$json = const {
  '1': 'TripEventList',
  '2': const [
    const {'1': 'trip_events', '3': 1, '4': 3, '5': 11, '6': '.core.TripEvent', '10': 'tripEvents'},
  ],
};

/// Descriptor for `TripEventList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tripEventListDescriptor = $convert.base64Decode('Cg1UcmlwRXZlbnRMaXN0EjAKC3RyaXBfZXZlbnRzGAEgAygLMg8uY29yZS5UcmlwRXZlbnRSCnRyaXBFdmVudHM=');
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
    const {'1': 'event_type', '3': 11, '4': 1, '5': 14, '6': '.core.TripEventType', '10': 'eventType'},
  ],
};

/// Descriptor for `TripEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tripEventDescriptor = $convert.base64Decode('CglUcmlwRXZlbnQSDgoCaWQYASABKAlSAmlkEhcKB3RyaXBfaWQYAiABKAlSBnRyaXBJZBIXCgd1c2VyX2lkGAMgASgJUgZ1c2VySWQSKwoGb3JpZ2luGAQgASgLMhMuY29yZS5Db21tb25BZGRyZXNzUgZvcmlnaW4SNQoLZGVzdGluYXRpb24YBSABKAsyEy5jb3JlLkNvbW1vbkFkZHJlc3NSC2Rlc3RpbmF0aW9uEkEKDmRlcGFydHVyZV90aW1lGAYgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFINZGVwYXJ0dXJlVGltZRI1CghkdXJhdGlvbhgHIAEoCzIZLmdvb2dsZS5wcm90b2J1Zi5EdXJhdGlvblIIZHVyYXRpb24SOQoKY3JlYXRlZF9hdBgIIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCWNyZWF0ZWRBdBI5Cgp1cGRhdGVkX2F0GAkgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJdXBkYXRlZEF0EjkKCmV2ZW50X3RpbWUYCiABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUglldmVudFRpbWUSMgoKZXZlbnRfdHlwZRgLIAEoDjITLmNvcmUuVHJpcEV2ZW50VHlwZVIJZXZlbnRUeXBl');
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
    const {'1': 'event_type', '3': 8, '4': 1, '5': 14, '6': '.core.TripEventType', '10': 'eventType'},
  ],
};

/// Descriptor for `TripEventRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tripEventRequestDescriptor = $convert.base64Decode('ChBUcmlwRXZlbnRSZXF1ZXN0EhcKB3RyaXBfaWQYASABKAlSBnRyaXBJZBIXCgd1c2VyX2lkGAIgASgJUgZ1c2VySWQSKwoGb3JpZ2luGAMgASgLMhMuY29yZS5Db21tb25BZGRyZXNzUgZvcmlnaW4SNQoLZGVzdGluYXRpb24YBCABKAsyEy5jb3JlLkNvbW1vbkFkZHJlc3NSC2Rlc3RpbmF0aW9uEkEKDmRlcGFydHVyZV90aW1lGAUgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFINZGVwYXJ0dXJlVGltZRI1CghkdXJhdGlvbhgGIAEoCzIZLmdvb2dsZS5wcm90b2J1Zi5EdXJhdGlvblIIZHVyYXRpb24SOQoKZXZlbnRfdGltZRgHIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCWV2ZW50VGltZRIyCgpldmVudF90eXBlGAggASgOMhMuY29yZS5UcmlwRXZlbnRUeXBlUglldmVudFR5cGU=');
@$core.Deprecated('Use applyForTaskRequestDescriptor instead')
const ApplyForTaskRequest$json = const {
  '1': 'ApplyForTaskRequest',
  '2': const [
    const {'1': 'task_id', '3': 1, '4': 1, '5': 9, '10': 'taskId'},
    const {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `ApplyForTaskRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List applyForTaskRequestDescriptor = $convert.base64Decode('ChNBcHBseUZvclRhc2tSZXF1ZXN0EhcKB3Rhc2tfaWQYASABKAlSBnRhc2tJZBIXCgd1c2VyX2lkGAIgASgJUgZ1c2VySWQ=');
@$core.Deprecated('Use taskCandidateListDescriptor instead')
const TaskCandidateList$json = const {
  '1': 'TaskCandidateList',
  '2': const [
    const {'1': 'candidates', '3': 1, '4': 3, '5': 11, '6': '.core.TaskCandidate', '10': 'candidates'},
  ],
};

/// Descriptor for `TaskCandidateList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List taskCandidateListDescriptor = $convert.base64Decode('ChFUYXNrQ2FuZGlkYXRlTGlzdBIzCgpjYW5kaWRhdGVzGAEgAygLMhMuY29yZS5UYXNrQ2FuZGlkYXRlUgpjYW5kaWRhdGVz');
@$core.Deprecated('Use taskCandidateDescriptor instead')
const TaskCandidate$json = const {
  '1': 'TaskCandidate',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'task_id', '3': 2, '4': 1, '5': 9, '10': 'taskId'},
    const {'1': 'account', '3': 3, '4': 1, '5': 11, '6': '.auth.BusinessAccount', '10': 'account'},
    const {'1': 'created_at', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    const {'1': 'updated_at', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
    const {'1': 'hired', '3': 6, '4': 1, '5': 8, '10': 'hired'},
  ],
};

/// Descriptor for `TaskCandidate`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List taskCandidateDescriptor = $convert.base64Decode('Cg1UYXNrQ2FuZGlkYXRlEg4KAmlkGAEgASgJUgJpZBIXCgd0YXNrX2lkGAIgASgJUgZ0YXNrSWQSLwoHYWNjb3VudBgDIAEoCzIVLmF1dGguQnVzaW5lc3NBY2NvdW50UgdhY2NvdW50EjkKCmNyZWF0ZWRfYXQYBCABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgljcmVhdGVkQXQSOQoKdXBkYXRlZF9hdBgFIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCXVwZGF0ZWRBdBIUCgVoaXJlZBgGIAEoCFIFaGlyZWQ=');
@$core.Deprecated('Use taskEventRequestDescriptor instead')
const TaskEventRequest$json = const {
  '1': 'TaskEventRequest',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'task_id', '3': 2, '4': 1, '5': 9, '10': 'taskId'},
  ],
};

/// Descriptor for `TaskEventRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List taskEventRequestDescriptor = $convert.base64Decode('ChBUYXNrRXZlbnRSZXF1ZXN0EhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZBIXCgd0YXNrX2lkGAIgASgJUgZ0YXNrSWQ=');
@$core.Deprecated('Use completeTaskEventRequestDescriptor instead')
const CompleteTaskEventRequest$json = const {
  '1': 'CompleteTaskEventRequest',
  '2': const [
    const {'1': 'task_id', '3': 1, '4': 1, '5': 9, '10': 'taskId'},
    const {'1': 'end_time', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'endTime'},
    const {'1': 'notes', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'notes', '17': true},
  ],
  '8': const [
    const {'1': '_notes'},
  ],
};

/// Descriptor for `CompleteTaskEventRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List completeTaskEventRequestDescriptor = $convert.base64Decode('ChhDb21wbGV0ZVRhc2tFdmVudFJlcXVlc3QSFwoHdGFza19pZBgBIAEoCVIGdGFza0lkEjUKCGVuZF90aW1lGAIgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIHZW5kVGltZRIZCgVub3RlcxgDIAEoCUgAUgVub3Rlc4gBAUIICgZfbm90ZXM=');
@$core.Deprecated('Use taskEventListDescriptor instead')
const TaskEventList$json = const {
  '1': 'TaskEventList',
  '2': const [
    const {'1': 'task_events', '3': 1, '4': 3, '5': 11, '6': '.core.TaskEvent', '10': 'taskEvents'},
  ],
};

/// Descriptor for `TaskEventList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List taskEventListDescriptor = $convert.base64Decode('Cg1UYXNrRXZlbnRMaXN0EjAKC3Rhc2tfZXZlbnRzGAEgAygLMg8uY29yZS5UYXNrRXZlbnRSCnRhc2tFdmVudHM=');
@$core.Deprecated('Use createTaskEventRequestDescriptor instead')
const CreateTaskEventRequest$json = const {
  '1': 'CreateTaskEventRequest',
  '2': const [
    const {'1': 'task_id', '3': 1, '4': 1, '5': 9, '10': 'taskId'},
    const {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'start_time', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'startTime'},
    const {'1': 'notes', '3': 4, '4': 1, '5': 9, '9': 0, '10': 'notes', '17': true},
    const {'1': 'vaccine_card_url', '3': 5, '4': 1, '5': 9, '9': 1, '10': 'vaccineCardUrl', '17': true},
  ],
  '8': const [
    const {'1': '_notes'},
    const {'1': '_vaccine_card_url'},
  ],
};

/// Descriptor for `CreateTaskEventRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createTaskEventRequestDescriptor = $convert.base64Decode('ChZDcmVhdGVUYXNrRXZlbnRSZXF1ZXN0EhcKB3Rhc2tfaWQYASABKAlSBnRhc2tJZBIXCgd1c2VyX2lkGAIgASgJUgZ1c2VySWQSOQoKc3RhcnRfdGltZRgDIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCXN0YXJ0VGltZRIZCgVub3RlcxgEIAEoCUgAUgVub3Rlc4gBARItChB2YWNjaW5lX2NhcmRfdXJsGAUgASgJSAFSDnZhY2NpbmVDYXJkVXJsiAEBQggKBl9ub3Rlc0ITChFfdmFjY2luZV9jYXJkX3VybA==');
@$core.Deprecated('Use createTaskRequestDescriptor instead')
const CreateTaskRequest$json = const {
  '1': 'CreateTaskRequest',
  '2': const [
    const {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'description', '3': 2, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'due_date', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'dueDate'},
    const {'1': 'duration', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Duration', '10': 'duration'},
    const {'1': 'user_id', '3': 5, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'charge_per_hour', '3': 6, '4': 1, '5': 1, '9': 0, '10': 'chargePerHour', '17': true},
    const {'1': 'address', '3': 7, '4': 1, '5': 11, '6': '.core.CommonAddress', '10': 'address'},
    const {'1': 'image_url', '3': 8, '4': 1, '5': 9, '9': 1, '10': 'imageUrl', '17': true},
  ],
  '8': const [
    const {'1': '_charge_per_hour'},
    const {'1': '_image_url'},
  ],
};

/// Descriptor for `CreateTaskRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createTaskRequestDescriptor = $convert.base64Decode('ChFDcmVhdGVUYXNrUmVxdWVzdBIUCgV0aXRsZRgBIAEoCVIFdGl0bGUSIAoLZGVzY3JpcHRpb24YAiABKAlSC2Rlc2NyaXB0aW9uEjUKCGR1ZV9kYXRlGAMgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIHZHVlRGF0ZRI1CghkdXJhdGlvbhgEIAEoCzIZLmdvb2dsZS5wcm90b2J1Zi5EdXJhdGlvblIIZHVyYXRpb24SFwoHdXNlcl9pZBgFIAEoCVIGdXNlcklkEisKD2NoYXJnZV9wZXJfaG91chgGIAEoAUgAUg1jaGFyZ2VQZXJIb3VyiAEBEi0KB2FkZHJlc3MYByABKAsyEy5jb3JlLkNvbW1vbkFkZHJlc3NSB2FkZHJlc3MSIAoJaW1hZ2VfdXJsGAggASgJSAFSCGltYWdlVXJsiAEBQhIKEF9jaGFyZ2VfcGVyX2hvdXJCDAoKX2ltYWdlX3VybA==');
@$core.Deprecated('Use updateTaskRequestDescriptor instead')
const UpdateTaskRequest$json = const {
  '1': 'UpdateTaskRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'due_date', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'dueDate'},
    const {'1': 'duration', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Duration', '10': 'duration'},
    const {'1': 'completed', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.BoolValue', '10': 'completed'},
  ],
};

/// Descriptor for `UpdateTaskRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateTaskRequestDescriptor = $convert.base64Decode('ChFVcGRhdGVUYXNrUmVxdWVzdBIOCgJpZBgBIAEoCVICaWQSFAoFdGl0bGUYAiABKAlSBXRpdGxlEiAKC2Rlc2NyaXB0aW9uGAMgASgJUgtkZXNjcmlwdGlvbhI1CghkdWVfZGF0ZRgEIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSB2R1ZURhdGUSNQoIZHVyYXRpb24YBSABKAsyGS5nb29nbGUucHJvdG9idWYuRHVyYXRpb25SCGR1cmF0aW9uEjgKCWNvbXBsZXRlZBgGIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5Cb29sVmFsdWVSCWNvbXBsZXRlZA==');
@$core.Deprecated('Use taskListDescriptor instead')
const TaskList$json = const {
  '1': 'TaskList',
  '2': const [
    const {'1': 'tasks', '3': 1, '4': 3, '5': 11, '6': '.core.ProcheTask', '10': 'tasks'},
  ],
};

/// Descriptor for `TaskList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List taskListDescriptor = $convert.base64Decode('CghUYXNrTGlzdBImCgV0YXNrcxgBIAMoCzIQLmNvcmUuUHJvY2hlVGFza1IFdGFza3M=');
@$core.Deprecated('Use procheTaskDescriptor instead')
const ProcheTask$json = const {
  '1': 'ProcheTask',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'created_at', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    const {'1': 'updated_at', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
    const {'1': 'due_date', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'dueDate'},
    const {'1': 'duration', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Duration', '10': 'duration'},
    const {'1': 'completed', '3': 8, '4': 1, '5': 8, '10': 'completed'},
    const {'1': 'charge_per_hour', '3': 9, '4': 1, '5': 1, '9': 0, '10': 'chargePerHour', '17': true},
    const {'1': 'user_id', '3': 10, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'address', '3': 11, '4': 1, '5': 11, '6': '.core.CommonAddress', '10': 'address'},
    const {'1': 'image_url', '3': 12, '4': 1, '5': 9, '9': 1, '10': 'imageUrl', '17': true},
    const {'1': 'numberOfApplicants', '3': 13, '4': 1, '5': 5, '10': 'numberOfApplicants'},
  ],
  '8': const [
    const {'1': '_charge_per_hour'},
    const {'1': '_image_url'},
  ],
};

/// Descriptor for `ProcheTask`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List procheTaskDescriptor = $convert.base64Decode('CgpQcm9jaGVUYXNrEg4KAmlkGAEgASgJUgJpZBIUCgV0aXRsZRgCIAEoCVIFdGl0bGUSIAoLZGVzY3JpcHRpb24YAyABKAlSC2Rlc2NyaXB0aW9uEjkKCmNyZWF0ZWRfYXQYBCABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgljcmVhdGVkQXQSOQoKdXBkYXRlZF9hdBgFIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCXVwZGF0ZWRBdBI1CghkdWVfZGF0ZRgGIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSB2R1ZURhdGUSNQoIZHVyYXRpb24YByABKAsyGS5nb29nbGUucHJvdG9idWYuRHVyYXRpb25SCGR1cmF0aW9uEhwKCWNvbXBsZXRlZBgIIAEoCFIJY29tcGxldGVkEisKD2NoYXJnZV9wZXJfaG91chgJIAEoAUgAUg1jaGFyZ2VQZXJIb3VyiAEBEhcKB3VzZXJfaWQYCiABKAlSBnVzZXJJZBItCgdhZGRyZXNzGAsgASgLMhMuY29yZS5Db21tb25BZGRyZXNzUgdhZGRyZXNzEiAKCWltYWdlX3VybBgMIAEoCUgBUghpbWFnZVVybIgBARIuChJudW1iZXJPZkFwcGxpY2FudHMYDSABKAVSEm51bWJlck9mQXBwbGljYW50c0ISChBfY2hhcmdlX3Blcl9ob3VyQgwKCl9pbWFnZV91cmw=');
@$core.Deprecated('Use taskEventDescriptor instead')
const TaskEvent$json = const {
  '1': 'TaskEvent',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'task_id', '3': 2, '4': 1, '5': 9, '10': 'taskId'},
    const {'1': 'user_id', '3': 3, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'start_time', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'startTime'},
    const {'1': 'end_time', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'endTime'},
    const {'1': 'notes', '3': 6, '4': 1, '5': 9, '9': 0, '10': 'notes', '17': true},
  ],
  '8': const [
    const {'1': '_notes'},
  ],
};

/// Descriptor for `TaskEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List taskEventDescriptor = $convert.base64Decode('CglUYXNrRXZlbnQSDgoCaWQYASABKAlSAmlkEhcKB3Rhc2tfaWQYAiABKAlSBnRhc2tJZBIXCgd1c2VyX2lkGAMgASgJUgZ1c2VySWQSOQoKc3RhcnRfdGltZRgEIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCXN0YXJ0VGltZRI1CghlbmRfdGltZRgFIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSB2VuZFRpbWUSGQoFbm90ZXMYBiABKAlIAFIFbm90ZXOIAQFCCAoGX25vdGVz');
@$core.Deprecated('Use giveawayCandidateListDescriptor instead')
const GiveawayCandidateList$json = const {
  '1': 'GiveawayCandidateList',
  '2': const [
    const {'1': 'candidates', '3': 1, '4': 3, '5': 11, '6': '.auth.Account', '10': 'candidates'},
  ],
};

/// Descriptor for `GiveawayCandidateList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List giveawayCandidateListDescriptor = $convert.base64Decode('ChVHaXZlYXdheUNhbmRpZGF0ZUxpc3QSLQoKY2FuZGlkYXRlcxgBIAMoCzINLmF1dGguQWNjb3VudFIKY2FuZGlkYXRlcw==');
@$core.Deprecated('Use giveAwayListDescriptor instead')
const GiveAwayList$json = const {
  '1': 'GiveAwayList',
  '2': const [
    const {'1': 'giveaways', '3': 1, '4': 3, '5': 11, '6': '.core.GiveAway', '10': 'giveaways'},
  ],
};

/// Descriptor for `GiveAwayList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List giveAwayListDescriptor = $convert.base64Decode('CgxHaXZlQXdheUxpc3QSLAoJZ2l2ZWF3YXlzGAEgAygLMg4uY29yZS5HaXZlQXdheVIJZ2l2ZWF3YXlz');
@$core.Deprecated('Use createGiveAwayRequestDescriptor instead')
const CreateGiveAwayRequest$json = const {
  '1': 'CreateGiveAwayRequest',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'description', '3': 2, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'images', '3': 3, '4': 3, '5': 9, '10': 'images'},
    const {'1': 'address', '3': 4, '4': 1, '5': 11, '6': '.core.CommonAddress', '10': 'address'},
    const {'1': 'dispatch_type', '3': 5, '4': 1, '5': 14, '6': '.core.GiveAwayDispatchType', '10': 'dispatchType'},
    const {'1': 'dispatch_duration', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Duration', '10': 'dispatchDuration'},
  ],
};

/// Descriptor for `CreateGiveAwayRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createGiveAwayRequestDescriptor = $convert.base64Decode('ChVDcmVhdGVHaXZlQXdheVJlcXVlc3QSEgoEbmFtZRgBIAEoCVIEbmFtZRIgCgtkZXNjcmlwdGlvbhgCIAEoCVILZGVzY3JpcHRpb24SFgoGaW1hZ2VzGAMgAygJUgZpbWFnZXMSLQoHYWRkcmVzcxgEIAEoCzITLmNvcmUuQ29tbW9uQWRkcmVzc1IHYWRkcmVzcxI/Cg1kaXNwYXRjaF90eXBlGAUgASgOMhouY29yZS5HaXZlQXdheURpc3BhdGNoVHlwZVIMZGlzcGF0Y2hUeXBlEkYKEWRpc3BhdGNoX2R1cmF0aW9uGAYgASgLMhkuZ29vZ2xlLnByb3RvYnVmLkR1cmF0aW9uUhBkaXNwYXRjaER1cmF0aW9u');
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
@$core.Deprecated('Use eventCandidateListDescriptor instead')
const EventCandidateList$json = const {
  '1': 'EventCandidateList',
  '2': const [
    const {'1': 'candidates', '3': 1, '4': 3, '5': 11, '6': '.auth.Account', '10': 'candidates'},
  ],
};

/// Descriptor for `EventCandidateList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List eventCandidateListDescriptor = $convert.base64Decode('ChJFdmVudENhbmRpZGF0ZUxpc3QSLQoKY2FuZGlkYXRlcxgBIAMoCzINLmF1dGguQWNjb3VudFIKY2FuZGlkYXRlcw==');
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
    const {'1': 'status', '3': 11, '4': 1, '5': 14, '6': '.core.ProcheEventStatus', '10': 'status'},
    const {'1': 'photos', '3': 12, '4': 3, '5': 9, '10': 'photos'},
    const {'1': 'video', '3': 13, '4': 1, '5': 9, '9': 0, '10': 'video', '17': true},
  ],
  '8': const [
    const {'1': '_video'},
  ],
};

/// Descriptor for `ProcheEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List procheEventDescriptor = $convert.base64Decode('CgtQcm9jaGVFdmVudBIOCgJpZBgBIAEoCVICaWQSEgoEbmFtZRgCIAEoCVIEbmFtZRIgCgtkZXNjcmlwdGlvbhgDIAEoCVILZGVzY3JpcHRpb24SGgoIbG9jYXRpb24YBCABKAlSCGxvY2F0aW9uEhoKCGxhdGl0dWRlGAUgASgBUghsYXRpdHVkZRIcCglsb25naXR1ZGUYBiABKAFSCWxvbmdpdHVkZRI5CgpzdGFydF90aW1lGAcgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJc3RhcnRUaW1lEjUKCGVuZF90aW1lGAggASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIHZW5kVGltZRI1CghkdXJhdGlvbhgJIAEoCzIZLmdvb2dsZS5wcm90b2J1Zi5EdXJhdGlvblIIZHVyYXRpb24SFwoHdXNlcl9pZBgKIAEoCVIGdXNlcklkEi8KBnN0YXR1cxgLIAEoDjIXLmNvcmUuUHJvY2hlRXZlbnRTdGF0dXNSBnN0YXR1cxIWCgZwaG90b3MYDCADKAlSBnBob3RvcxIZCgV2aWRlbxgNIAEoCUgAUgV2aWRlb4gBAUIICgZfdmlkZW8=');
@$core.Deprecated('Use procheEventListDescriptor instead')
const ProcheEventList$json = const {
  '1': 'ProcheEventList',
  '2': const [
    const {'1': 'events', '3': 1, '4': 3, '5': 11, '6': '.core.ProcheEvent', '10': 'events'},
  ],
};

/// Descriptor for `ProcheEventList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List procheEventListDescriptor = $convert.base64Decode('Cg9Qcm9jaGVFdmVudExpc3QSKQoGZXZlbnRzGAEgAygLMhEuY29yZS5Qcm9jaGVFdmVudFIGZXZlbnRz');
