// This is a generated file - do not edit.
//
// Generated from dataproto_program.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'dataproto_status.pbenum.dart' as $2;
import 'dataproto_type.pbenum.dart' as $1;
import 'dataproto_weekday.pbenum.dart' as $3;
import 'google/type/timeofday.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class ProgramPB extends $pb.GeneratedMessage {
  factory ProgramPB({
    $core.int? id,
    $core.int? studio,
    $core.String? name,
    $core.String? description,
    $core.bool? like,
    $1.ProgramTypePB? type,
    $2.ProgramStatusPB? status,
    $0.TimeOfDay? start,
    $0.TimeOfDay? end,
    $core.Iterable<$core.String>? hosts,
    $core.Iterable<$3.ProgramWeekdayPB>? weekday,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (studio != null) result.studio = studio;
    if (name != null) result.name = name;
    if (description != null) result.description = description;
    if (like != null) result.like = like;
    if (type != null) result.type = type;
    if (status != null) result.status = status;
    if (start != null) result.start = start;
    if (end != null) result.end = end;
    if (hosts != null) result.hosts.addAll(hosts);
    if (weekday != null) result.weekday.addAll(weekday);
    return result;
  }

  ProgramPB._();

  factory ProgramPB.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProgramPB.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProgramPB',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'id', fieldType: $pb.PbFieldType.OU3)
    ..aI(2, _omitFieldNames ? '' : 'studio', fieldType: $pb.PbFieldType.OU3)
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOS(4, _omitFieldNames ? '' : 'description')
    ..aOB(5, _omitFieldNames ? '' : 'like')
    ..aE<$1.ProgramTypePB>(6, _omitFieldNames ? '' : 'type',
        enumValues: $1.ProgramTypePB.values)
    ..aE<$2.ProgramStatusPB>(7, _omitFieldNames ? '' : 'status',
        enumValues: $2.ProgramStatusPB.values)
    ..aOM<$0.TimeOfDay>(8, _omitFieldNames ? '' : 'start',
        subBuilder: $0.TimeOfDay.create)
    ..aOM<$0.TimeOfDay>(9, _omitFieldNames ? '' : 'end',
        subBuilder: $0.TimeOfDay.create)
    ..pPS(10, _omitFieldNames ? '' : 'hosts')
    ..pc<$3.ProgramWeekdayPB>(
        11, _omitFieldNames ? '' : 'weekday', $pb.PbFieldType.KE,
        valueOf: $3.ProgramWeekdayPB.valueOf,
        enumValues: $3.ProgramWeekdayPB.values,
        defaultEnumValue: $3.ProgramWeekdayPB.MON)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProgramPB clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProgramPB copyWith(void Function(ProgramPB) updates) =>
      super.copyWith((message) => updates(message as ProgramPB)) as ProgramPB;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProgramPB create() => ProgramPB._();
  @$core.override
  ProgramPB createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ProgramPB getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ProgramPB>(create);
  static ProgramPB? _defaultInstance;

  /// Outdoor Aerial 服务器分配给电台节目的 id
  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  /// 该电台节目隶属广播电台，通过 id 反查广播电台
  @$pb.TagNumber(2)
  $core.int get studio => $_getIZ(1);
  @$pb.TagNumber(2)
  set studio($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStudio() => $_has(1);
  @$pb.TagNumber(2)
  void clearStudio() => $_clearField(2);

  /// 该电台节目的名称，比如 “心花一路·FUN”
  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => $_clearField(3);

  /// 对该电台节目的长文本介绍（可选）
  @$pb.TagNumber(4)
  $core.String get description => $_getSZ(3);
  @$pb.TagNumber(4)
  set description($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDescription() => $_has(3);
  @$pb.TagNumber(4)
  void clearDescription() => $_clearField(4);

  /// 用户是否喜欢该电台节目，若true则为用户订阅里面的节目，若false则为用户屏蔽这个节目（可选）
  @$pb.TagNumber(5)
  $core.bool get like => $_getBF(4);
  @$pb.TagNumber(5)
  set like($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasLike() => $_has(4);
  @$pb.TagNumber(5)
  void clearLike() => $_clearField(5);

  /// 电台节目的类型，比如新闻、音乐、访谈、闲聊等
  @$pb.TagNumber(6)
  $1.ProgramTypePB get type => $_getN(5);
  @$pb.TagNumber(6)
  set type($1.ProgramTypePB value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasType() => $_has(5);
  @$pb.TagNumber(6)
  void clearType() => $_clearField(6);

  /// 电台当前的播出状态，可标记为 “开播”、“重播” 和 “暂播”
  @$pb.TagNumber(7)
  $2.ProgramStatusPB get status => $_getN(6);
  @$pb.TagNumber(7)
  set status($2.ProgramStatusPB value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasStatus() => $_has(6);
  @$pb.TagNumber(7)
  void clearStatus() => $_clearField(7);

  /// 电台节目的固定播出时间，比如节目8点半播出，此处就填写8时30分
  @$pb.TagNumber(8)
  $0.TimeOfDay get start => $_getN(7);
  @$pb.TagNumber(8)
  set start($0.TimeOfDay value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasStart() => $_has(7);
  @$pb.TagNumber(8)
  void clearStart() => $_clearField(8);
  @$pb.TagNumber(8)
  $0.TimeOfDay ensureStart() => $_ensure(7);

  /// 电台节目的固定结束时间，比如节目10点半结束，此处就填写10时30分
  @$pb.TagNumber(9)
  $0.TimeOfDay get end => $_getN(8);
  @$pb.TagNumber(9)
  set end($0.TimeOfDay value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasEnd() => $_has(8);
  @$pb.TagNumber(9)
  void clearEnd() => $_clearField(9);
  @$pb.TagNumber(9)
  $0.TimeOfDay ensureEnd() => $_ensure(8);

  /// 该电台节目的主持人阵容，可以为多个，比如 “晏大胖”
  @$pb.TagNumber(10)
  $pb.PbList<$core.String> get hosts => $_getList(9);

  /// 电台节目的固定播出日期
  @$pb.TagNumber(11)
  $pb.PbList<$3.ProgramWeekdayPB> get weekday => $_getList(10);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
