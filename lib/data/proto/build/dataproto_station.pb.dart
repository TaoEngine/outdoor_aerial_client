// This is a generated file - do not edit.
//
// Generated from dataproto_station.proto.

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
import 'google/type/timeofday.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class RadioStationPB extends $pb.GeneratedMessage {
  factory RadioStationPB({
    $core.int? id,
    $core.List<$core.int>? logo,
    $core.List<$core.int>? banner,
    $core.double? frequency,
    $core.String? name,
    $core.String? description,
    $core.String? institution,
    $core.String? language,
    $core.String? social,
    $core.bool? like,
    $0.TimeOfDay? start,
    $0.TimeOfDay? end,
    $1.StationTypePB? type,
    $2.StationStatusPB? status,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (logo != null) result.logo = logo;
    if (banner != null) result.banner = banner;
    if (frequency != null) result.frequency = frequency;
    if (name != null) result.name = name;
    if (description != null) result.description = description;
    if (institution != null) result.institution = institution;
    if (language != null) result.language = language;
    if (social != null) result.social = social;
    if (like != null) result.like = like;
    if (start != null) result.start = start;
    if (end != null) result.end = end;
    if (type != null) result.type = type;
    if (status != null) result.status = status;
    return result;
  }

  RadioStationPB._();

  factory RadioStationPB.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RadioStationPB.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RadioStationPB',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'id')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'logo', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'banner', $pb.PbFieldType.OY)
    ..aD(4, _omitFieldNames ? '' : 'frequency')
    ..aOS(5, _omitFieldNames ? '' : 'name')
    ..aOS(6, _omitFieldNames ? '' : 'description')
    ..aOS(7, _omitFieldNames ? '' : 'institution')
    ..aOS(8, _omitFieldNames ? '' : 'language')
    ..aOS(9, _omitFieldNames ? '' : 'social')
    ..aOB(10, _omitFieldNames ? '' : 'like')
    ..aOM<$0.TimeOfDay>(11, _omitFieldNames ? '' : 'start',
        subBuilder: $0.TimeOfDay.create)
    ..aOM<$0.TimeOfDay>(12, _omitFieldNames ? '' : 'end',
        subBuilder: $0.TimeOfDay.create)
    ..aE<$1.StationTypePB>(13, _omitFieldNames ? '' : 'type',
        enumValues: $1.StationTypePB.values)
    ..aE<$2.StationStatusPB>(14, _omitFieldNames ? '' : 'status',
        enumValues: $2.StationStatusPB.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RadioStationPB clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RadioStationPB copyWith(void Function(RadioStationPB) updates) =>
      super.copyWith((message) => updates(message as RadioStationPB))
          as RadioStationPB;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RadioStationPB create() => RadioStationPB._();
  @$core.override
  RadioStationPB createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RadioStationPB getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RadioStationPB>(create);
  static RadioStationPB? _defaultInstance;

  /// / Outdoor Aerial 服务器分配给广播电台的 id
  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  /// / 广播电台的 LOGO，将显示在播放器专辑、封面、首页中，和广播电台官方的宣发图一致
  @$pb.TagNumber(2)
  $core.List<$core.int> get logo => $_getN(1);
  @$pb.TagNumber(2)
  set logo($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLogo() => $_has(1);
  @$pb.TagNumber(2)
  void clearLogo() => $_clearField(2);

  /// / 广播电台的横幅，将用于标识节目卡片归属，需要透明 PNG 格式，内容从 LOGO 中选取非文字部分
  @$pb.TagNumber(3)
  $core.List<$core.int> get banner => $_getN(2);
  @$pb.TagNumber(3)
  set banner($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasBanner() => $_has(2);
  @$pb.TagNumber(3)
  void clearBanner() => $_clearField(3);

  /// / 广播电台的频率，存储单位为 “兆赫兹”，比如 “90.8” 指 90.8MHz
  @$pb.TagNumber(4)
  $core.double get frequency => $_getN(3);
  @$pb.TagNumber(4)
  set frequency($core.double value) => $_setDouble(3, value);
  @$pb.TagNumber(4)
  $core.bool hasFrequency() => $_has(3);
  @$pb.TagNumber(4)
  void clearFrequency() => $_clearField(4);

  /// / 该广播电台的名称，比如 “安徽交通广播”
  @$pb.TagNumber(5)
  $core.String get name => $_getSZ(4);
  @$pb.TagNumber(5)
  set name($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasName() => $_has(4);
  @$pb.TagNumber(5)
  void clearName() => $_clearField(5);

  /// / 对该广播电台的长文本介绍（可选）
  @$pb.TagNumber(6)
  $core.String get description => $_getSZ(5);
  @$pb.TagNumber(6)
  set description($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasDescription() => $_has(5);
  @$pb.TagNumber(6)
  void clearDescription() => $_clearField(6);

  /// / 该广播电台所属单位，比如 “安徽广播电视台”
  @$pb.TagNumber(7)
  $core.String get institution => $_getSZ(6);
  @$pb.TagNumber(7)
  set institution($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasInstitution() => $_has(6);
  @$pb.TagNumber(7)
  void clearInstitution() => $_clearField(7);

  /// / 该广播电台的播出语言，指定存储 ISO 标准地区代码方便解析，比如 “zh_CN”
  @$pb.TagNumber(8)
  $core.String get language => $_getSZ(7);
  @$pb.TagNumber(8)
  set language($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasLanguage() => $_has(7);
  @$pb.TagNumber(8)
  void clearLanguage() => $_clearField(8);

  /// / 该广播电台拥有的社媒账号，点击就能跳转到指定平台（可选）
  @$pb.TagNumber(9)
  $core.String get social => $_getSZ(8);
  @$pb.TagNumber(9)
  set social($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasSocial() => $_has(8);
  @$pb.TagNumber(9)
  void clearSocial() => $_clearField(9);

  /// / 用户是否喜爱该广播电台
  @$pb.TagNumber(10)
  $core.bool get like => $_getBF(9);
  @$pb.TagNumber(10)
  set like($core.bool value) => $_setBool(9, value);
  @$pb.TagNumber(10)
  $core.bool hasLike() => $_has(9);
  @$pb.TagNumber(10)
  void clearLike() => $_clearField(10);

  /// / 广播电台的开播时间，比如广播电台在5点开台，此处就填写5时0分
  @$pb.TagNumber(11)
  $0.TimeOfDay get start => $_getN(10);
  @$pb.TagNumber(11)
  set start($0.TimeOfDay value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasStart() => $_has(10);
  @$pb.TagNumber(11)
  void clearStart() => $_clearField(11);
  @$pb.TagNumber(11)
  $0.TimeOfDay ensureStart() => $_ensure(10);

  /// / 广播电台的晚安时间，比如广播电台在23点晚安，此处就填写23时0分
  @$pb.TagNumber(12)
  $0.TimeOfDay get end => $_getN(11);
  @$pb.TagNumber(12)
  set end($0.TimeOfDay value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasEnd() => $_has(11);
  @$pb.TagNumber(12)
  void clearEnd() => $_clearField(12);
  @$pb.TagNumber(12)
  $0.TimeOfDay ensureEnd() => $_ensure(11);

  /// / 广播电台的类型，比如交通、新闻、经济、综合等
  @$pb.TagNumber(13)
  $1.StationTypePB get type => $_getN(12);
  @$pb.TagNumber(13)
  set type($1.StationTypePB value) => $_setField(13, value);
  @$pb.TagNumber(13)
  $core.bool hasType() => $_has(12);
  @$pb.TagNumber(13)
  void clearType() => $_clearField(13);

  /// / 广播电台当前的播出状态，可标记为 “广播中”、“停机检修” 和 “停播”
  @$pb.TagNumber(14)
  $2.StationStatusPB get status => $_getN(13);
  @$pb.TagNumber(14)
  set status($2.StationStatusPB value) => $_setField(14, value);
  @$pb.TagNumber(14)
  $core.bool hasStatus() => $_has(13);
  @$pb.TagNumber(14)
  void clearStatus() => $_clearField(14);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
