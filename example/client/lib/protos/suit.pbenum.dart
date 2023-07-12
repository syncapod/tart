//
//  Generated code. Do not modify.
//  source: suit.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class SuitSize extends $pb.ProtobufEnum {
  static const SuitSize SM = SuitSize._(0, _omitEnumNames ? '' : 'SM');
  static const SuitSize MD = SuitSize._(1, _omitEnumNames ? '' : 'MD');
  static const SuitSize LG = SuitSize._(2, _omitEnumNames ? '' : 'LG');
  static const SuitSize XL = SuitSize._(3, _omitEnumNames ? '' : 'XL');

  static const $core.List<SuitSize> values = <SuitSize>[
    SM,
    MD,
    LG,
    XL,
  ];

  static final $core.Map<$core.int, SuitSize> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static SuitSize? valueOf($core.int value) => _byValue[value];

  const SuitSize._($core.int v, $core.String n) : super(v, n);
}

const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
