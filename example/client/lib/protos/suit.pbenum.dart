// This is a generated file - do not edit.
//
// Generated from suit.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

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

  static final $core.List<SuitSize?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static SuitSize? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const SuitSize._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
