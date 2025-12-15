// This is a generated file - do not edit.
//
// Generated from broadcast_program.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'broadcast_datetime.pb.dart' as $1;
import 'broadcast_studio.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// 有关电台节目的数据模型
class BroadcastProgram extends $pb.GeneratedMessage {
  factory BroadcastProgram({
    $core.int? id,
    $core.String? name,
    $core.String? description,
    $core.List<$core.int>? logo,
    $0.BroadcastStudio? studio,
    $core.Iterable<$1.WeekdaysData>? date,
    $1.TimeOfDayData? start,
    $1.TimeOfDayData? end,
    $core.Iterable<$core.String>? hosts,
    $core.bool? like,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (description != null) result.description = description;
    if (logo != null) result.logo = logo;
    if (studio != null) result.studio = studio;
    if (date != null) result.date.addAll(date);
    if (start != null) result.start = start;
    if (end != null) result.end = end;
    if (hosts != null) result.hosts.addAll(hosts);
    if (like != null) result.like = like;
    return result;
  }

  BroadcastProgram._();

  factory BroadcastProgram.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BroadcastProgram.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BroadcastProgram',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'models'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'logo', $pb.PbFieldType.OY)
    ..aOM<$0.BroadcastStudio>(5, _omitFieldNames ? '' : 'studio',
        subBuilder: $0.BroadcastStudio.create)
    ..pc<$1.WeekdaysData>(6, _omitFieldNames ? '' : 'date', $pb.PbFieldType.KE,
        valueOf: $1.WeekdaysData.valueOf,
        enumValues: $1.WeekdaysData.values,
        defaultEnumValue: $1.WeekdaysData.MON)
    ..aOM<$1.TimeOfDayData>(7, _omitFieldNames ? '' : 'start',
        subBuilder: $1.TimeOfDayData.create)
    ..aOM<$1.TimeOfDayData>(8, _omitFieldNames ? '' : 'end',
        subBuilder: $1.TimeOfDayData.create)
    ..pPS(9, _omitFieldNames ? '' : 'hosts')
    ..aOB(10, _omitFieldNames ? '' : 'like')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BroadcastProgram clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BroadcastProgram copyWith(void Function(BroadcastProgram) updates) =>
      super.copyWith((message) => updates(message as BroadcastProgram))
          as BroadcastProgram;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BroadcastProgram create() => BroadcastProgram._();
  @$core.override
  BroadcastProgram createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BroadcastProgram getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BroadcastProgram>(create);
  static BroadcastProgram? _defaultInstance;

  /// Outdoor Aerial 服务器给出的电台节目 ID
  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  /// 电台节目的名称
  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  /// 对该电台节目的介绍
  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => $_clearField(3);

  /// 电台节目的 Logo 数据
  @$pb.TagNumber(4)
  $core.List<$core.int> get logo => $_getN(3);
  @$pb.TagNumber(4)
  set logo($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLogo() => $_has(3);
  @$pb.TagNumber(4)
  void clearLogo() => $_clearField(4);

  /// 电台节目隶属广播电台
  @$pb.TagNumber(5)
  $0.BroadcastStudio get studio => $_getN(4);
  @$pb.TagNumber(5)
  set studio($0.BroadcastStudio value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasStudio() => $_has(4);
  @$pb.TagNumber(5)
  void clearStudio() => $_clearField(5);
  @$pb.TagNumber(5)
  $0.BroadcastStudio ensureStudio() => $_ensure(4);

  /// 电台节目的固定播出日期
  @$pb.TagNumber(6)
  $pb.PbList<$1.WeekdaysData> get date => $_getList(5);

  /// 电台节目的固定播出时间
  @$pb.TagNumber(7)
  $1.TimeOfDayData get start => $_getN(6);
  @$pb.TagNumber(7)
  set start($1.TimeOfDayData value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasStart() => $_has(6);
  @$pb.TagNumber(7)
  void clearStart() => $_clearField(7);
  @$pb.TagNumber(7)
  $1.TimeOfDayData ensureStart() => $_ensure(6);

  /// 电台节目的固定结束时间
  @$pb.TagNumber(8)
  $1.TimeOfDayData get end => $_getN(7);
  @$pb.TagNumber(8)
  set end($1.TimeOfDayData value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasEnd() => $_has(7);
  @$pb.TagNumber(8)
  void clearEnd() => $_clearField(8);
  @$pb.TagNumber(8)
  $1.TimeOfDayData ensureEnd() => $_ensure(7);

  /// 电台节目的主持人
  @$pb.TagNumber(9)
  $pb.PbList<$core.String> get hosts => $_getList(8);

  /// 用户是否喜爱该电台节目
  @$pb.TagNumber(10)
  $core.bool get like => $_getBF(9);
  @$pb.TagNumber(10)
  set like($core.bool value) => $_setBool(9, value);
  @$pb.TagNumber(10)
  $core.bool hasLike() => $_has(9);
  @$pb.TagNumber(10)
  void clearLike() => $_clearField(10);
}

/// 单期电台节目的数据模型
class SingleProgram extends $pb.GeneratedMessage {
  factory SingleProgram({
    BroadcastProgram? partof,
    $1.DateData? time,
    $core.String? title,
    $core.String? abstract,
    $core.List<$core.int>? image,
    $core.bool? favorite,
  }) {
    final result = create();
    if (partof != null) result.partof = partof;
    if (time != null) result.time = time;
    if (title != null) result.title = title;
    if (abstract != null) result.abstract = abstract;
    if (image != null) result.image = image;
    if (favorite != null) result.favorite = favorite;
    return result;
  }

  SingleProgram._();

  factory SingleProgram.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SingleProgram.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SingleProgram',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'models'),
      createEmptyInstance: create)
    ..aOM<BroadcastProgram>(1, _omitFieldNames ? '' : 'partof',
        subBuilder: BroadcastProgram.create)
    ..aOM<$1.DateData>(2, _omitFieldNames ? '' : 'time',
        subBuilder: $1.DateData.create)
    ..aOS(3, _omitFieldNames ? '' : 'title')
    ..aOS(4, _omitFieldNames ? '' : 'abstract')
    ..a<$core.List<$core.int>>(
        5, _omitFieldNames ? '' : 'image', $pb.PbFieldType.OY)
    ..aOB(6, _omitFieldNames ? '' : 'favorite')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SingleProgram clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SingleProgram copyWith(void Function(SingleProgram) updates) =>
      super.copyWith((message) => updates(message as SingleProgram))
          as SingleProgram;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SingleProgram create() => SingleProgram._();
  @$core.override
  SingleProgram createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SingleProgram getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SingleProgram>(create);
  static SingleProgram? _defaultInstance;

  /// 该电台节目的节目信息
  @$pb.TagNumber(1)
  BroadcastProgram get partof => $_getN(0);
  @$pb.TagNumber(1)
  set partof(BroadcastProgram value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasPartof() => $_has(0);
  @$pb.TagNumber(1)
  void clearPartof() => $_clearField(1);
  @$pb.TagNumber(1)
  BroadcastProgram ensurePartof() => $_ensure(0);

  /// 本期电台节目的播出时间
  @$pb.TagNumber(2)
  $1.DateData get time => $_getN(1);
  @$pb.TagNumber(2)
  set time($1.DateData value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearTime() => $_clearField(2);
  @$pb.TagNumber(2)
  $1.DateData ensureTime() => $_ensure(1);

  /// 本期电台节目的主题
  @$pb.TagNumber(3)
  $core.String get title => $_getSZ(2);
  @$pb.TagNumber(3)
  set title($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTitle() => $_has(2);
  @$pb.TagNumber(3)
  void clearTitle() => $_clearField(3);

  /// 本期电台节目的摘要
  @$pb.TagNumber(4)
  $core.String get abstract => $_getSZ(3);
  @$pb.TagNumber(4)
  set abstract($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAbstract() => $_has(3);
  @$pb.TagNumber(4)
  void clearAbstract() => $_clearField(4);

  /// 本期电台节目的配图数据
  @$pb.TagNumber(5)
  $core.List<$core.int> get image => $_getN(4);
  @$pb.TagNumber(5)
  set image($core.List<$core.int> value) => $_setBytes(4, value);
  @$pb.TagNumber(5)
  $core.bool hasImage() => $_has(4);
  @$pb.TagNumber(5)
  void clearImage() => $_clearField(5);

  /// 用户是否收藏本期节目
  @$pb.TagNumber(6)
  $core.bool get favorite => $_getBF(5);
  @$pb.TagNumber(6)
  set favorite($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasFavorite() => $_has(5);
  @$pb.TagNumber(6)
  void clearFavorite() => $_clearField(6);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
