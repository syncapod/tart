// This is a generated file - do not edit.
//
// Generated from haberdasher.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'suit.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// Size of a Hat, in inches.
class Size extends $pb.GeneratedMessage {
  factory Size({
    $core.int? inches,
  }) {
    final result = create();
    if (inches != null) result.inches = inches;
    return result;
  }

  Size._();

  factory Size.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Size.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Size',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protos'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'inches', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Size clone() => Size()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Size copyWith(void Function(Size) updates) =>
      super.copyWith((message) => updates(message as Size)) as Size;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Size create() => Size._();
  @$core.override
  Size createEmptyInstance() => create();
  static $pb.PbList<Size> createRepeated() => $pb.PbList<Size>();
  @$core.pragma('dart2js:noInline')
  static Size getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Size>(create);
  static Size? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get inches => $_getIZ(0);
  @$pb.TagNumber(1)
  set inches($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasInches() => $_has(0);
  @$pb.TagNumber(1)
  void clearInches() => $_clearField(1);
}

/// A Hat is a piece of headwear made by a Haberdasher.
class Hat extends $pb.GeneratedMessage {
  factory Hat({
    $core.int? inches,
    $core.String? color,
    $core.String? name,
  }) {
    final result = create();
    if (inches != null) result.inches = inches;
    if (color != null) result.color = color;
    if (name != null) result.name = name;
    return result;
  }

  Hat._();

  factory Hat.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Hat.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Hat',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protos'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'inches', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'color')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Hat clone() => Hat()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Hat copyWith(void Function(Hat) updates) =>
      super.copyWith((message) => updates(message as Hat)) as Hat;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Hat create() => Hat._();
  @$core.override
  Hat createEmptyInstance() => create();
  static $pb.PbList<Hat> createRepeated() => $pb.PbList<Hat>();
  @$core.pragma('dart2js:noInline')
  static Hat getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Hat>(create);
  static Hat? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get inches => $_getIZ(0);
  @$pb.TagNumber(1)
  set inches($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasInches() => $_has(0);
  @$pb.TagNumber(1)
  void clearInches() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get color => $_getSZ(1);
  @$pb.TagNumber(2)
  set color($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasColor() => $_has(1);
  @$pb.TagNumber(2)
  void clearColor() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => $_clearField(3);
}

/// Haberdasher service makes hats for clients.
class HaberdasherApi {
  final $pb.RpcClient _client;

  HaberdasherApi(this._client);

  /// MakeHat produces a hat of mysterious, randomly-selected color!
  $async.Future<Hat> makeHat($pb.ClientContext? ctx, Size request) =>
      _client.invoke<Hat>(ctx, 'Haberdasher', 'MakeHat', request, Hat());

  /// MakeSuit produces a suit of perfect proportions, with random color
  $async.Future<$0.Suit> makeSuit(
          $pb.ClientContext? ctx, $0.SuitSizeReq request) =>
      _client.invoke<$0.Suit>(
          ctx, 'Haberdasher', 'MakeSuit', request, $0.Suit());
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
