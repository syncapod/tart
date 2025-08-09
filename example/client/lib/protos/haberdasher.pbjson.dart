// This is a generated file - do not edit.
//
// Generated from haberdasher.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

import 'suit.pbjson.dart' as $0;

@$core.Deprecated('Use sizeDescriptor instead')
const Size$json = {
  '1': 'Size',
  '2': [
    {'1': 'inches', '3': 1, '4': 1, '5': 5, '10': 'inches'},
  ],
};

/// Descriptor for `Size`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sizeDescriptor =
    $convert.base64Decode('CgRTaXplEhYKBmluY2hlcxgBIAEoBVIGaW5jaGVz');

@$core.Deprecated('Use hatDescriptor instead')
const Hat$json = {
  '1': 'Hat',
  '2': [
    {'1': 'inches', '3': 1, '4': 1, '5': 5, '10': 'inches'},
    {'1': 'color', '3': 2, '4': 1, '5': 9, '10': 'color'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `Hat`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List hatDescriptor = $convert.base64Decode(
    'CgNIYXQSFgoGaW5jaGVzGAEgASgFUgZpbmNoZXMSFAoFY29sb3IYAiABKAlSBWNvbG9yEhIKBG'
    '5hbWUYAyABKAlSBG5hbWU=');

const $core.Map<$core.String, $core.dynamic> HaberdasherServiceBase$json = {
  '1': 'Haberdasher',
  '2': [
    {'1': 'MakeHat', '2': '.protos.Size', '3': '.protos.Hat'},
    {'1': 'MakeSuit', '2': '.protos.SuitSizeReq', '3': '.protos.Suit'},
  ],
};

@$core.Deprecated('Use haberdasherServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    HaberdasherServiceBase$messageJson = {
  '.protos.Size': Size$json,
  '.protos.Hat': Hat$json,
  '.protos.SuitSizeReq': $0.SuitSizeReq$json,
  '.protos.Suit': $0.Suit$json,
};

/// Descriptor for `Haberdasher`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List haberdasherServiceDescriptor = $convert.base64Decode(
    'CgtIYWJlcmRhc2hlchIkCgdNYWtlSGF0EgwucHJvdG9zLlNpemUaCy5wcm90b3MuSGF0Ei0KCE'
    '1ha2VTdWl0EhMucHJvdG9zLlN1aXRTaXplUmVxGgwucHJvdG9zLlN1aXQ=');
