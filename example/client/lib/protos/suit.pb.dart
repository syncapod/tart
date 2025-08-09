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

import 'suit.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'suit.pbenum.dart';

class SuitSizeReq extends $pb.GeneratedMessage {
  factory SuitSizeReq({
    SuitSize? size,
  }) {
    final result = create();
    if (size != null) result.size = size;
    return result;
  }

  SuitSizeReq._();

  factory SuitSizeReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SuitSizeReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SuitSizeReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protos'),
      createEmptyInstance: create)
    ..e<SuitSize>(1, _omitFieldNames ? '' : 'size', $pb.PbFieldType.OE,
        defaultOrMaker: SuitSize.SM,
        valueOf: SuitSize.valueOf,
        enumValues: SuitSize.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SuitSizeReq clone() => SuitSizeReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SuitSizeReq copyWith(void Function(SuitSizeReq) updates) =>
      super.copyWith((message) => updates(message as SuitSizeReq))
          as SuitSizeReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SuitSizeReq create() => SuitSizeReq._();
  @$core.override
  SuitSizeReq createEmptyInstance() => create();
  static $pb.PbList<SuitSizeReq> createRepeated() => $pb.PbList<SuitSizeReq>();
  @$core.pragma('dart2js:noInline')
  static SuitSizeReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SuitSizeReq>(create);
  static SuitSizeReq? _defaultInstance;

  @$pb.TagNumber(1)
  SuitSize get size => $_getN(0);
  @$pb.TagNumber(1)
  set size(SuitSize value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSize() => $_has(0);
  @$pb.TagNumber(1)
  void clearSize() => $_clearField(1);
}

class Suit extends $pb.GeneratedMessage {
  factory Suit({
    SuitSize? size,
    $core.String? color,
  }) {
    final result = create();
    if (size != null) result.size = size;
    if (color != null) result.color = color;
    return result;
  }

  Suit._();

  factory Suit.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Suit.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Suit',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'protos'),
      createEmptyInstance: create)
    ..e<SuitSize>(1, _omitFieldNames ? '' : 'size', $pb.PbFieldType.OE,
        defaultOrMaker: SuitSize.SM,
        valueOf: SuitSize.valueOf,
        enumValues: SuitSize.values)
    ..aOS(2, _omitFieldNames ? '' : 'color')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Suit clone() => Suit()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Suit copyWith(void Function(Suit) updates) =>
      super.copyWith((message) => updates(message as Suit)) as Suit;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Suit create() => Suit._();
  @$core.override
  Suit createEmptyInstance() => create();
  static $pb.PbList<Suit> createRepeated() => $pb.PbList<Suit>();
  @$core.pragma('dart2js:noInline')
  static Suit getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Suit>(create);
  static Suit? _defaultInstance;

  @$pb.TagNumber(1)
  SuitSize get size => $_getN(0);
  @$pb.TagNumber(1)
  set size(SuitSize value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSize() => $_has(0);
  @$pb.TagNumber(1)
  void clearSize() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get color => $_getSZ(1);
  @$pb.TagNumber(2)
  set color($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasColor() => $_has(1);
  @$pb.TagNumber(2)
  void clearColor() => $_clearField(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
