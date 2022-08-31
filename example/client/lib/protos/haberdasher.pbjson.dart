///
//  Generated code. Do not modify.
//  source: haberdasher.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
import 'suit.pbjson.dart' as $0;

@$core.Deprecated('Use sizeDescriptor instead')
const Size$json = const {
  '1': 'Size',
  '2': const [
    const {'1': 'inches', '3': 1, '4': 1, '5': 5, '10': 'inches'},
  ],
};

/// Descriptor for `Size`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sizeDescriptor =
    $convert.base64Decode('CgRTaXplEhYKBmluY2hlcxgBIAEoBVIGaW5jaGVz');
@$core.Deprecated('Use hatDescriptor instead')
const Hat$json = const {
  '1': 'Hat',
  '2': const [
    const {'1': 'inches', '3': 1, '4': 1, '5': 5, '10': 'inches'},
    const {'1': 'color', '3': 2, '4': 1, '5': 9, '10': 'color'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `Hat`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List hatDescriptor = $convert.base64Decode(
    'CgNIYXQSFgoGaW5jaGVzGAEgASgFUgZpbmNoZXMSFAoFY29sb3IYAiABKAlSBWNvbG9yEhIKBG5hbWUYAyABKAlSBG5hbWU=');
const $core.Map<$core.String, $core.dynamic> HaberdasherServiceBase$json =
    const {
  '1': 'Haberdasher',
  '2': const [
    const {'1': 'MakeHat', '2': '.protos.Size', '3': '.protos.Hat'},
    const {'1': 'MakeSuit', '2': '.protos.SuitSizeReq', '3': '.protos.Suit'},
  ],
};

@$core.Deprecated('Use haberdasherServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    HaberdasherServiceBase$messageJson = const {
  '.protos.Size': Size$json,
  '.protos.Hat': Hat$json,
  '.protos.SuitSizeReq': $0.SuitSizeReq$json,
  '.protos.Suit': $0.Suit$json,
};

/// Descriptor for `Haberdasher`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List haberdasherServiceDescriptor = $convert.base64Decode(
    'CgtIYWJlcmRhc2hlchIkCgdNYWtlSGF0EgwucHJvdG9zLlNpemUaCy5wcm90b3MuSGF0Ei0KCE1ha2VTdWl0EhMucHJvdG9zLlN1aXRTaXplUmVxGgwucHJvdG9zLlN1aXQ=');
