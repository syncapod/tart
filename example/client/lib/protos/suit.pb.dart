///
//  Generated code. Do not modify.
//  source: suit.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'suit.pbenum.dart';

export 'suit.pbenum.dart';

class SuitSizeReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SuitSizeReq',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'protos'),
      createEmptyInstance: create)
    ..e<SuitSize>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'size',
        $pb.PbFieldType.OE,
        defaultOrMaker: SuitSize.SM,
        valueOf: SuitSize.valueOf,
        enumValues: SuitSize.values)
    ..hasRequiredFields = false;

  SuitSizeReq._() : super();
  factory SuitSizeReq({
    SuitSize? size,
  }) {
    final _result = create();
    if (size != null) {
      _result.size = size;
    }
    return _result;
  }
  factory SuitSizeReq.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SuitSizeReq.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SuitSizeReq clone() => SuitSizeReq()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SuitSizeReq copyWith(void Function(SuitSizeReq) updates) =>
      super.copyWith((message) => updates(message as SuitSizeReq))
          as SuitSizeReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SuitSizeReq create() => SuitSizeReq._();
  SuitSizeReq createEmptyInstance() => create();
  static $pb.PbList<SuitSizeReq> createRepeated() => $pb.PbList<SuitSizeReq>();
  @$core.pragma('dart2js:noInline')
  static SuitSizeReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SuitSizeReq>(create);
  static SuitSizeReq? _defaultInstance;

  @$pb.TagNumber(1)
  SuitSize get size => $_getN(0);
  @$pb.TagNumber(1)
  set size(SuitSize v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSize() => $_has(0);
  @$pb.TagNumber(1)
  void clearSize() => clearField(1);
}

class Suit extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'Suit',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'protos'),
      createEmptyInstance: create)
    ..e<SuitSize>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'size',
        $pb.PbFieldType.OE,
        defaultOrMaker: SuitSize.SM,
        valueOf: SuitSize.valueOf,
        enumValues: SuitSize.values)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'color')
    ..hasRequiredFields = false;

  Suit._() : super();
  factory Suit({
    SuitSize? size,
    $core.String? color,
  }) {
    final _result = create();
    if (size != null) {
      _result.size = size;
    }
    if (color != null) {
      _result.color = color;
    }
    return _result;
  }
  factory Suit.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Suit.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Suit clone() => Suit()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Suit copyWith(void Function(Suit) updates) =>
      super.copyWith((message) => updates(message as Suit))
          as Suit; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Suit create() => Suit._();
  Suit createEmptyInstance() => create();
  static $pb.PbList<Suit> createRepeated() => $pb.PbList<Suit>();
  @$core.pragma('dart2js:noInline')
  static Suit getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Suit>(create);
  static Suit? _defaultInstance;

  @$pb.TagNumber(1)
  SuitSize get size => $_getN(0);
  @$pb.TagNumber(1)
  set size(SuitSize v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSize() => $_has(0);
  @$pb.TagNumber(1)
  void clearSize() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get color => $_getSZ(1);
  @$pb.TagNumber(2)
  set color($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasColor() => $_has(1);
  @$pb.TagNumber(2)
  void clearColor() => clearField(2);
}
