///
//  Generated code. Do not modify.
//  source: trip.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class TripEventType extends $pb.ProtobufEnum {
  static const TripEventType EVENT_UNKNOWN = TripEventType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'EVENT_UNKNOWN');
  static const TripEventType EVENT_BOOKED = TripEventType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'EVENT_BOOKED');
  static const TripEventType EVENT_CANCELLED = TripEventType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'EVENT_CANCELLED');
  static const TripEventType EVENT_STARTED = TripEventType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'EVENT_STARTED');
  static const TripEventType EVENT_COMPLETED = TripEventType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'EVENT_COMPLETED');

  static const $core.List<TripEventType> values = <TripEventType> [
    EVENT_UNKNOWN,
    EVENT_BOOKED,
    EVENT_CANCELLED,
    EVENT_STARTED,
    EVENT_COMPLETED,
  ];

  static final $core.Map<$core.int, TripEventType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static TripEventType? valueOf($core.int value) => _byValue[value];

  const TripEventType._($core.int v, $core.String n) : super(v, n);
}

