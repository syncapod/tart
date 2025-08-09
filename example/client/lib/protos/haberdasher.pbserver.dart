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

import 'haberdasher.pb.dart' as $1;
import 'haberdasher.pbjson.dart';
import 'suit.pb.dart' as $0;

export 'haberdasher.pb.dart';

abstract class HaberdasherServiceBase extends $pb.GeneratedService {
  $async.Future<$1.Hat> makeHat($pb.ServerContext ctx, $1.Size request);
  $async.Future<$0.Suit> makeSuit(
      $pb.ServerContext ctx, $0.SuitSizeReq request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'MakeHat':
        return $1.Size();
      case 'MakeSuit':
        return $0.SuitSizeReq();
      default:
        throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx,
      $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'MakeHat':
        return makeHat(ctx, request as $1.Size);
      case 'MakeSuit':
        return makeSuit(ctx, request as $0.SuitSizeReq);
      default:
        throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json =>
      HaberdasherServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
      get $messageJson => HaberdasherServiceBase$messageJson;
}
