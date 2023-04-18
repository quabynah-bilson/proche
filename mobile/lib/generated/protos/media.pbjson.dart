///
//  Generated code. Do not modify.
//  source: media.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use mediaTypeDescriptor instead')
const MediaType$json = const {
  '1': 'MediaType',
  '2': const [
    const {'1': 'IMAGE', '2': 0},
    const {'1': 'VIDEO', '2': 1},
  ],
};

/// Descriptor for `MediaType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List mediaTypeDescriptor = $convert.base64Decode('CglNZWRpYVR5cGUSCQoFSU1BR0UQABIJCgVWSURFTxAB');
@$core.Deprecated('Use uploadMediaRequestDescriptor instead')
const UploadMediaRequest$json = const {
  '1': 'UploadMediaRequest',
  '2': const [
    const {'1': 'media', '3': 1, '4': 1, '5': 12, '10': 'media'},
    const {'1': 'type', '3': 2, '4': 1, '5': 14, '6': '.media.MediaType', '10': 'type'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'name', '17': true},
    const {'1': 'owner', '3': 4, '4': 1, '5': 9, '9': 1, '10': 'owner', '17': true},
  ],
  '8': const [
    const {'1': '_name'},
    const {'1': '_owner'},
  ],
};

/// Descriptor for `UploadMediaRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uploadMediaRequestDescriptor = $convert.base64Decode('ChJVcGxvYWRNZWRpYVJlcXVlc3QSFAoFbWVkaWEYASABKAxSBW1lZGlhEiQKBHR5cGUYAiABKA4yEC5tZWRpYS5NZWRpYVR5cGVSBHR5cGUSFwoEbmFtZRgDIAEoCUgAUgRuYW1liAEBEhkKBW93bmVyGAQgASgJSAFSBW93bmVyiAEBQgcKBV9uYW1lQggKBl9vd25lcg==');
