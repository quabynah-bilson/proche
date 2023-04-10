///
//  Generated code. Do not modify.
//  source: event.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class ProcheEventStatus extends $pb.ProtobufEnum {
  static const ProcheEventStatus ACTIVE = ProcheEventStatus._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ACTIVE');
  static const ProcheEventStatus CANCELLED = ProcheEventStatus._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CANCELLED');
  static const ProcheEventStatus COMPLETED = ProcheEventStatus._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'COMPLETED');

  static const $core.List<ProcheEventStatus> values = <ProcheEventStatus> [
    ACTIVE,
    CANCELLED,
    COMPLETED,
  ];

  static final $core.Map<$core.int, ProcheEventStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ProcheEventStatus? valueOf($core.int value) => _byValue[value];

  const ProcheEventStatus._($core.int v, $core.String n) : super(v, n);
}

