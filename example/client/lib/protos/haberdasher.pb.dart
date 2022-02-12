///
//  Generated code. Do not modify.
//  source: haberdasher.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'suit.pb.dart' as $0;

class Size extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Size', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'inches', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  Size._() : super();
  factory Size({
    $core.int? inches,
  }) {
    final _result = create();
    if (inches != null) {
      _result.inches = inches;
    }
    return _result;
  }
  factory Size.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Size.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Size clone() => Size()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Size copyWith(void Function(Size) updates) => super.copyWith((message) => updates(message as Size)) as Size; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Size create() => Size._();
  Size createEmptyInstance() => create();
  static $pb.PbList<Size> createRepeated() => $pb.PbList<Size>();
  @$core.pragma('dart2js:noInline')
  static Size getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Size>(create);
  static Size? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get inches => $_getIZ(0);
  @$pb.TagNumber(1)
  set inches($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasInches() => $_has(0);
  @$pb.TagNumber(1)
  void clearInches() => clearField(1);
}

class Hat extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Hat', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'inches', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'color')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..hasRequiredFields = false
  ;

  Hat._() : super();
  factory Hat({
    $core.int? inches,
    $core.String? color,
    $core.String? name,
  }) {
    final _result = create();
    if (inches != null) {
      _result.inches = inches;
    }
    if (color != null) {
      _result.color = color;
    }
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory Hat.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Hat.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Hat clone() => Hat()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Hat copyWith(void Function(Hat) updates) => super.copyWith((message) => updates(message as Hat)) as Hat; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Hat create() => Hat._();
  Hat createEmptyInstance() => create();
  static $pb.PbList<Hat> createRepeated() => $pb.PbList<Hat>();
  @$core.pragma('dart2js:noInline')
  static Hat getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Hat>(create);
  static Hat? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get inches => $_getIZ(0);
  @$pb.TagNumber(1)
  set inches($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasInches() => $_has(0);
  @$pb.TagNumber(1)
  void clearInches() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get color => $_getSZ(1);
  @$pb.TagNumber(2)
  set color($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasColor() => $_has(1);
  @$pb.TagNumber(2)
  void clearColor() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);
}

class HaberdasherApi {
  $pb.RpcClient _client;
  HaberdasherApi(this._client);

  $async.Future<Hat> makeHat($pb.ClientContext? ctx, Size request) {
    var emptyResponse = Hat();
    return _client.invoke<Hat>(ctx, 'Haberdasher', 'MakeHat', request, emptyResponse);
  }
  $async.Future<$0.Suit> makeSuit($pb.ClientContext? ctx, $0.SuitSizeReq request) {
    var emptyResponse = $0.Suit();
    return _client.invoke<$0.Suit>(ctx, 'Haberdasher', 'MakeSuit', request, emptyResponse);
  }
}

