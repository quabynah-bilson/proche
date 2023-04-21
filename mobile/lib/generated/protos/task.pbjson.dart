///
//  Generated code. Do not modify.
//  source: task.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
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
    const {'1': 'task_events', '3': 1, '4': 3, '5': 11, '6': '.task.TaskEvent', '10': 'taskEvents'},
  ],
};

/// Descriptor for `TaskEventList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List taskEventListDescriptor = $convert.base64Decode('Cg1UYXNrRXZlbnRMaXN0EjAKC3Rhc2tfZXZlbnRzGAEgAygLMg8udGFzay5UYXNrRXZlbnRSCnRhc2tFdmVudHM=');
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
  ],
  '8': const [
    const {'1': '_charge_per_hour'},
  ],
};

/// Descriptor for `CreateTaskRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createTaskRequestDescriptor = $convert.base64Decode('ChFDcmVhdGVUYXNrUmVxdWVzdBIUCgV0aXRsZRgBIAEoCVIFdGl0bGUSIAoLZGVzY3JpcHRpb24YAiABKAlSC2Rlc2NyaXB0aW9uEjUKCGR1ZV9kYXRlGAMgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIHZHVlRGF0ZRI1CghkdXJhdGlvbhgEIAEoCzIZLmdvb2dsZS5wcm90b2J1Zi5EdXJhdGlvblIIZHVyYXRpb24SFwoHdXNlcl9pZBgFIAEoCVIGdXNlcklkEisKD2NoYXJnZV9wZXJfaG91chgGIAEoAUgAUg1jaGFyZ2VQZXJIb3VyiAEBEi0KB2FkZHJlc3MYByABKAsyEy5jb3JlLkNvbW1vbkFkZHJlc3NSB2FkZHJlc3NCEgoQX2NoYXJnZV9wZXJfaG91cg==');
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
    const {'1': 'tasks', '3': 1, '4': 3, '5': 11, '6': '.task.ProcheTask', '10': 'tasks'},
  ],
};

/// Descriptor for `TaskList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List taskListDescriptor = $convert.base64Decode('CghUYXNrTGlzdBImCgV0YXNrcxgBIAMoCzIQLnRhc2suUHJvY2hlVGFza1IFdGFza3M=');
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
  ],
  '8': const [
    const {'1': '_charge_per_hour'},
  ],
};

/// Descriptor for `ProcheTask`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List procheTaskDescriptor = $convert.base64Decode('CgpQcm9jaGVUYXNrEg4KAmlkGAEgASgJUgJpZBIUCgV0aXRsZRgCIAEoCVIFdGl0bGUSIAoLZGVzY3JpcHRpb24YAyABKAlSC2Rlc2NyaXB0aW9uEjkKCmNyZWF0ZWRfYXQYBCABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgljcmVhdGVkQXQSOQoKdXBkYXRlZF9hdBgFIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCXVwZGF0ZWRBdBI1CghkdWVfZGF0ZRgGIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSB2R1ZURhdGUSNQoIZHVyYXRpb24YByABKAsyGS5nb29nbGUucHJvdG9idWYuRHVyYXRpb25SCGR1cmF0aW9uEhwKCWNvbXBsZXRlZBgIIAEoCFIJY29tcGxldGVkEisKD2NoYXJnZV9wZXJfaG91chgJIAEoAUgAUg1jaGFyZ2VQZXJIb3VyiAEBEhcKB3VzZXJfaWQYCiABKAlSBnVzZXJJZBItCgdhZGRyZXNzGAsgASgLMhMuY29yZS5Db21tb25BZGRyZXNzUgdhZGRyZXNzQhIKEF9jaGFyZ2VfcGVyX2hvdXI=');
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
