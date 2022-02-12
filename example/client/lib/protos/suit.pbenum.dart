///
//  Generated code. Do not modify.
//  source: suit.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class SuitSize extends $pb.ProtobufEnum {
  static const SuitSize SM = SuitSize._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SM');
  static const SuitSize MD = SuitSize._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MD');
  static const SuitSize LG = SuitSize._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'LG');
  static const SuitSize XL = SuitSize._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'XL');

  static const $core.List<SuitSize> values = <SuitSize> [
    SM,
    MD,
    LG,
    XL,
  ];

  static final $core.Map<$core.int, SuitSize> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SuitSize? valueOf($core.int value) => _byValue[value];

  const SuitSize._($core.int v, $core.String n) : super(v, n);
}

