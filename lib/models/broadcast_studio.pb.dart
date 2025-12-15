// This is a generated file - do not edit.
//
// Generated from broadcast_studio.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'broadcast_datetime.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// 有关广播电台的数据模型
class BroadcastStudio extends $pb.GeneratedMessage {
  factory BroadcastStudio({
    $core.int? id,
    $core.String? name,
    $core.String? description,
    $core.List<$core.int>? logo,
    $core.double? freq,
    $0.TimeOfDayData? start,
    $0.TimeOfDayData? end,
    $core.bool? like,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (description != null) result.description = description;
    if (logo != null) result.logo = logo;
    if (freq != null) result.freq = freq;
    if (start != null) result.start = start;
    if (end != null) result.end = end;
    if (like != null) result.like = like;
    return result;
  }

  BroadcastStudio._();

  factory BroadcastStudio.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BroadcastStudio.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BroadcastStudio',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'models'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'logo', $pb.PbFieldType.OY)
    ..aD(5, _omitFieldNames ? '' : 'freq')
    ..aOM<$0.TimeOfDayData>(6, _omitFieldNames ? '' : 'start',
        subBuilder: $0.TimeOfDayData.create)
    ..aOM<$0.TimeOfDayData>(7, _omitFieldNames ? '' : 'end',
        subBuilder: $0.TimeOfDayData.create)
    ..aOB(8, _omitFieldNames ? '' : 'like')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BroadcastStudio clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BroadcastStudio copyWith(void Function(BroadcastStudio) updates) =>
      super.copyWith((message) => updates(message as BroadcastStudio))
          as BroadcastStudio;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BroadcastStudio create() => BroadcastStudio._();
  @$core.override
  BroadcastStudio createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BroadcastStudio getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BroadcastStudio>(create);
  static BroadcastStudio? _defaultInstance;

  /// Outdoor Aerial 服务器给出的广播电台 ID
  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  /// 广播电台的名称
  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  /// 对该广播电台的介绍
  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => $_clearField(3);

  /// 广播电台的 Logo 数据
  @$pb.TagNumber(4)
  $core.List<$core.int> get logo => $_getN(3);
  @$pb.TagNumber(4)
  set logo($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLogo() => $_has(3);
  @$pb.TagNumber(4)
  void clearLogo() => $_clearField(4);

  /// 广播电台的兆赫兹频率
  @$pb.TagNumber(5)
  $core.double get freq => $_getN(4);
  @$pb.TagNumber(5)
  set freq($core.double value) => $_setDouble(4, value);
  @$pb.TagNumber(5)
  $core.bool hasFreq() => $_has(4);
  @$pb.TagNumber(5)
  void clearFreq() => $_clearField(5);

  /// 广播电台的开播时间
  @$pb.TagNumber(6)
  $0.TimeOfDayData get start => $_getN(5);
  @$pb.TagNumber(6)
  set start($0.TimeOfDayData value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasStart() => $_has(5);
  @$pb.TagNumber(6)
  void clearStart() => $_clearField(6);
  @$pb.TagNumber(6)
  $0.TimeOfDayData ensureStart() => $_ensure(5);

  /// 广播电台的晚安时间
  @$pb.TagNumber(7)
  $0.TimeOfDayData get end => $_getN(6);
  @$pb.TagNumber(7)
  set end($0.TimeOfDayData value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasEnd() => $_has(6);
  @$pb.TagNumber(7)
  void clearEnd() => $_clearField(7);
  @$pb.TagNumber(7)
  $0.TimeOfDayData ensureEnd() => $_ensure(6);

  /// 用户是否喜爱该广播电台
  @$pb.TagNumber(8)
  $core.bool get like => $_getBF(7);
  @$pb.TagNumber(8)
  set like($core.bool value) => $_setBool(7, value);
  @$pb.TagNumber(8)
  $core.bool hasLike() => $_has(7);
  @$pb.TagNumber(8)
  void clearLike() => $_clearField(8);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
