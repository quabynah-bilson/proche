///
//  Generated code. Do not modify.
//  source: giveaway.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class GiveAwayDispatchType extends $pb.ProtobufEnum {
  static const GiveAwayDispatchType GIVEAWAY_PICKUP = GiveAwayDispatchType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GIVEAWAY_PICKUP');
  static const GiveAwayDispatchType GIVEAWAY_DELIVERY = GiveAwayDispatchType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GIVEAWAY_DELIVERY');

  static const $core.List<GiveAwayDispatchType> values = <GiveAwayDispatchType> [
    GIVEAWAY_PICKUP,
    GIVEAWAY_DELIVERY,
  ];

  static final $core.Map<$core.int, GiveAwayDispatchType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static GiveAwayDispatchType? valueOf($core.int value) => _byValue[value];

  const GiveAwayDispatchType._($core.int v, $core.String n) : super(v, n);
}

