///
//  Generated code. Do not modify.
//  source: shared.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class AppVersion_UpdateType extends $pb.ProtobufEnum {
  static const AppVersion_UpdateType OPTIONAL = AppVersion_UpdateType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'OPTIONAL');
  static const AppVersion_UpdateType MANDATORY = AppVersion_UpdateType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MANDATORY');

  static const $core.List<AppVersion_UpdateType> values = <AppVersion_UpdateType> [
    OPTIONAL,
    MANDATORY,
  ];

  static final $core.Map<$core.int, AppVersion_UpdateType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AppVersion_UpdateType? valueOf($core.int value) => _byValue[value];

  const AppVersion_UpdateType._($core.int v, $core.String n) : super(v, n);
}

