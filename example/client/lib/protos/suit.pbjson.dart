// This is a generated file - do not edit.
//
// Generated from suit.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use suitSizeDescriptor instead')
const SuitSize$json = {
  '1': 'SuitSize',
  '2': [
    {'1': 'SM', '2': 0},
    {'1': 'MD', '2': 1},
    {'1': 'LG', '2': 2},
    {'1': 'XL', '2': 3},
  ],
};

/// Descriptor for `SuitSize`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List suitSizeDescriptor = $convert
    .base64Decode('CghTdWl0U2l6ZRIGCgJTTRAAEgYKAk1EEAESBgoCTEcQAhIGCgJYTBAD');

@$core.Deprecated('Use suitSizeReqDescriptor instead')
const SuitSizeReq$json = {
  '1': 'SuitSizeReq',
  '2': [
    {
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
const Suit$json = {
  '1': 'Suit',
  '2': [
    {
      '1': 'size',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.protos.SuitSize',
      '10': 'size'
    },
    {'1': 'color', '3': 2, '4': 1, '5': 9, '10': 'color'},
  ],
};

/// Descriptor for `Suit`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List suitDescriptor = $convert.base64Decode(
    'CgRTdWl0EiQKBHNpemUYASABKA4yEC5wcm90b3MuU3VpdFNpemVSBHNpemUSFAoFY29sb3IYAi'
    'ABKAlSBWNvbG9y');
