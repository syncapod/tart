///
//  Generated code. Do not modify.
//  source: suit.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use suitSizeDescriptor instead')
const SuitSize$json = const {
  '1': 'SuitSize',
  '2': const [
    const {'1': 'SM', '2': 0},
    const {'1': 'MD', '2': 1},
    const {'1': 'LG', '2': 2},
    const {'1': 'XL', '2': 3},
  ],
};

/// Descriptor for `SuitSize`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List suitSizeDescriptor = $convert
    .base64Decode('CghTdWl0U2l6ZRIGCgJTTRAAEgYKAk1EEAESBgoCTEcQAhIGCgJYTBAD');
@$core.Deprecated('Use suitSizeReqDescriptor instead')
const SuitSizeReq$json = const {
  '1': 'SuitSizeReq',
  '2': const [
    const {
      '1': 'size',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.protos.SuitSize',
      '10': 'size'
    },
  ],
};

/// Descriptor for `SuitSizeReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List suitSizeReqDescriptor = $convert.base64Decode(
    'CgtTdWl0U2l6ZVJlcRIkCgRzaXplGAEgASgOMhAucHJvdG9zLlN1aXRTaXplUgRzaXpl');
@$core.Deprecated('Use suitDescriptor instead')
const Suit$json = const {
  '1': 'Suit',
  '2': const [
    const {
      '1': 'size',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.protos.SuitSize',
      '10': 'size'
    },
    const {'1': 'color', '3': 2, '4': 1, '5': 9, '10': 'color'},
  ],
};

/// Descriptor for `Suit`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List suitDescriptor = $convert.base64Decode(
    'CgRTdWl0EiQKBHNpemUYASABKA4yEC5wcm90b3MuU3VpdFNpemVSBHNpemUSFAoFY29sb3IYAiABKAlSBWNvbG9y');
